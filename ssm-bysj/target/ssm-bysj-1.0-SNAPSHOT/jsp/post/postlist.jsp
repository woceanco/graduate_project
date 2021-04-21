<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
	pageEncoding="UTF-8"%>
<%@include file="/jsp/common/head.jsp"%>

<div class="right">
       <div class="location">
           <strong>你现在所在的位置是:</strong>
           <span>职位管理页面</span>
       </div>
       <div class="search">
       <form method="get" action="${pageContext.request.contextPath }/post/list">
			<span>职位名称：</span>
			<input name="postName" type="text" value="${postName }">
		     <input type="hidden" name="pageIndex" value="1"/>
			 <input	value="查 询" type="submit" id="searchbutton">
			 <a href="${pageContext.request.contextPath }/jsp/post/postadd.jsp">添加职位</a>
		</form>
       </div>
       <!---->
      <table class="providerTable" cellpadding="0" cellspacing="0">
          <tr class="firstTr">
              <th width="20%">职位编码</th>
              <th width="20%">职位名称</th>
              <th width="10%">状态</th>
              <th width="10%">创建时间</th>
              <th width="10%">更新时间</th>
              <th width="30%">操作</th>
          </tr>
          <c:forEach var="post" items="${postList }" varStatus="status">
				<tr>
					<td>
					<span>${post.postCode }</span>
					</td>
					<td>
					<span>${post.postName }</span>
					</td>
					<td>
						<span>
							<c:if test="${post.status == 0}">正常</c:if>
							<c:if test="${post.status == 1}">停用</c:if>
						</span>
					</td>
					<td>
					<span>
					<fmt:formatDate value="${post.createTime}" pattern="yyyy-MM-dd"/>
					</span>
					</td><td>
					<span>
					<fmt:formatDate value="${post.updateTime}" pattern="yyyy-MM-dd"/>
					</span>
					</td>
					<td>
					<span><a class="viewpost" href="javascript:;" postId=${post.postId } postcc=${post.postCode }><img src="${pageContext.request.contextPath }/static/images/read.png" alt="查看" title="查看"/></a></span>
					<span><a class="modifypost" href="javascript:;" postId=${post.postId } postcc=${post.postCode }><img src="${pageContext.request.contextPath }/static/images/xiugai.png" alt="修改" title="修改"/></a></span>
					<span><a class="deletepost" href="javascript:;" postId=${post.postId } postcc=${post.postCode }><img src="${pageContext.request.contextPath }/static/images/schu.png" alt="删除" title="删除"/></a></span>
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
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/postlist.js"></script>