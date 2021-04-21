<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="/jsp/common/head.jsp"%>

<div class="right">
    <div class="location">
        <strong>你现在所在的位置是:</strong>
        <span>角色管理页面 >> 角色添加页面</span>
    </div>
    <div class="providerAdd">
        <form id="roleForm" name="roleForm" method="role" action="${pageContext.request.contextPath }/role/add">
            <div>
                <label for="roleName">角色名称：</label>
                <input type="text" name="roleName" id="roleName" value="">
                <font color="red"></font>
            </div><div>
                <label for="roleKey">角色权限字符：</label>
                <input type="text" name="roleKey" id="roleKey" value="">
                <font color="red"></font>
            </div>
            <div>
                <label >数据范围：</label>
                <select name="dataScope" id="dataScope">
                    <option value="1">全部数据权限</option>
                    <option value="2">员工信息权限</option>
                    <option value="3" selected="selected">个人数据权限</option>
                </select>
            </div>
            <div>
                <label for="createTime">创建时间：</label>
                <input type="datetime-local" name="createTime" id="createTime" value=""/>
                <font color="red"></font>
            </div>
            <div>
                <div class="providerAddBtn">
                    <input type="button" name="add" id="add" value="保存">
                    <input type="button" id="back" name="back" value="返回" >
                </div>
        </form>
    </div>
</div>
</section>
<%@include file="/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/roleadd.js"></script>