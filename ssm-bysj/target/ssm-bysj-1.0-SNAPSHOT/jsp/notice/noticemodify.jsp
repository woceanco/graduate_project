﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="/jsp/common/head.jsp"%>

<div class="right">
    <div class="location">
        <strong>你现在所在的位置是:</strong>
        <span>职位管理页面 >> 职位添加页面</span>
    </div>
    <div class="providerAdd">
        <form id="noticeForm" name="noticeForm" method="notice" action="${pageContext.request.contextPath }/notice/updatenotice
">
            <input type="hidden" name="noticeId" value="${notice.noticeId }">
            <div>
                <label for="noticeTitle">公告标题：</label>
                <input type="text" name="noticeTitle" id="noticeTitle" value="${notice.noticeTitle}">
                <font color="red"></font>
            </div>
            <div>
                <label >公告类型：</label>
                <select name="noticeType" id="noticeType">
                    <c:choose>
                        <c:when test="${notice.noticeType == 0}">
                            <option value="0" selected="selected">通知</option>
                            <option value="1">公告</option>
                        </c:when>
                        <c:otherwise>
                            <option value="0">通知</option>
                            <option value="1" selected="selected">公告</option>
                        </c:otherwise>
                    </c:choose>
                </select>
            </div>
            <div>
                <label >公告状态：</label>
                <select name="status" id="status">
                    <c:choose>
                        <c:when test="${notice.status == 0}">
                            <option value="0" selected="selected">正常</option>
                            <option value="1">已过期</option>
                        </c:when>
                        <c:otherwise>
                            <option value="0">正常</option>
                            <option value="1" selected="selected">已过期</option>
                        </c:otherwise>
                    </c:choose>
                </select>
            </div>
            <div>
                <label for="updateTime">修改时间：</label>
                <input type="datetime-local" name="updateTime" id="updateTime" value="${notice.updateTime}"/>
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
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/noticemodify.js"></script>