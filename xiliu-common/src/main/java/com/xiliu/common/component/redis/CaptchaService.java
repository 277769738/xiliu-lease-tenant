package com.xiliu.common.component.redis;

import cn.hutool.core.util.StrUtil;

import com.xiliu.common.constant.CacheConstants;
import com.xiliu.common.domain.Captcha;
import com.xiliu.common.utils.CaptchaUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Service;

import java.awt.image.BufferedImage;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

/**
 * 验证码服务
 * @author
 */
@Service
public class CaptchaService {
    /**
     * 拼图验证码允许偏差
     **/
    private static Integer ALLOW_DEVIATION = 3;

    @Autowired
    private StringRedisTemplate stringRedisTemplate;

    /**
     * 校验验证码
     * @param imageKey
     * @param imageCode
     * @return boolean
     **/
    public String checkImageCode(String imageKey, String imageCode) {
        ValueOperations<String, String> ops = stringRedisTemplate.opsForValue();
        String text = ops.get(CacheConstants.CAPTCHA_CODE_KEY + imageKey);
        if(StrUtil.isBlank(text)){
            return "验证码已失效";
        }
        // 根据移动距离判断验证是否成功
        if (Math.abs(Integer.parseInt(text) - Integer.parseInt(imageCode)) > ALLOW_DEVIATION) {
            return "验证失败，请控制拼图对齐缺口";
        }
        return null;
    }
    /**
     * 缓存验证码，有效期15分钟
     * @param key
     * @param code
     **/
    public void saveImageCode(String key, String code) {
        ValueOperations<String, String> ops = stringRedisTemplate.opsForValue();
        ops.set(CacheConstants.CAPTCHA_CODE_KEY + key, code, 15, TimeUnit.MINUTES);
    }

    /**
     * 获取验证码拼图（生成的抠图和带抠图阴影的大图及抠图坐标）
     **/
    public Object getCaptcha(Captcha captcha) {
        //参数校验
        CaptchaUtils.checkCaptcha(captcha);
        //获取画布的宽高
        int canvasWidth = captcha.getCanvasWidth();
        int canvasHeight = captcha.getCanvasHeight();
        //获取阻塞块的宽高/半径
        int blockWidth = captcha.getBlockWidth();
        int blockHeight = captcha.getBlockHeight();
        int blockRadius = captcha.getBlockRadius();
        //获取资源图
        BufferedImage canvasImage = CaptchaUtils.getBufferedImage(captcha.getPlace());
        //调整原图到指定大小
        canvasImage = CaptchaUtils.imageResize(canvasImage, canvasWidth, canvasHeight);
        //随机生成阻塞块坐标
        int blockX = CaptchaUtils.getNonceByRange(blockWidth, canvasWidth - blockWidth - 10);
        int blockY = CaptchaUtils.getNonceByRange(10, canvasHeight - blockHeight + 1);
        //阻塞块
        BufferedImage blockImage = new BufferedImage(blockWidth, blockHeight, BufferedImage.TYPE_4BYTE_ABGR);
        //新建的图像根据轮廓图颜色赋值，源图生成遮罩
        CaptchaUtils.cutByTemplate(canvasImage, blockImage, blockWidth, blockHeight, blockRadius, blockX, blockY);
        // 移动横坐标
        String nonceStr = UUID.randomUUID().toString().replaceAll("-", "");
        // 缓存
        saveImageCode(nonceStr,String.valueOf(blockX));
        //设置返回参数
        captcha.setNonceStr(nonceStr);
        captcha.setBlockY(blockY);
        captcha.setBlockSrc(CaptchaUtils.toBase64(blockImage, "png"));
        captcha.setCanvasSrc(CaptchaUtils.toBase64(canvasImage, "png"));
        return captcha;
    }
}
