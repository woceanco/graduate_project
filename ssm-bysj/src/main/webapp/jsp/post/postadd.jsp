<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/jsp/common/head.jsp"%>

<div class="right">
     <div class="location">
         <strong>你现在所在的位置是:</strong>
         <span>职位管理页面 >> 职位添加页面</span>
     </div>
     <div class="providerAdd">
         <form id="postForm" name="postForm" method="post" action="${pageContext.request.contextPath }/post/add">
             <!--div的class 为error是验证错误，ok是验证成功-->
             <div class="">
                 <label for="postCode">职位编码：</label>
                 <input type="text" name="postCode" class="text" id="postCode" value="">
				 <!-- 放置提示信息 -->
				 <font color="red"></font>
             </div>
             <div>
                 <label for="postName">职位名称：</label>
                 <input type="text" name="postName" id="postName" value="">
				 <font color="red"></font>
             </div>
             <div>
                 <label >状态：</label>
                 <select name="status" id="status">
                     <option value="0" selected="selected">正常</option>
                     <option value="1">停用</option>
                 </select>
             </div>
             <div>
                 <label for="createTime">创建时间：</label>
                 <input type="datetime-local" name="createTime" id="createTime" value=""/>
				 <font color="red"></font>
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
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/postadd.js"></script>