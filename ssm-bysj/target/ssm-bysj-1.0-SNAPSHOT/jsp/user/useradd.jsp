<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/jsp/common/head.jsp"%>

<div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>员工信息管理页面 >> 员工信息添加页面</span>
        </div>
        <div class="providerAdd">
            <form id="userForm" name="userForm" method="post" action="${pageContext.request.contextPath }/user/add">
				<input type="hidden" name="method" value="add">
                <!--div的class 为error是验证错误，ok是验证成功-->
                <div>
                    <label for="loginName">员工姓名：</label>
                    <input type="text" name="loginName" id="loginName" value="">
                    <!-- 放置提示信息 -->
                    <font color="red"></font>
                </div>
                <div>
                    <label for="userName">员工姓名：</label>
                    <input type="text" name="userName" id="userName" value="">
					<!-- 放置提示信息 -->
					<font color="red"></font>
                </div>
                <div>
                    <label for="email">邮箱：</label>
                    <input type="text" name="email" id="email" value="">
					<font color="red"></font>
                </div>
                <div>
                    <label for="phonenumber">电话：</label>
                    <input type="text" name="phonenumber" id="phonenumber" value="">
					<font color="red"></font>
                </div>
                <div>
                    <label >性别：</label>
					<select name="sex" id="sex">
					    <option value="0" selected="selected">男</option>
					    <option value="1">女</option>
					 </select>
                </div>
                <div>
                    <label for="postId">职位：</label>
                    <select name="postId" id="postId"></select>
                    <font color="red"></font>
                </div>
                <div>
                    <label for="deptId">部门：</label>
					<select name="deptId" id="deptId"></select>
	        		<font color="red"></font>
                </div>
                <div>
                    <label for="roleId">角色：</label>
                    <select name="roleId" id="roleId"></select>
                    <font color="red"></font>
                </div>
                <div class="providerAddBtn">
                    <input type="button" name="add" id="add" value="保存" >
					<input type="button" id="back" name="back" value="返回" >
                </div>
            </form>
        </div>
</div>
</section>
<%@include file="/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/useradd.js"></script>
