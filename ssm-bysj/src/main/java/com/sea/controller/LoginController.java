package com.sea.controller;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sea.aop.LoggerAnno;
import com.sea.common.Constants;
import com.sea.pojo.User;
import com.sea.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
public class LoginController {
    @Autowired
    private UserService userService;

    @LoggerAnno(operatorType = "进入首页")
    @RequestMapping("/welcome")
    public String loginSuccess() {
        return "welcome";
    }


    @RequestMapping("/logincheck")
    @ResponseBody
    public String loginCheck(String loginName, String password, HttpSession session) throws JsonProcessingException {

        Subject subject = SecurityUtils.getSubject();
        Map<String, String> map = new HashMap<>();
        ObjectMapper mapper = new ObjectMapper();
        //User user = userService.queryByLogin(loginName);
        if (!subject.isAuthenticated()) {
                //System.out.println("登录成功");
                //session.setAttribute(Constants.USER_SESSION, user);
                //return mapper.writeValueAsString(map);
            UsernamePasswordToken token = new UsernamePasswordToken(loginName,password,false);
            try {
                subject.login(token);
                System.out.println("loginController---------");
                map.put("result", "success");
                User user = userService.queryByLogin(loginName);
                subject.getSession().setAttribute(Constants.USER_SESSION,user);
            }catch (UnknownAccountException ex) {
                //用户名不存在
                map.put("result", "unexits");
            } catch (IncorrectCredentialsException ex) {
                map.put("result", "error");
            }
        }
        return mapper.writeValueAsString(map);
    }

    @RequestMapping("/login")
    public String login() {
        //System.out.println("lgoin");
        return "login";
    }

    /*@RequestMapping("/")
    public String loginPath(){
        System.out.println("lgoin");
        return "login";
    }*/

    @LoggerAnno(operatorType = "退出登录")
    @RequestMapping("/exit")
    public String exit() {
        //SecurityUtils.getSubject().logout();
        return "login";
    }
}
