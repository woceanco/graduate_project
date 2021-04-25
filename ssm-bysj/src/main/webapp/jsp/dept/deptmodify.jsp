<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/jsp/common/head.jsp"%>

  <div class="right">
      <div class="location">
          <strong>你现在所在的位置是:</strong>
          <span>部门管理页面 >> 部门修改页</span>
      </div>
      <div class="providerAdd">
          <form id="providerForm" name="providerForm" method="post" action="${pageContext.request.contextPath }/dept/updatedept">
              <input type="hidden" name="deptId" value="${dept.deptId}"/>
              <!--div的class 为error是验证错误，ok是验证成功-->
              <%--<div class="">
                  <label for="deptCode">部门编码：</label>
                  <input type="text" name="deptCode" id="deptCode" value="${dept.deptCode }" readonly="readonly">
                  <font color="red"></font>
              </div>--%>
              <div>
                  <label for="deptName">部门名称：</label>
                 <input type="text" name="deptName" id="deptName" value="${dept.deptName }">
			<font color="red"></font>
              </div>
              
              <div>
                  <label for="leader">部门领导：</label>
                  <input type="text" name="leader" id="leader" value="${dept.leader }">
			<font color="red"></font>
              </div>
              
              <div>
                  <label for="phone">部门电话：</label>
                  <input type="text" name="phone" id="phone" value="${dept.phone }">
			<font color="red"></font>
              </div>
              
              <div>
                  <label for="email">部门邮箱：</label>
                  <input type="text" name="email" id="email" value="${dept.email }">
                  <font color="red"></font>
              </div>

              <div>
                  <label for="detail">描述：</label>
                  <input type="text" name="detail" id="detail" value="${dept.detail }">
              </div>
              <div class="deptAddBtn">
                  <input type="button" name="save" id="save" value="保存">
				  <input type="button" id="back" name="back" value="返回" >
              </div>
          </form>
      </div>
  </div>
</section>
<%@include file="/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/deptmodify.js"></script>