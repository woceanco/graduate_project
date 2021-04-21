<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/jsp/common/head.jsp"%>
 <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>部门管理页面 >> 部门信息查看</span>
        </div>
        <div class="providerView">
            <p><strong>部门编码：</strong><span>${dept.deptCode }</span></p>
            <p><strong>部门名称：</strong><span>${dept.deptName }</span></p>
            <p><strong>部门领导：</strong><span>${dept.leader }</span></p>
            <p><strong>部门电话：</strong><span>${dept.phone }</span></p>
            <p><strong>部门邮箱：</strong><span>${dept.email }</span></p>
            <p>
                <strong>创建日期：</strong>
                <c:if test="${dept.createTime !=null&&dept.createTime!=''}">
                    <span>${dept.createTime}</span>
                </c:if>
                <c:if test="${dept.createTime==null||dept.createTime==''}">
                    <span style="color: #faca0d">暂无信息</span>
                </c:if>
            </p>
            <p>
                <strong>创建账号：</strong>
                <c:if test="${dept.createBy !=null&&dept.createBy!=''}">
                    <span>${dept.createBy}</span>
                </c:if>
                <c:if test="${dept.createBy==null||dept.createBy==''}">
                    <span style="color: #faca0d">暂无信息</span>
                </c:if>
            </p>
            <p>
                <strong>最近修改日期：</strong>
                <c:if test="${dept.updateTime !=null&&dept.updateTime!=''}">
                    <span>${dept.updateTime}</span>
                </c:if>
                <c:if test="${dept.updateTime==null||dept.updateTime==''}">
                    <span style="color: #faca0d">暂无信息</span>
                </c:if>
            </p>
            <p>
                <strong>最近修改账号：</strong>
                <c:if test="${dept.updateBy !=null&&dept.updateBy!=''}">
                    <span>${dept.updateBy}</span>
                </c:if>
                <c:if test="${dept.updateBy==null||dept.updateBy==''}">
                    <span style="color: #faca0d">暂无信息</span>
                </c:if>
            </p>
            <p><strong>描述：</strong><span>${dept.detail}</span></p>
			<div class="providerAddBtn">
            	<input type="button" id="back" name="back" value="返回" >
            </div>
        </div>
    </div>
</section>
<%@include file="/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/deptview.js"></script>
