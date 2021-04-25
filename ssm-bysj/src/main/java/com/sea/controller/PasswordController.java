package com.sea.controller;

import com.sea.aop.LoggerAnno;
import com.sea.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/pwd")
public class PasswordController {

    @Autowired
    private UserService userService;

    @LoggerAnno(operatorType = "修改密码")
    @RequestMapping("/updatepwd")
    public String updatePwd(String loginName,String newPassword,Model model){

        boolean result = userService.updatePassword(loginName,newPassword);

        if (result){
            model.addAttribute("result","ok");
            return "redirect:/exit";
        }
        model.addAttribute("result","error");
        return "redirect:/updatepwd";
    }

    @RequestMapping("/pwdmodify")
    public String pwdModify(){
        System.out.println("pwdddddddddddddd");
        return "user/pwdmodify";
    }
}
