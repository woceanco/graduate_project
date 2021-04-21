<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="/jsp/common/head.jsp"%>
<div class="right">
    <div class="location">
        <strong>你现在所在的位置是:</strong>
        <span>职位管理页面 >> 信息查看</span>
    </div>
    <div class="providerView">
        <p><strong>职位编码：&nbsp</strong><span>${post.postCode }</span></p>
        <p><strong>职位名称：&nbsp</strong><span>${post.postName }</span></p>
        <p><strong>状&nbsp&nbsp态：</strong>
            <span>
         		<c:if test="${post.status == 0}">正常</c:if>
				<c:if test="${post.status == 1}">停用</c:if>
			</span>
        </p>
        <p>
            <strong>创建日期：</strong>
            <c:if test="${post.createTime !=null&&post.createTime!=''}">
                <span>${post.createTime}</span>
            </c:if>
            <c:if test="${post.createTime==null||post.createTime==''}">
                <span style="color: #faca0d">暂无信息</span>
            </c:if>
        </p>
        <p>
            <strong>创建账号：</strong>
            <c:if test="${post.createBy !=null&&post.createBy!=''}">
                <span>${post.createBy}</span>
            </c:if>
            <c:if test="${post.createBy==null||post.createBy==''}">
                <span style="color: #faca0d">暂无信息</span>
            </c:if>
        </p>
        <p>
            <strong>最近修改日期：</strong>
            <c:if test="${post.updateTime !=null&&post.updateTime!=''}">
                <span>${post.updateTime}</span>
            </c:if>
            <c:if test="${post.updateTime==null||post.updateTime==''}">
                <span style="color: #faca0d">暂无信息</span>
            </c:if>
        </p>
        <p>
            <strong>最近修改账号：</strong>
            <c:if test="${post.updateBy !=null&&post.updateBy!=''}">
                <span>${post.updateBy}</span>
            </c:if>
            <c:if test="${post.updateBy==null||post.updateBy==''}">
                <span style="color: #faca0d">暂无信息</span>
            </c:if>
        </p>
        <div class="providerAddBtn">
            <input type="button" id="back" name="back" value="返回" >
        </div>
    </div>
</div>
</section>
<%@include file="/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/postview.js"></script>