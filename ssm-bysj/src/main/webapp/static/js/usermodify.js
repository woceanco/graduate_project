var phone = null;
var userName = null;
var email = null;
var post = null
var dept = null
var role = null
var postId = null
var deptId = null
var roleId = null
var saveBtn = null;
var backBtn = null;

$(function () {
    userName = $("#userName");
    phone = $("#phonenumber");
    email = $("#email");
    post = $("#post");
    dept = $("#dept");
    role = $("#role");
    postId = $("#postId");
    deptId = $("#deptId");
    roleId = $("#roleId");
    saveBtn = $("#save");
    backBtn = $("#back");
    //初始化的时候，要把所有的提示信息变为：* 以提示必填项，更灵活，不要写在页面上
    userName.next().html("*");
    post.next().html("*");
    dept.next().html("*");
    role.next().html("*");
    phone.next().html("*");

    /*function getRequest(){
        var url = location.search;//获取url中"?"符后的字串
        //判断是否有参数
        if (url.indexOf("?") != -1){
            var str = url.substr(1); //从第一个字符开始 因为第0个是?号 获取所有除问号的所有符串
            strs = str.split("=");   //用等号进行分隔 （因为知道只有一个参数 所以直接用等号进分隔 如果有多个参数 要用&号分隔 再用等号进行分隔）
            //alert(strs[1]);          //直接弹出第一个参数 （如果有多个参数 还要进行循环的）
            var uid = strs[1];
            $.ajax({
                type:"GET",
                url:path+"/user/user?userId="+uid,
                dataType:"json",
                success:function (data) {
                    var user = data;
                    console.log(user);
                },
                error:function () {
                    alert("error");
                }
            });
        }
    };
    getRequest();*/
    $.ajax({
        type: "GET",//请求类型
        url: path + "/post/postlist",//请求的url
        //data:{method:"getrolelist"},//请求参数
        dataType: "json",//ajax接口（请求url）返回的数据类型
        success: function (data) {//data：返回数据（json对象）
            if (data != null) {
                var postid = post.val();
                postId.html("");
                var options = "<option value=\"0\">请选择</option>";
                for (var i = 0; i < data.length; i++) {
                    //alert(data[i].id);
                    if (postid != null && postid != undefined && data[i].postId == postid) {
                        options += "<option selected=\"selected\" value=\"" + data[i].postId + "\" >" + data[i].postName + "</option>";
                    } else {
                        options += "<option value=\"" + data[i].postId + "\" >" + data[i].postName + "</option>";
                    }
                    //options += "<option value=\""+data[i].id+"\">"+data[i].postName+"</option>";
                }
                postId.html(options);
            }
        },
        error: function (data) {//当访问时候，404，500 等非200的错误状态码
            validateTip(postId.next(), {"color": "red"}, imgNo + " 获取员工职位列表error", false);
        }
    });
    $.ajax({
        type: "GET",//请求类型
        url: path + "/dept/deptlist",//请求的url
        //data:{method:"getrolelist"},//请求参数
        dataType: "json",//ajax接口（请求url）返回的数据类型
        success: function (data) {//data：返回数据（json对象）
            if (data != null) {
                var deptid = dept.val();
                deptId.html("");
                var options = "<option value=\"0\">请选择</option>";
                for (var i = 0; i < data.length; i++) {
                    if (deptid != null && deptid != undefined && data[i].deptId == deptid) {
                        options += "<option selected=\"selected\" value=\"" + data[i].deptId + "\" >" + data[i].deptName + "</option>";
                    } else {
                        options += "<option value=\"" + data[i].deptId + "\" >" + data[i].deptName + "</option>";
                    }
                }
                deptId.html(options);
            }
        },
        error: function (data) {//当访问时候，404，500 等非200的错误状态码
            validateTip(deptId.next(), {"color": "red"}, imgNo + " 获取部门列表error", false);
        }
    });
    $.ajax({
        type: "GET",//请求类型
        url: path + "/role/rolelist",//请求的url
        //data:{method:"getrolelist"},//请求参数
        dataType: "json",//ajax接口（请求url）返回的数据类型
        success: function (data) {//data：返回数据（json对象）
            if (data != null) {
                var roleid = role.val();
                roleId.html("");
                var options = "<option value=\"0\">请选择</option>";
                for (var i = 0; i < data.length; i++) {
                    if (roleid != null && roleid != undefined && data[i].roleId == roleid) {
                        options += "<option selected=\"selected\" value=\"" + data[i].roleId + "\" >" + data[i].roleName + "</option>";
                    } else {
                        options += "<option value=\"" + data[i].roleId + "\" >" + data[i].roleName + "</option>";
                    }
                }
                roleId.html(options);
            }
        },
        error: function (data) {//当访问时候，404，500 等非200的错误状态码
            validateTip(roleId.next(), {"color": "red"}, imgNo + " 获取角色列表error", false);
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

    /*phone.bind("focus",function(){
        validateTip(phone.next(),{"color":"#666666"},"* 请输入手机号",false);
    }).bind("blur",function(){
        //var patrn=/^(13[0-9]|15[0-9]|18[0-9])\d{8}$/;
        //电话号码正则表达式（支持手机号码，3-4位区号，7-8位直播号码，1－4位分机号）:
        //var patrn=/^(\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$/;
        var patrn1=/^1(3[0-9]|4[5,7]|5[0,1,2,3,5,6,7,8,9]|6[2,5,6,7]|7[0,1,7,8]|8[0-9]|9[1,8,9])\d{8}$/;
        if(phone.val().match(patrn1)){
            validateTip(phone.next(),{"color":"green"},imgYes,true);
        }else{
            validateTip(phone.next(),{"color":"red"},imgNo + " 您输入的手机号格式不正确",false);
        }
    });*/

    postId.bind("focus", function () {
        validateTip(postId.next(), {"color": "#666666"}, "* 请选择职位", false);
    }).bind("blur", function () {
        if (postId.val() != null && postId.val() > 0) {
            validateTip(postId.next(), {"color": "green"}, imgYes, true);
        } else {
            validateTip(postId.next(), {"color": "orange"}, imgWarn + " 未选择职位", false);
        }
    });

    deptId.bind("focus", function () {
        validateTip(deptId.next(), {"color": "#666666"}, "* 请选择部门", false);
    }).bind("blur", function () {
        if (deptId.val() != null && deptId.val() > 0) {
            validateTip(deptId.next(), {"color": "green"}, imgYes, true);
        } else {
            validateTip(deptId.next(), {"color": "orange"}, imgWarn + " 未选择部门、", false);
        }
    });
    roleId.bind("focus", function () {
        validateTip(roleId.next(), {"color": "#666666"}, "* 请选择角色", false);
    }).bind("blur", function () {
        if (roleId.val() != null && roleId.val() > 0) {
            validateTip(roleId.next(), {"color": "green"}, imgYes, true);
        } else {
            validateTip(roleId.next(), {"color": "orange"}, imgWarn + " 未选择角色、", false);
        }
    });

    saveBtn.bind("click", function () {
        if (userName.attr("validateStatus") != "true") {
            userName.blur();
        } else if (email.attr("validateStatus") != "true") {
            email.blur();
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