<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>易杰员工信息管理系统</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/static/css/style.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/static/css/public.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/static/css/font.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/static/layui/css/layui.css"/>
    <link rel="stylesheet" href="/static/layui/css/modules/layui-icon-extend/iconfont.css">
    <style>
        #calendar-control {
            padding: 10px;
            margin-left: 1000px;
            height: 300px;
            width: 300px;
            text-align: center;
        }

    </style>
</head>
<body>
<!--头部-->
<header class="publicHeader">

    <i class="layui-icon iconfont layui-extend-xitong"></i>
    <h1>易杰员工信息管理系统</h1>
    <div class="publicHeaderR">
        <p><span>您好！</span><span style="color: #fff21b"> ${userSession.loginName }</span> , 欢迎你！</p>
        <a href="${pageContext.request.contextPath }/exit">退出</a>
    </div>
</header>
<!--主体内容-->
<section class="publicMian ">
    <div class="left">
        <h2 class="leftH2">功能列表</h2>
        <nav>
            <ul class="list">
                <li>
                    <svg class="icon" aria-hidden="true">
                        <use xlink:href="#icon-biaoqiankuozhan_shouye-381"></use>
                    </svg>
                    <a href="${pageContext.request.contextPath }/welcome">信息管理首页</a></li>
                <li>
                    <svg class="icon" aria-hidden="true">
                        <use xlink:href="#icon-bumenguanli"></use>
                    </svg>
                    <a href="${pageContext.request.contextPath }/dept/list">部门信息管理</a></li>
                <li>
                    <svg class="icon" aria-hidden="true">
                        <use xlink:href="#icon-bao"></use>
                    </svg>
                    <a href="${pageContext.request.contextPath }/post/list">职位信息管理</a></li>
                <li>
                    <svg class="icon" aria-hidden="true">
                        <use xlink:href="#icon-yuangong"></use>
                    </svg>
                    <a href="${pageContext.request.contextPath }/user/list">员工信息管理</a></li>
                <li>
                    <svg class="icon" aria-hidden="true">
                        <use xlink:href="#icon-daily-fill"></use>
                    </svg>
                    <a href="${pageContext.request.contextPath }/operlog/list">日志管理页面</a></li>
                <li>
                    <svg class="icon" aria-hidden="true">
                        <use xlink:href="#icon-jiaosequanxian"></use>
                    </svg>
                    <a href="${pageContext.request.contextPath }/role/list">角色管理页面</a></li>
                <li>
                    <svg class="icon" aria-hidden="true">
                        <use xlink:href="#icon-gonggao"></use>
                    </svg>
                    <a href="${pageContext.request.contextPath }/notice/list">公告管理页面</a></li>
                <li>
                    <svg class="icon" aria-hidden="true">
                        <use xlink:href="#icon-mimaxiugai"></use>
                    </svg>
                    <a href="${pageContext.request.contextPath }/user/pwdmodify.jsp">密码修改</a></li>
                <li>
                    <svg class="icon" aria-hidden="true">
                        <use xlink:href="#icon-tuichuxitong"></use>
                    </svg>
                    <a href="${pageContext.request.contextPath }/exit">退出系统</a></li>
            </ul>
        </nav>
    </div>
    <input type="hidden" id="path" name="path" value="${pageContext.request.contextPath }"/>
    <input type="hidden" id="referer" name="referer" value="<%=request.getHeader("Referer")%>"/>
    <div class="right">
        <div><img class="wColck" src="${pageContext.request.contextPath }/static/images/clock.jpg" alt=""/></div>
        <div class="wFont">
            <h2>${userSession.loginName }</h2>
            <p>欢迎来到易杰员工信息管理系统!</p>
        </div>
        <div class="date">
            <!--显示日历的div-->
            <div id="calendar-control"></div>
        </div>
    </div>
</section>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/time.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/layui/layui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/iconfont.js"></script>
<!--绑定日历控件-->
<script>
    layui.use('laydate', function () {
        var laydate = layui.laydate;
        laydate.render({
            elem: '#calendar-control',                     //绑定日历控件
            position: 'static',
            theme: '#dfaaf1',                              //主题颜色
            showBottom: false,                              //去掉日历下面的一行按钮
            change: function (value, date) {                 //监听日期被切换,触发此函数
                //lay('#calendar-date').html(value);
            }
        });
    })

</script>
</body>
</html>