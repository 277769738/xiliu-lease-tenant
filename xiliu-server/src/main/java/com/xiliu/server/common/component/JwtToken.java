package com.xiliu.server.common.component;

import cn.hutool.extra.servlet.ServletUtil;
import cn.hutool.http.useragent.UserAgent;
import cn.hutool.http.useragent.UserAgentUtil;
import com.xiliu.common.component.redis.RedisCache;
import com.xiliu.common.constant.CacheConstants;
import com.xiliu.common.constant.Constants;
import com.xiliu.common.constant.SecurityConstants;
import com.xiliu.common.utils.ServletUtils;
import com.xiliu.common.utils.StringUtils;
import com.xiliu.common.utils.ip.AddressUtils;
import com.xiliu.common.utils.ip.IpUtils;
import com.xiliu.common.utils.uuid.IdUtils;
import com.xiliu.server.common.domain.LoginUser;
import com.xiliu.server.common.security.entity.JwtUser;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * @author xiliu
 * @description token 组件
 * @date 2021/9/6
 */
@Slf4j
@Component
public class JwtToken {

    private static final String CLAIM_KEY_USERNAME = "sub";
    private static final String CLAIM_KEY_CREATED = "created";
    private static final Long MILLIS_MINUTE_TEN = 20 * 60 * 1000L;

    @Value("${jwt.secret}")
    private String secret;
    @Value("${jwt.expiration}")
    private Long expire;
    @Value("${jwt.tokenHeader}")
    private String tokenHeader;
    @Value("${jwt.tokenHead}")
    private String tokenHead;

    @Autowired
    private RedisCache redisCache;


    /**
     * 从token中获取登录用户名
     */
    public String getUserNameFromToken(String token) {
        String username;
        try {
            Claims claims = getClaimsFromToken(token);
            username =  claims.getSubject();
        } catch (Exception e) {
            username = null;
        }
        return username;
    }
    /**
     * 校验token
     */
    public boolean validateToken(String token, UserDetails userDetails) {
        String username = getUserNameFromToken(token);
        return username.equals(userDetails.getUsername()) && !isTokenExpired(token);
    }
    /**
     * 根据用户信息生成token
     */
    public String generateToken(UserDetails userDetails) {
        Map<String, Object> claims = new HashMap<>();
        claims.put(CLAIM_KEY_USERNAME, userDetails.getUsername());
        claims.put(CLAIM_KEY_CREATED, new Date());
        return generateToken(claims);
    }

    /**
     * 创建令牌
     * @param jwtUser 用户信息
     * @return 令牌
     */
    public String createToken(JwtUser jwtUser) {
        String token = IdUtils.fastUUID();
        jwtUser.setToken(token);
        setUserAgent(jwtUser);
        refresToken(jwtUser);

        Map<String, Object> claims = new HashMap<>();
        claims.put(Constants.LOGIN_USER_KEY, token);
        return createToken(claims);
    }
    /**
     * 从数据声明生成令牌
     * @param claims 数据声明
     * @return 令牌
     */
    private String createToken(Map<String, Object> claims) {
        String token = Jwts.builder().setClaims(claims).signWith(SignatureAlgorithm.HS512, secret).compact();
        return token;
    }

    /**
     * 判断token是否已经失效
     */
    private boolean isTokenExpired(String token) {
        Date expiredDate = getClaimsFromToken(token).getExpiration();
        return expiredDate.before(new Date());
    }

    private String generateToken(Map<String, Object> claims) {
        return Jwts.builder()
                .setClaims(claims)
                .setExpiration(generateExpirationDate())
                //签名算法
                .signWith(SignatureAlgorithm.HS512, secret)
                .compact();
    }

    /**
     * 生成token的过期时间
     */
    private Date generateExpirationDate() {
        return new Date(System.currentTimeMillis() + expire * 1000);
    }

    /**
     * 从令牌中获取数据声明
     * @param token 令牌
     * @return 数据声明
     */
    private Claims getClaimsFromToken(String token) {
        Claims claims = null;
        try {
            claims = Jwts.parser()
                    .setSigningKey(secret)
                    .parseClaimsJws(token)
                    .getBody();
        } catch (Exception e) {
            log.info("JWT格式验证失败:{}",token);
        }
        return claims;
    }

    /**
     * 设置用户代理信息
     * @param jwtUser 登录信息
     */
    public void setUserAgent(JwtUser jwtUser) {
        UserAgent userAgent = UserAgentUtil.parse(ServletUtils.getRequest().getHeader("User-Agent"));
        String ip = ServletUtil.getClientIP(ServletUtils.getRequest());
        //String ip = IpUtils.getIpAddr(ServletUtils.getRequest());
        jwtUser.setIpaddr(ip);
        jwtUser.setLoginLocation(AddressUtils.getRealAddressByIp(ip));
        jwtUser.setBrowser(userAgent.getBrowser().getName());
        jwtUser.setOs(userAgent.getOs().getName());
    }

    public void refresToken(JwtUser jwtUser) {
        jwtUser.setLoginTime(System.currentTimeMillis());
        jwtUser.setExpireTime(jwtUser.getLoginTime() + expire * 1000);
        String userKey = getTokenKey(jwtUser.getToken());
        redisCache.setCacheObject(userKey, jwtUser,expire, TimeUnit.SECONDS);
    }

