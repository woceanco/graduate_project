<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
	pageEncoding="UTF-8"%>
<%@include file="/jsp/common/head.jsp"%>
<div class="right">
            <div class="location">
                <strong>你现在所在的位置是:</strong>
                <span>密码修改页面</span>
            </div>
            <div class="providerAdd">
                <form id="userForm" name="userForm" method="post" action="${pageContext.request.contextPath }/pwd/updatepwd">
                    <input type="hidden" id="password" value="${userSession.password}">
                    <input type="hidden" name="loginName" value="${userSession.loginName}">
                    <!--div的class 为error是验证错误，ok是验证成功-->
                    <div class="info">${result}</div>
                    <div class="">
                        <label for="oldPassword">旧密码：</label>
                        <input type="password" name="oldPassword" id="oldPassword" value="">
						<font color="red"></font>
                    </div>
                    <div>
                        <label for="newPassword">新密码：</label>
                        <input type="password" name="newPassword" id="newPassword" value="">
						<font color="red"></font>
                    </div>
                    <div>
                        <label for="reNewPassword">确认新密码：</label>
                        <input type="password" name="reNewPassword" id="reNewPassword" value="">
						<font color="red"></font>
                    </div>
                    <div class="providerAddBtn">
                        <!--<a href="#">保存</a>-->
                        <input type="button" name="save" id="save" value="保存" class="input-button">
                    </div>
                </form>
            </div>
        </div>
    </section>
<%@include file="/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/pwdmodify.js"></script>