﻿<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
         pageEncoding="UTF-8"%>
<%@include file="/jsp/common/head.jsp"%>

<div class="right">
    <div class="location">
        <strong>你现在所在的位置是:</strong>
        <span>角色管理页面</span>
    </div>
    <div class="search">
        <form method="get" action="${pageContext.request.contextPath }/role/list">
            <span>角色名称：</span>
            <input name="roleName" type="text" value="${roleName }">
            <input type="hidden" name="pageIndex" value="1"/>
            <input	value="查 询" type="submit" id="searchbutton">
            <a href="${pageContext.request.contextPath }/jsp/role/roleadd.jsp">添加角色</a>
        </form>
    </div>
    <!---->
    <table class="providerTable" cellpadding="0" cellspacing="0">
        <tr class="firstTr">
            <th width="10%">角色ID</th>
            <th width="20%">角色名称</th>
            <th width="10%">角色权限字符</th>
            <th width="20%">数据范围</th>
            <th width="10%">角色状态</th>
            <th width="30%">操作</th>
        </tr>
        <c:forEach var="role" items="${roleList }" varStatus="status">
            <tr>
                <td>
                    <span>${role.roleId }</span>
                </td>
                <td>
                    <span>${role.roleName }</span>
                </td>
                <td>
                    <span>${role.roleKey}</span>
                </td>
                <td>
						<span>
							<c:if test="${role.dataScope == 1}">全部数据权限</c:if>
							<c:if test="${role.dataScope == 2}">个人数据权限</c:if>
							<c:if test="${role.dataScope == 3}">员工信息权限</c:if>
						</span>
                </td>
                <td>
						<span>
							<c:if test="${role.status == 0}">正常</c:if>
							<c:if test="${role.status == 1}">停用</c:if>
						</span>
                </td>
                <td>
                    <span><a class="modifyrole" href="javascript:;" roleId=${role.roleId } roleName=${role.roleName }><img src="${pageContext.request.contextPath }/static/images/xiugai.png" alt="修改" title="修改"/></a></span>
                    <span><a class="deleterole" href="javascript:;" roleId=${role.roleId } roleName=${role.roleName }><img src="${pageContext.request.contextPath }/static/images/schu.png" alt="删除" title="删除"/></a></span>
                </td>
            </tr>
        </c:forEach>
    </table>
    <input type="hidden" id="totalPageCount" value="${totalPageCount}"/>
    <c:import url="../common/rollpage.jsp">
        <c:param name="totalCount" value="${totalCount}"/>
        <c:param name="currentPageNo" value="${currentPageNo}"/>
        <c:param name="totalPageCount" value="${totalPageCount}"/>
    </c:import>
</div>
</section>

<!--点击删除按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="removeBi">
    <div class="removerChid">
        <h2>提示</h2>
        <div class="removeMain">
            <p>你确定要删除该订单吗？</p>
            <a href="#" id="yes">确定</a>
            <a href="#" id="no">取消</a>
        </div>
    </div>
</div>

<%@include file="/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/rolelist.js"></script>