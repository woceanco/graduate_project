<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
	pageEncoding="UTF-8"%>
<%@include file="/jsp/common/head.jsp"%>

<div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>部门管理页面</span>
        </div>
        <div class="search">
        	<form method="get" action="${pageContext.request.contextPath }/dept/list">
				<span>部门名称：</span>
				<input name="deptName" type="text" value="${deptName }">

				<input type="hidden" name="pageIndex" value="1"/>
				<input value="查 询" type="submit" id="searchbutton">
				<a href="${pageContext.request.contextPath }/jsp/dept/deptadd.jsp">添加部门</a>
			</form>
        </div>

        <table class="providerTable" cellpadding="0" cellspacing="0">
            <tr class="firstTr">
                <th width="10%">部门编码</th>
                <th width="20%">部门名称</th>
                <th width="10%">部门领导</th>
                <th width="10%">部门电话</th>
                <th width="10%">部门邮箱</th>
                <th width="10%">创建时间</th>
                <th width="30%">操作</th>
            </tr>
            <c:forEach var="dept" items="${deptList }" varStatus="status">
				<tr>
					<td>
					<span>${dept.deptCode }</span>
					</td>
					<td>
					<span>${dept.deptName }</span>
					</td>
					<td>
					<span>${dept.leader}</span>
					</td>
					<td>
					<span>${dept.phone}</span>
					</td>
					<td>
					<span>${dept.email}</span>
					</td>
					<td>
					<span>
					<fmt:formatDate value="${dept.createTime}" pattern="yyyy-MM-dd"/>
					</span>
					</td>
					<td>
					<span><a class="viewdept" href="javascript:;" deptId=${dept.deptId } deptName=${dept.deptName }><img src="${pageContext.request.contextPath }/static/images/read.png" alt="查看" title="查看"/></a></span>
					<span><a class="modifydept" href="javascript:;" deptId=${dept.deptId } deptName=${dept.deptName }><img src="${pageContext.request.contextPath }/static/images/xiugai.png" alt="修改" title="修改"/></a></span>
					<span><a class="deletedept" href="javascript:;" deptId=${dept.deptId } deptName=${dept.deptName }><img src="${pageContext.request.contextPath }/static/images/schu.png" alt="删除" title="删除"/></a></span>
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
<div class="remove" id="removeProv">
   <div class="removerChid">
       <h2>提示</h2>
       <div class="removeMain" >
           <p>你确定要删除该供应商吗？</p>
           <a href="#" id="yes">确定</a>
           <a href="#" id="no">取消</a>
       </div>
   </div>
</div>

<%@include file="/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/deptlist.js"></script>
