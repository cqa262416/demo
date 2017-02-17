package com.xiaoyao.controlller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by xiaoyao on 17-2-17.
 *
 */
@Controller
public class LoginController {
    //登录
    @RequestMapping(value = "/")
    public String login(){
        return "login.html";
    }
}
