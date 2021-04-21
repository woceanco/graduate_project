<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
	pageEncoding="UTF-8"%>
<%@include file="/jsp/common/head.jsp"%>
        <div class="right">
            <div class="location">
                <strong>你现在所在的位置是:</strong>
                <span>员工信息管理页面</span>
            </div>
            <div class="search">
           		<form method="get" action="${pageContext.request.contextPath }/user/list">
					<input name="method" value="query" class="input-text" type="hidden">
					 <span>员工姓名：</span>
					 <input name="userName" class="input-text"	type="text" value="${userName }">
					 
					 <span>员工职位：</span>
					 <select name="postId">
						<c:if test="${postList != null }">
						   <option value="0">--请选择--</option>
						   <c:forEach var="post" items="${postList}">
						   		<option <c:if test="${post.postId == postId }">selected="selected"</c:if>
						   		value="${post.postId}">${post.postName}</option>
						   </c:forEach>
						</c:if>
	        		</select>
					 
					 <input type="hidden" name="pageIndex" value="1"/>
					 <input	value="查 询" type="submit" id="searchbutton">
					 <a href="${pageContext.request.contextPath}/jsp/user/useradd.jsp" >添加员工</a>
				</form>
            </div>
            <!--用户-->
            <table class="providerTable" cellpadding="0" cellspacing="0">
                <tr class="firstTr">
                    <th width="10%">员工ID</th>
                    <th width="20%">员工姓名</th>
                    <th width="10%">性别</th>
                    <th width="10%">邮箱</th>
                    <th width="10%">电话</th>
                    <th width="10%">员工职位</th>
                    <th width="30%">操作</th>
                </tr>
                   <c:forEach var="user" items="${list }" varStatus="status">
					<tr>
						<td>
						<span>${user.userId }</span>
						</td>
						<td>
						<span>${user.userName }</span>
						</td>
						<td>
							<span>
								<c:if test="${user.sex == 0 }">男</c:if>
								<c:if test="${user.sex == 1 }">女</c:if>
							</span>
						</td>
						<td>
						<span>${user.email}</span>
						</td>
						<td>
						<span>${user.phonenumber}</span>
						</td>
						<td>
							<c:if test="${user.post!=null}">
								<span>${user.post}</span>
							</c:if>
							<c:if test="${user.post==null}">
								<span>暂无角色信息</span>
							</c:if>
						</td>
						<td>
						<span><a class="viewUser" href="javascript:;" userId=${user.userId } userName=${user.userName }><img src="${pageContext.request.contextPath }/statics/images/read.png" alt="查看" title="查看"/></a></span>
						<span><a class="modifyUser" href="javascript:;" userId=${user.userId  } userName=${user.userName }><img src="${pageContext.request.contextPath }/statics/images/xiugai.png" alt="修改" title="修改"/></a></span>
						<span><a class="deleteUser" href="javascript:;" userId=${user.userId  } userName=${user.userName }><img src="${pageContext.request.contextPath }/statics/images/schu.png" alt="删除" title="删除"/></a></span>
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
<div class="remove" id="removeUse">
    <div class="removerChid">
        <h2>提示</h2>
        <div class="removeMain">
            <p>你确定要删除该用户吗？</p>
            <a href="#" id="yes">确定</a>
            <a href="#" id="no">取消</a>
        </div>
    </div>
</div>

<%@include file="/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/userlist.js"></script>
