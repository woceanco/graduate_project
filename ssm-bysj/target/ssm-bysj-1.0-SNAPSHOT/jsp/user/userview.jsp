<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/jsp/common/head.jsp"%>
 <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>员工信息管理页面 >> 员工信息查看页面</span>
        </div>
        <div class="providerView">
            <p><strong>员工编号：</strong><span>${user.userId }</span></p>
            <p><strong>员工名称：</strong><span>${user.userName }</span></p>
            <p><strong>员工性别：</strong>
            	<span>
            		<c:if test="${user.sex == 0 }">男</c:if>
					<c:if test="${user.sex == 1 }">女</c:if>
				</span>
			</p>
            <p><strong>员工邮箱：</strong><span>${user.email }</span></p>
            <p><strong>员工电话：</strong><span>${user.phonenumber }</span></p>
            <p>
                <strong>员工职位：</strong>
                <c:if test="${user.post !=null&&user.post!=''}">
                    <span>${user.post}</span>
                </c:if>
                <c:if test="${user.post==null||user.post==''}">
                    <span style="color: #faca0d">暂无信息</span>
                </c:if>
            </p>
            <p>
                <strong>员工部门：</strong>
                <c:if test="${user.dept !=null&&user.dept!=''}">
                    <span>${user.dept}</span>
                </c:if>
                <c:if test="${user.dept==null||user.dept==''}">
                    <span style="color: #faca0d">暂无信息</span>
                </c:if>
            </p>
            <p>
                <strong>创建日期：</strong>
                <c:if test="${user.createTime !=null&&user.createTime!=''}">
                    <span>${user.createTime}</span>
                </c:if>
                <c:if test="${user.createTime==null||user.createTime==''}">
                    <span style="color: #faca0d">暂无信息</span>
                </c:if>
            </p>
            <p>
                <strong>创建信息账号：</strong>
                <c:if test="${user.createBy !=null&&user.createBy!=''}">
                    <span>${user.createBy}</span>
                </c:if>
                <c:if test="${user.createBy==null||user.createBy==''}">
                    <span style="color: #faca0d">暂无信息</span>
                </c:if>
            </p>
            <p>
                <strong>最近修改日期：</strong>
                <c:if test="${user.updateTime !=null&&user.updateTime!=''}">
                    <span>${user.updateTime}</span>
                </c:if>
                <c:if test="${user.updateTime==null||user.updateTime==''}">
                    <span style="color: #faca0d">暂无信息</span>
                </c:if>
            </p>
            <p>
                <strong>最近修改账号：</strong>
                <c:if test="${user.updateBy !=null&&user.updateBy!=''}">
                    <span>${user.updateBy}</span>
                </c:if>
                <c:if test="${user.updateBy==null||user.updateBy==''}">
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
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/userview.js"></script>