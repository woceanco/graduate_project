package com.sea.aop;

import com.sea.common.Constants;
import com.sea.common.IpAddr;
import com.sea.pojo.OperLog;
import com.sea.pojo.User;
import com.sea.service.OperLogService;
import org.apache.shiro.SecurityUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;

@Component
@Aspect
public class LogAop {

    private static final Logger logger = LoggerFactory.getLogger(LogAop.class);
    @Autowired
    private OperLogService operLogService;

    private HttpServletRequest request;
    @Autowired
    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }

    /**
     * Controller层切点
     */
    @Pointcut("@annotation(com.sea.aop.LoggerAnno)")
    public void aopPointcut(){
    }

    @After(value = "aopPointcut() && @annotation(loggerAnno)")
    public void doAfter(JoinPoint joinPoint, LoggerAnno loggerAnno){

        OperLog operLog = new OperLog();
        //获取注解对象
        Signature signature = joinPoint.getSignature();
        String classname = joinPoint.getTarget().getClass().getSimpleName();
        //signature.getClass().getName();
        String method = signature.getName();
        //获取request
        String requestMethod = request.getMethod();
        String ip = IpAddr.getIpAddress(request);
        String url = request.getRequestURL().toString();

        String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        User user = (User) WebUtils.getSessionAttribute(request, Constants.USER_SESSION);
        //User user = (User) SecurityUtils.getSubject().getSession().getAttribute(Constants.USER_SESSION);
        //logger.info(user.toString());
        String name = user.getLoginName();

        String operatorType = loggerAnno.operatorType();

        operLog.setClassname(classname);
        operLog.setMethod(method);
        operLog.setOperatorType(operatorType);
        operLog.setOperIp(ip);
        operLog.setOperName(name);
        operLog.setOperUrl(url);
        operLog.setOperTime(time);
        operLog.setRequestMethod(requestMethod);

        //operLogService.addOperLog(operLog);
        logger.info("[ {} ] > {} - {} > {} : {}()",operatorType,url,requestMethod,classname,method);
    }

}
