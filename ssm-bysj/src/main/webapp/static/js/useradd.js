//var userCode = null;
//var userPassword = null;
//var ruserPassword = null;
var phone = null;
var userName = null;
var loginName = null;
var email = null;
//var birthday = null;
//var userRole = null;
var post = null
var dept = null
var role = null
var addBtn = null;
var backBtn = null;


$(function () {
    loginName = $("#loginName");
    userName = $("#userName");
    phone = $("#phonenumber");
    email = $("#email");
    post = $("#postId");
    dept = $("#deptId");
    role = $("#roleId");
    addBtn = $("#add");
    backBtn = $("#back");
    //初始化的时候，要把所有的提示信息变为：* 以提示必填项，更灵活，不要写在页面上
    userName.next().html("*");
    post.next().html("*");
    dept.next().html("*");
    role.next().html("*");
    phone.next().html("*");

        $.ajax({
            type:"GET",//请求类型
            url:"/user/loginName",//请求的url
            data:{loginName:loginName.val()},//请求参数
            dataType:"json",//ajax接口（请求url）返回的数据类型
            success:function(data){//data：返回数据（json对象）
                if(data.loginName == "exist"){//供应商编码已存在，错误提示
                    validateTip(loginName.next(),{"color":"red"},imgNo+ " 登录账号已存在",false);
                }else{//供应商编码可用，正确提示
                    validateTip(loginName.next(),{"color":"green"},imgYes+" 可以使用",true);
                }
            },
            error:function(data){//当访问时候，404，500 等非200的错误状态码
                validateTip(loginName.next(),{"color":"red"},imgNo+" 您访问的页面不存在",false);
            }
        });


    $.ajax({
        type: "GET",//请求类型
        url: path + "/post/postlist",//请求的url
        //data:{method:"getrolelist"},//请求参数
        dataType: "json",//ajax接口（请求url）返回的数据类型
        success: function (data) {//data：返回数据（json对象）
            if (data != null) {
                post.html("");
                var options = "<option value=\"0\">请选择</option>";
                for (var i = 0; i < data.length; i++) {
                    //alert(data[i].id);
                    //alert(data[i].rolename);
                    options += "<option value=\"" + data[i].postId + "\">" + data[i].postName + "</option>";
                }
                post.html(options);
            }
        },
        error: function (data) {//当访问时候，404，500 等非200的错误状态码
            validateTip(post.next(), {"color": "red"}, imgNo + " 获取员工职位列表error", false);
        }
    });
    $.ajax({
        type: "GET",//请求类型
        url: path + "/dept/deptlist",//请求的url
        //data:{method:"getrolelist"},//请求参数
        dataType: "json",//ajax接口（请求url）返回的数据类型
        success: function (data) {//data：返回数据（json对象）
            if (data != null) {
                dept.html("");
                var options = "<option value=\"0\">请选择</option>";
                for (var i = 0; i < data.length; i++) {
                    //alert(data[i].id);
                    //alert(data[i].rolename);
                    options += "<option value=\"" + data[i].deptId + "\">" + data[i].deptName + "</option>";
                }
                dept.html(options);
            }
        },
        error: function (data) {//当访问时候，404，500 等非200的错误状态码
            validateTip(dept.next(), {"color": "red"}, imgNo + " 获取部门列表error", false);
        }
    });

    $.ajax({
        type: "GET",//请求类型
        url: path + "/role/rolelist",//请求的url
        //data:{method:"getrolelist"},//请求参数
        dataType: "json",//ajax接口（请求url）返回的数据类型
        success: function (data) {//data：返回数据（json对象）
            if (data != null) {
                role.html("");
                var options = "<option value=\"0\">请选择</option>";
                for (var i = 0; i < data.length; i++) {
                    //alert(data[i].id);
                    //alert(data[i].rolename);
                    options += "<option value=\"" + data[i].roleId + "\">" + data[i].roleName + "</option>";
                }
                role.html(options);
            }
        },
        error: function (data) {//当访问时候，404，500 等非200的错误状态码
            validateTip(role.next(), {"color": "red"}, imgNo + " 获取部门列表error", false);
        }
    });

    userName.bind("focus", function () {
        validateTip(userName.next(), {"color": "#666666"}, "* 员工姓名", false);
    }).bind("blur", function () {
        if (userName.val() != null && userName.val().length > 1
            && userName.val().length < 10) {
            validateTip(userName.next(), {"color": "green"}, imgYes, true);
        } else {
            validateTip(userName.next(), {"color": "red"}, imgNo + " 用户名输入的不符合规范，请重新输入", false);
        }

    });

    email.bind("focus", function () {
        validateTip(email.next(), {"color": "#666666"}, "* 请输入邮箱号", false);
    }).bind("blur", function () {
        //var patrn=/^(13[0-9]|15[0-9]|18[0-9])\d{8}$/;
        //电话号码正则表达式（支持手机号码，3-4位区号，7-8位直播号码，1－4位分机号）:
        //var patrn=/^(\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$/;
        var patrn = /^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/;
        if (email.val().match(patrn)) {
            validateTip(email.next(), {"color": "green"}, imgYes, true);
        } else {
            validateTip(email.next(), {"color": "red"}, imgNo + " 您输入的邮箱号格式不正确", false);
        }
    });

    phone.bind("focus", function () {
        validateTip(phone.next(), {"color": "#666666"}, "* 请输入手机号", false);
    }).bind("blur", function () {
        //var patrn=/^(13[0-9]|15[0-9]|18[0-9])\d{8}$/;
        //电话号码正则表达式（支持手机号码，3-4位区号，7-8位直播号码，1－4位分机号）:
        //var patrn=/^(\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$/;
        var patrn = /^([1]\d{10}|([\(（]?0[0-9]{2,3}[）\)]?[-]?)?([2-9][0-9]{6,7})+(\-[0-9]{1,4})?)$/;
        if (phone.val().match(patrn)) {
            validateTip(phone.next(), {"color": "green"}, imgYes, true);
        } else {
            validateTip(phone.next(), {"color": "red"}, imgNo + " 您输入的手机号格式不正确", false);
        }
    });

    post.bind("focus", function () {
        validateTip(post.next(), {"color": "#666666"}, "* 请选择职位", false);
    }).bind("blur", function () {
        if (post.val() != null && post.val() > 0) {
            validateTip(post.next(), {"color": "green"}, imgYes, true);
        } else {
            validateTip(post.next(), {"color": "orange"}, imgWarn + " 未选择职位", false);
        }
    });

    dept.bind("focus", function () {
        validateTip(dept.next(), {"color": "#666666"}, "* 请选择部门", false);
    }).bind("blur", function () {
        if (dept.val() != null && dept.val() > 0) {
            validateTip(dept.next(), {"color": "green"}, imgYes, true);
        } else {
            validateTip(dept.next(), {"color": "orange"}, imgNo + " 未选择部门、", false);
        }
    });
    role.bind("focus", function () {
        validateTip(role.next(), {"color": "#666666"}, "* 请选择角色", false);
    }).bind("blur", function () {
        if (role.val() != null && role.val() > 0) {
            validateTip(role.next(), {"color": "green"}, imgYes, true);
        } else {
            validateTip(role.next(), {"color": "orange"}, imgNo + " 未选择角色、", false);
        }
    });

    addBtn.bind("click", function () {
        if (userName.attr("validateStatus") != "true") {
            userName.blur();
        } else if (email.attr("validateStatus") != "true") {
            email.blur();
        }/*else if(post.attr("validateStatus") != "true"){
			post.blur();
		}else if(dept.attr("validateStatus") != "true"){
			dept.blur();
		}*/ else if (phone.attr("validateStatus") != "true") {
            phone.blur();
        } else {
            if (confirm("是否确认提交数据")) {
                $("#userForm").submit();
            }
        }
    });

    backBtn.on("click", function () {
        if (referer != undefined
            && null != referer
            && "" != referer
            && "null" != referer
            && referer.length > 4) {
            window.location.href = referer;
        } else {
            history.back(-1);
        }
    });
});