    private String getTokenKey(String uuid) {
        return CacheConstants.LOGIN_TOKEN_KEY + uuid;
    }
    /**
     * 获取登录用户身份信息
     * @return 用户信息
     */
    public JwtUser getLoginUser(HttpServletRequest request) {
        String token = getToken(request);
        if (StringUtils.isNotEmpty(token)) {
            try {
                Claims claims = getClaimsFromToken(token);
                String uuid = (String) claims.get(Constants.LOGIN_USER_KEY);
                String userKey = getTokenKey(uuid);
                JwtUser user = redisCache.getCacheObject(userKey);
                return user;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    /**
     * 获取请求token
     * @param request
     * @return token
     */
    private String getToken(HttpServletRequest request) {
        // 获取请求头
        String token = request.getHeader(tokenHeader);
        if (StringUtils.isNotEmpty(token) && token.startsWith(tokenHead)) {
            token = token.replace(tokenHead,"");
        }
        return token;
    }
    /**
     * 验证令牌有效期，相差不足20分钟，自动刷新缓存
     * @param jwtUser
     * @return 令牌
     */
    public void verifyToken(JwtUser jwtUser) {
        long expireTime = jwtUser.getExpireTime();
        long currentTime = System.currentTimeMillis();
        if (expireTime - currentTime <= MILLIS_MINUTE_TEN) {
            refresToken(jwtUser);
        }
    }

    /**
     * 删除用户身份信息
     */
    public void removeJwtUser(String token) {
        if (StringUtils.isNotEmpty(token)) {
            String userKey = getTokenKey(token);
            redisCache.deleteObject(userKey);
        }
    }
    /**
     * 创建令牌
     */
    public Map<String, Object> createToken(LoginUser loginUser) {
        String token = IdUtils.fastUUID();
        Long userId = loginUser.getUser().getUserId();
        String userName = loginUser.getUser().getUserCode();
        Long tenantId = loginUser.getUser().getTenantId();
        Long deptId = loginUser.getUser().getDeptId();
        loginUser.setToken(token);
        loginUser.setUserId(userId);
        loginUser.setUserName(userName);
        loginUser.setIpaddr(IpUtils.getIpAddr(ServletUtils.getRequest()));
        //添加地址信息
        setUserAgent(loginUser);
        refreshToken(loginUser);

        // Jwt存储信息
        Map<String, Object> claimsMap = new HashMap<String, Object>();
        claimsMap.put(SecurityConstants.USER_KEY, token);
        claimsMap.put(SecurityConstants.DETAILS_USER_ID, userId);
        claimsMap.put(SecurityConstants.DETAILS_USERNAME, userName);
        //租户id
        claimsMap.put(SecurityConstants.DETAILS_TENANT_ID, tenantId);
        //部门id
        claimsMap.put(SecurityConstants.DETAILS_DEPT_ID, deptId);
        // 接口返回信息
        Map<String, Object> rspMap = new HashMap<String, Object>();
        rspMap.put("token", this.createToken(claimsMap));
        rspMap.put("expires_in", expire);
        rspMap.put("tenant_id", tenantId);
        rspMap.put("tokenHead", tokenHead);
        return rspMap;
    }

    /**
     * 设置用户代理信息
     * @param loginUser 登录信息
     */
    public void setUserAgent(LoginUser loginUser) {
        UserAgent userAgent = UserAgentUtil.parse(ServletUtils.getRequest().getHeader("User-Agent"));
        String ip = ServletUtil.getClientIP(ServletUtils.getRequest());
        //String ip = IpUtils.getIpAddr(ServletUtils.getRequest());
        loginUser.setIpaddr(ip);
        loginUser.setLoginLocation(AddressUtils.getRealAddressByIp(ip));
        loginUser.setBrowser(userAgent.getBrowser().getName());
        loginUser.setOs(userAgent.getOs().getName());
    }
    /**
     * 刷新令牌有效期
     *
     * @param loginUser 登录信息
     */
    public void refreshToken(LoginUser loginUser) {
        loginUser.setLoginTime(System.currentTimeMillis());
        loginUser.setExpireTime(loginUser.getLoginTime() + expire);
        // 根据uuid将loginUser缓存
        String userKey = getTokenKey(loginUser.getToken());
        redisCache.setCacheObject(userKey, loginUser, expire, TimeUnit.MINUTES);
    }
    /**
     * 获取登录用户身份信息
     * @return 用户信息
     */
    public LoginUser getNewLoginUser(HttpServletRequest request) {
        String token = getToken(request);
        if (StringUtils.isNotEmpty(token)) {
            try {
                Claims claims = getClaimsFromToken(token);
                String uuid = (String) claims.get(SecurityConstants.USER_KEY);
                String userKey = getTokenKey(uuid);
                LoginUser loginUser = redisCache.getCacheObject(userKey);
                com.xiliu.common.context.SecurityContextHolder.set(SecurityConstants.DETAILS_TENANT_ID, loginUser.getUser().getTenantId());
                com.xiliu.common.context.SecurityContextHolder.set(SecurityConstants.LOGIN_USER, loginUser);
                return loginUser;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }
    /**
     * 验证令牌有效期，相差不足20分钟，自动刷新缓存
     * @param loginUser
     * @return 令牌
     */
    public void verifyToken(LoginUser loginUser) {
        long expireTime = loginUser.getExpireTime();
        long currentTime = System.currentTimeMillis();
        if (expireTime - currentTime <= MILLIS_MINUTE_TEN) {
            refreshToken(loginUser);
        }
    }
}
