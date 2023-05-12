package com.xiliu.common.controller;


import com.xiliu.common.component.redis.CaptchaService;
import com.xiliu.common.domain.Captcha;
import com.xiliu.common.result.R;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author xiliu
 * @description 验证码前端控制器
 * @date 2022/7/7
 */
@RestController
@RequestMapping("/captcha")
public class CaptchaController {

    @Autowired
    private CaptchaService captchaService;

    @ApiOperation(value = "生成验证码拼图")
    @PostMapping("get-captcha")
    public R getCaptcha(@RequestBody Captcha captcha) {
        return R.ok(captchaService.getCaptcha(captcha));
    }

}
