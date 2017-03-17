package com.xiaoyao.controlller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.impl.SLF4JLogFactory;
import org.apache.log4j.Logger;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by xiaoyao on 17-2-17.
 *
 */
@Controller
public class LoginController {

    private static Logger logger = Logger.getLogger(LoginController.class);
    //成功
    @RequestMapping(value = "/")
    public String login(){
        //System.out.println("login success!!!");
        return "login.html";
    }

    @Scheduled(fixedDelay = 1000, initialDelay = 100)
    public void worker(){
        logger.info("xiaoyao Welcom to you!!!");
        System.out.println("xiaoyao Welcom to you!!!");
    }
}
