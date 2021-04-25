﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/jsp/common/head.jsp" %>
<div class="right">
    <div class="location">
        <strong>你现在所在的位置是:</strong>
        <span>公告管理页面 >> 公告信息查看</span>
    </div>
    <div class="providerView">
        <p><strong>公告标题：&nbsp</strong><span>${notice.noticeTitle }</span>
            <strong>公告类型：</strong>
            <span>
         		<c:if test="${notice.noticeType == 1}">通知</c:if>
				<c:if test="${notice.noticeType == 2}">公告</c:if>
			</span>
            <strong>公告状态：</strong>
            <span>
         		<c:if test="${notice.status == 0}">正常</c:if>
				<c:if test="${notice.status == 1}">已过期</c:if>
			</span>
            <strong>创建日期：</strong>
            <c:if test="${notice.createTime !=null&&notice.createTime!=''}">
                <span>${notice.createTime}</span>
            </c:if>
            <c:if test="${notice.createTime==null||notice.createTime==''}">
                <span style="color: #faca0d">暂无信息</span>
            </c:if>
        </p>
        <strong>公告内容：</strong>
        <p style="border: #a59b9b solid 1px;margin: 0 10px">${notice.noticeContent}</p>
        <div class="providerAddBtn">
            <input type="button" id="back" name="back" value="返回">
        </div>
    </div>
</div>
</section>
<%@include file="/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/postview.js"></script>