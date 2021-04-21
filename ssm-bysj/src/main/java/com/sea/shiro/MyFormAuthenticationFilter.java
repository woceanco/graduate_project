package com.sea.shiro;

import com.sea.common.Constants;
import com.sea.pojo.User;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.apache.shiro.web.util.WebUtils;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpSession;

public class MyFormAuthenticationFilter extends FormAuthenticationFilter {

    @Override
    protected boolean onLoginSuccess(AuthenticationToken token, Subject subject, ServletRequest request, ServletResponse response) throws Exception {


        System.out.println("MyFormAuthenticationFilter---------");
        if (subject == null) {
            // 没有登录
            return false;
        }
        Object attribute = subject.getSession().getAttribute(Constants.USER_SESSION);
        if (attribute == null) {
            // 你自己的逻辑
            User user = (User) subject.getPrincipal();
            subject.getSession(true);
            subject.getSession().setAttribute(Constants.USER_SESSION,user);
        }

        return super.onLoginSuccess(token, subject, request, response);
    }
}
