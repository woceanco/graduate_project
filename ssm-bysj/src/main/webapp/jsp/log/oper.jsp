<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
	pageEncoding="UTF-8"%>
<%@include file="/jsp/common/head.jsp"%>
        <div class="right">
            <div class="location">
                <strong>你现在所在的位置是:</strong>
                <span>日志管理页面</span>
            </div>
			<form><input type="hidden" name="pageIndex" value="1"/></form>
            <table class="providerTable" cellpadding="0" cellspacing="0">
                <tr class="firstTr">
					<th width="10%">日志ID</th>
					<th width="10%">操作人</th>
					<th width="10%">类名</th>
					<th width="10%">方法名</th>
					<th width="10%">请求方式</th>
					<th width="10%">操作类型</th>
					<th width="20%">请求路径</th>
					<th width="10%">IP地址</th>
					<th width="10%">时间</th>
                </tr>
                   <c:forEach var="log" items="${operLogList }" varStatus="status">
					<tr>
						<td>
						<span>${log.operId }</span>
						</td>
						<td>
						<span>${log.operName }</span>
						</td><td>
						<span>${log.classname }</span>
						</td><td>
						<span>${log.method }</span>
						</td><td>
						<span>${log.requestMethod }</span>
						</td><td>
						<span>${log.operatorType }</span>
						</td><td>
						<span>${log.operUrl }</span>
						</td><td>
						<span>${log.operIp }</span>
						</td><td>
						<span>${log.operTime }</span>
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

<%@include file="/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/oper.js"></script>
