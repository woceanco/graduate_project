<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="/jsp/common/head.jsp"%>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>员工信息管理页面 >> 员工信息修改页面</span>
        </div>
        <div class="providerAdd">
        <form id="userForm" name="userForm" method="post" action="${pageContext.request.contextPath }/user/updateuser">
			<input type="hidden" name="method" value="modifyexe">
			<input type="hidden" name="userId" value="${user.userId }"/>
			 <div>
                    <label for="userName">员工姓名：</label>
                    <input type="text" name="userName" id="userName" value="${user.userName }">
					<font color="red"></font>
             </div>
            <div>
                <label for="email">邮箱：</label>
                <input type="text" name="email" id="email" value="${user.email }">
                <font color="red"></font>
            </div>
            <div>
                <label for="phonenumber">电话：</label>
                <input type="text" name="phonenumber" id="phonenumber" value="${user.phonenumber }">
            </div>
			 <div>
                    <label >性别：</label>
                    <select name="sex" id="sex">
						<c:choose>
							<c:when test="${user.sex == 0 }">
								<option value="0" selected="selected">男</option>
					    		<option value="1">女</option>
							</c:when>
							<c:otherwise>
								<option value="0">男</option>
					    		<option value="1" selected="selected">女</option>
							</c:otherwise>
						</c:choose>
					 </select>
             </div>
                  <div>
                        <label for="post">职位：</label>
                        <input type="hidden" id="post" name="post" value="${user.postId }" />
                        <select name="postId" id="postId"></select>
                        <font color="orange"></font>
                  </div>
				  <div>
                      <label for="post">部门：</label>
					  <input type="hidden" value="${user.deptId }" id="dept" name="dept"/>
					  <select name="deptId" id="deptId"></select>
        			  <font color="orange"></font>
                  </div>
                  <div>
                      <label for="role">角色：</label>
					  <input type="hidden" value="${user.roleId }" id="role" name="role"/>
					  <select name="roleId" id="roleId"></select>
        			  <font color="orange"></font>
                  </div>
			 <div class="providerAddBtn">
                    <input type="button" name="save" id="save" value="保存" />
                    <input type="button" id="back" name="back" value="返回"/>
                </div>
            </form>
        </div>
    </div>
</section>
<%@include file="/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/usermodify.js"></script>
