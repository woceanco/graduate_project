<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/jsp/common/head.jsp"%>

<div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>部门管理页面 >> 部门添加页面</span>
        </div>
        <div class="providerAdd">
           <form id="providerForm" name="providerForm" method="post" action="${pageContext.request.contextPath }/dept/add">
                <!--div的class 为error是验证错误，ok是验证成功-->
                <div class="">
                    <label for="deptCode">部门编码：</label>
                    <input type="text" name="deptCode" id="deptCode" value="">
					<!-- 放置提示信息 -->
					<font color="red"></font>
                </div>
                <div>
                    <label for="deptName">部门名称：</label>
                   <input type="text" name="deptName" id="deptName" value="">
					<font color="red"></font>
                </div>
                <div>
                    <label for="leader">部门领导：</label>
                    <input type="text" name="leader" id="leader" value="">
					<font color="red"></font>

                </div>
                <div>
                    <label for="phone">部门电话：</label>
                    <input type="text" name="phone" id="phone" value="">
					<font color="red"></font>
                </div>
                <div>
                    <label for="email">部门邮箱：</label>
                    <input type="text" name="email" id="email" value="">
                    <font color="red"></font>
                </div>
                <div>
                    <label for="detail">描述：</label>
                    <input type="text" name="detail" id="detail" value="">
                </div>
                <div class="providerAddBtn">
                    <input type="button" name="add" id="add" value="保存">
					<input type="button" id="back" name="back" value="返回" >
                </div>
            </form>
     </div>
</div>
</section>
<%@include file="/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/deptadd.js"></script>
