<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="/jsp/common/head.jsp"%>

<div class="right">
    <div class="location">
        <strong>你现在所在的位置是:</strong>
        <span>角色管理页面 >> 角色添加页面</span>
    </div>
    <div class="providerAdd">
        <form id="roleForm" name="roleForm" method="role" action="${pageContext.request.contextPath }/role/updaterole
">
            <input type="hidden" name="roleId" value="${role.roleId }">>
            <input type="hidden" name="oldKey" id="oldKey" value="${role.roleKey }">>
            <div>
                <label for="roleName">角色名称：</label>
                <input type="text" name="roleName" id="roleName" value="${role.roleName}">
                <font color="red"></font>
            </div> <div>
                <label for="roleKey">角色权限字符：</label>
                <input type="text" name="roleKey" id="roleKey" value="${role.roleKey}">
                <font color="red"></font>
            </div>
            <div>
                <label >状态：</label>
                <select name="status" id="status">
                    <c:choose>
                        <c:when test="${role.status == 1}">
                            <option value="0">正常</option>
                            <option value="1" selected="selected">停用</option>
                        </c:when>
                        <c:otherwise>
                            <option value="0" selected="selected">正常</option>
                            <option value="1">停用</option>
                        </c:otherwise>
                    </c:choose>
                </select>
            </div>
            <div>
                <label for="updateTime">修改时间：</label>
                <input type="datetime-local" name="updateTime" id="updateTime" value="${role.updateTime}"/>
                <font color="red"></font>
            </div>
            <div class="providerAddBtn">
                <input type="button" name="save" id="save" value="保存">
                <input type="button" id="back" name="back" value="返回" >
            </div>
        </form>
    </div>

</div>
</section>

<%@include file="/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/rolemodify.js"></script>