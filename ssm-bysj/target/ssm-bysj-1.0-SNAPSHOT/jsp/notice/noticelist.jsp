<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
         pageEncoding="UTF-8"%>
<%@include file="/jsp/common/head.jsp"%>

<div class="right">
    <div class="location">
        <strong>你现在所在的位置是:</strong>
        <span>公告管理页面</span>
    </div>
    <div class="search">
        <form method="get" action="${pageContext.request.contextPath }/notice/list">
            <span>公告标题：</span>
            <input name="postName" type="text" value="${noticeTitle }">
            <input type="hidden" name="pageIndex" value="1"/>
            <input	value="查 询" type="submit" id="searchbutton">
            <a href="${pageContext.request.contextPath }/jsp/notice/noticeadd.jsp">添加公告</a>
        </form>
    </div>
    <!---->
    <table class="providerTable" cellpadding="0" cellspacing="0">
        <tr class="firstTr">
            <th width="10%">公告编码</th>
            <th width="30%">公告标题</th>
            <th width="10%">公告类型</th>
            <th width="10%">公告状态</th>
            <th width="20%">创建时间</th>
            <th width="20%">操作</th>
        </tr>
        <c:forEach var="notice" items="${noticeList }" varStatus="status">
            <tr>
                <td>
                    <span>${notice.noticeId}</span>
                </td>
                <td>
                    <span>${notice.noticeTitle }</span>
                </td>
                <td>
						<span>
							<c:if test="${notice.noticeType == 1}">通知</c:if>
							<c:if test="${notice.noticeType == 2}">公告</c:if>
						</span>
                </td>
                <td>
						<span>
							<c:if test="${notice.status == 0}">正常</c:if>
							<c:if test="${notice.status == 1}">已过期</c:if>
						</span>
                </td>
                <td>
					<span>
					<fmt:formatDate value="${notice.createTime}" pattern="yyyy-MM-dd"/>
					</span>
                </td>
                <td>
                    <span><a class="viewnotice" href="javascript:;" noticeId=${notice.noticeId } noticeTitle=${notice.noticeTitle }><img src="${pageContext.request.contextPath }/static/images/read.png" alt="查看" title="查看"/></a></span>
                    <span><a class="modifynotice" href="javascript:;" noticeId=${notice.noticeId } noticeTitle=${notice.noticeTitle }><img src="${pageContext.request.contextPath }/static/images/xiugai.png" alt="修改" title="修改"/></a></span>
                    <span><a class="deletenotice" href="javascript:;" noticeId=${notice.noticeId } noticeTitle=${notice.noticeTitle }><img src="${pageContext.request.contextPath }/static/images/schu.png" alt="删除" title="删除"/></a></span>
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
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/noticelist.js"></script>