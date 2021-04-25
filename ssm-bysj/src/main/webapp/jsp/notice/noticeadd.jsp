﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="/jsp/common/head.jsp"%>

<div class="right">
    <div class="location">
        <strong>你现在所在的位置是:</strong>
        <span>公告管理页面 >> 公告添加页面</span>
    </div>
    <div class="providerAdd">
        <form id="noticeForm" name="noticeForm" method="notice" action="${pageContext.request.contextPath }/notice/add">
            <div>
                <label for="noticeTitle">公告标题：</label>
                <input type="text" name="noticeTitle" id="noticeTitle" value="">
                <font color="red"></font>
            </div>
            <div>
                <label >公告类型：</label>
                <select name="noticeType" id="noticeType">
                    <option value="1" selected="selected">通知</option>
                    <option value="2">公告</option>
                </select>
            </div>
            <div>
                <label for="createTime">创建时间：</label>
                <input type="datetime-local" name="createTime" id="createTime" value=""/>
                <font color="red"></font>
            </div>
            <div>
                <label for="noticeContent">公告内容：</label>
                <textarea name="noticeContent" cols="90" rows="9" id="noticeContent"></textarea>
            </div>
            <div>
                <div class="providerAddBtn">
                    <input type="button" name="add" id="add" value="保存">
                    <input type="button" id="back" name="back" value="返回" >
                </div>
        </form>

    </div>
</div>
</section>
<%@include file="/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/noticeadd.js"></script>