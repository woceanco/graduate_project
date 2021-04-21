<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>后台管理-登陆</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" type="text/css" href="/static/layui/css/layui.css" media="all">
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <style>
        body {background-image:url("/static/images/bg.jpg");height:100%;width:100%;}
        #container{height:100%;width:100%;}
        input:-webkit-autofill {-webkit-box-shadow:inset 0 0 0 1000px #fff;background-color:transparent;}
        .admin-login-background {width:300px;height:300px;position:absolute;left:50%;top:40%;margin-left:-150px;margin-top:-100px;}
        .admin-header {text-align:center;margin-bottom:20px;color:#ffffff;font-weight:bold;font-size:40px}
        .admin-input {border-top-style:none;border-right-style:solid;border-bottom-style:solid;border-left-style:solid;height:50px;width:300px;padding-bottom:0px;}
        .admin-input::-webkit-input-placeholder {color:#a78369}
        .layui-icon-username {color:#a78369 !important;}
        .layui-icon-username:hover {color:#9dadce !important;}
        .layui-icon-password {color:#a78369 !important;}
        .layui-icon-password:hover {color:#9dadce !important;}
        .admin-input-username {border-top-style:solid;border-radius:10px 10px 0 0;}
        .admin-input-verify {border-radius:0 0 10px 10px;}
        .admin-button {margin-top:20px;font-weight:bold;font-size:18px;width:300px;height:50px;border-radius:5px;background-color:#a78369;border:1px solid #d8b29f}
        .admin-icon {margin-left:260px;margin-top:10px;font-size:30px;}
        i {position:absolute;}
        .admin-captcha {position:absolute;margin-left:205px;margin-top:-40px;}
        .layui-inline{
            margin: 0 auto;
            padding: 0px;
        }
        .codeInput {
            margin: 0;
            padding: 0;
            width: 120px;
            height: 50px;
            float: right;
            display: inline-block;
            border: 0;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<div id="container layui-anim layui-anim-upbit">
    <div></div>
    <div class="admin-login-background">
        <div class="admin-header">
            <span>易杰员工管理</span>
        </div>
        <form class="layui-form " action="" method="post">
            <div>
                <i class="layui-icon layui-icon-username admin-icon"></i>
                <input type="text" id="username" name="username" placeholder="请输入用户名" autocomplete="off" class="layui-input admin-input admin-input-username" value="" >
            </div>
            <div>
                <i class="layui-icon layui-icon-password admin-icon"></i>
                <input type="password" id="password" name="password" placeholder="请输入密码" autocomplete="off" class="layui-input admin-input" value="" >
            </div>
            <div class="layui-form-item" style="height: 51px">
                <div class="layui-inline" style="width: 155px;height: 50px"><input type="text" id="inputCode" name="captcha" placeholder="请输入验证码" autocomplete="off" class="layui-input admin-input admin-input-verify" value=""></div>
                <div class="layui-inline" style="width: 120px;height: 50px;"><input id="loginCode" class="layui-input codeInput"  type="button"></div>
                <!--<img class="admin-captcha" width="90" height="30" src="../images/captcha.jpg">-->

            </div>
            <button type="button" class="layui-btn admin-button" id="btn" lay-submit="" lay-filter="login">登 陆</button>
            <input type="hidden" id="logincheck" name="logincheck" value="${result}">
            <input type="hidden" id="path" name="path" value="${pageContext.request.contextPath}">
        </form>

    </div>
</div>
<script src="/static/js/jquery-3.4.1.min.js"></script>
<script src="/static/layui/layui.js" charset="utf-8"></script>

<script>

    var layer;
    layui.use(['layer'],function () {
         layer = layui.layer;
    })
    $(function () {
        // 页面初始化生成验证码
        window.onload = createCode('#loginCode');
        // 验证码切换
        $('#loginCode').click(function () {
            createCode('#loginCode');
        });
        // 登陆事件
        $('#btn').click(function () {
            login();
        });
        // 注册事件
        /*$('#loginRegister').click(function () {
            register();
        });*/
    });

    // 生成验证码
    function createCode(codeID) {
        var code = "";
        // 验证码长度
        var codeLength = 4;
        // 验证码dom元素
        var checkCode = $(codeID);
        // 验证码随机数
        var random = [0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R',
            'S','T','U','V','W','X','Y','Z'];
        for (var i = 0;i < codeLength; i++){
            // 随机数索引
            var index = Math.floor(Math.random()*36);
            code += random[index];
        }
        // 将生成的随机验证码赋值
        checkCode.val(code);
    }
    // 校验验证码、用户名、密码
    function validateCode(inputCode,codeID) {
        var inputCode = $(inputCode).val().toUpperCase();
        var loginCode = $(codeID).val();
        var loginUsername = $('#username').val();
        var loginPassword = $('#password').val();
        if ($.trim(loginUsername) == '' || $.trim(loginUsername).length<=0){
            layer.msg("用户名不能为空");
            return false;
        }
        if ($.trim(loginPassword) == '' || $.trim(loginPassword).length<=0){
            layer.msg("密码不能为空");
            return false;
        }
        if (inputCode.length<=0){
            layer.msg("验证码不能为空");
            return false;
        }
        if (inputCode != loginCode){
            layer.msg("请输入正确验证码");
            return false;
        }
        return true;
    }
    // 登录流程
    function login() {
        if (!validateCode('#inputCode','#loginCode')){
            createCode('#loginCode');
            //阻断提示
        }else {
            var path = $('#path').val();
            var params = {};
            params.loginName = $('#username').val();
            params.password = $('#password').val();
            //var loginLoadIndex = layer.load(2);
            $('#btn').val("正在登录...");
            $.ajax({
                type:'post',
                url:path+'/logincheck',
                dataType:'json',
                data:params,
                success:function (data) {
                    //layer.close(loginLoadIndex);
                    if (data.result == 'success'){
                        layer.msg("登录成功")
                        window.location.href = path+"/welcome";
                    }else if (data.result == 'error'){
                        layer.msg("密码错误")
                    }else if (data.result == 'unexits'){
                        layer.msg("账号不存在")
                    }
                },
                error:function () {
                  //  layer.close(loginLoadIndex);
                    //alert("dddddd")
                    layer.msg("登陆失败")
                    $('#btn').val("登录");
                }
            });
            return false;
        }
    }

</script>
</body>
</html>