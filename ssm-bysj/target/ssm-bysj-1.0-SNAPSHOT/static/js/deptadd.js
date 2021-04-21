var deptCode = null;
var deptName = null;
var leader = null;
var deptPhone = null;
var deptEmail = null;
var addBtn = null;
var backBtn = null;

$(function(){
	deptCode  =$("#deptCode");
	deptName   = $("#deptName");
	leader = $("#leader");
	deptPhone  = $("#phone");
	deptEmail  = $("#email");
	addBtn = $("#add");
	backBtn = $("#back");
	//初始化的时候，要把所有的提示信息变为：* 以提示必填项，更灵活，不要写在页面上
	deptCode.next().html("*");
	deptName.next().html("*");
	leader.next().html("*");
	deptPhone.next().html("*");
	deptEmail.next().html("*");


	/*
	 * 验证
	 * 失焦\获焦
	 * jquery的方法传递
	 */
	deptCode.bind("blur",function(){
		$.ajax({
			type:"GET",//请求类型
			url:"/dept/deptCode",//请求的url
			data:{deptCode:deptCode.val()},//请求参数
			dataType:"json",//ajax接口（请求url）返回的数据类型
			success:function(data){//data：返回数据（json对象）
				console.log("data=",data);
				if(data.deptCode == "exist"){//供应商编码已存在，错误提示
					validateTip(deptCode.next(),{"color":"red"},imgNo+ " 该编码已存在",false);
				}else if(data.deptCode == "error"){//编码输入为空
					validateTip(deptCode.next(),{"color":"red"},imgNo + " 编码不能为空",false);
				}else if (data.deptCode == "true"){//供应商编码可用，正确提示
					validateTip(deptCode.next(),{"color":"green"},imgYes+" 可以使用",true);
				}
			},
			error:function(data){//当访问时候，404，500 等非200的错误状态码
				validateTip(deptCode.next(),{"color":"red"},imgNo+" 您访问的页面不存在",false);
			}
		});
	}).bind("focus",function(){
		//显示友情提示
		validateTip(deptCode.next(),{"color":"#666666"},"* 请输入编码",false);
	}).focus();


	
	deptName.on("focus",function(){
		validateTip(deptName.next(),{"color":"#666666"},"* 请输入供应商名称",false);
	}).on("blur",function(){
		if(deptName.val() != null && deptName.val() != ""){
			validateTip(deptName.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(deptName.next(),{"color":"red"},imgNo+" 供应商名称不能为空，请重新输入",false);
		}
		
	});
	
	leader.on("focus",function(){
		validateTip(leader.next(),{"color":"#666666"},"* 请输入联系人",false);
	}).on("blur",function(){
		if(leader.val() != null && leader.val() != ""){
			validateTip(leader.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(leader.next(),{"color":"red"},imgNo+" 联系人不能为空，请重新输入",false);
		}
		
	});
	
	deptPhone.on("focus",function(){
		validateTip(deptPhone.next(),{"color":"#666666"},"* 请输入手机号",false);
	}).on("blur",function(){
		var patrn=/^(13[0-9]|15[0-9]|18[0-9])\d{8}$/;
		if(deptPhone.val().match(patrn)){
			validateTip(deptPhone.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(deptPhone.next(),{"color":"red"},imgNo + " 您输入的手机号格式不正确",false);
		}
	});

	deptEmail.on("focus",function(){
		validateTip(deptEmail.next(),{"color":"#666666"},"* 请输入邮箱号",false);
	}).on("blur",function(){
		var patrn=/^\w+((.\w+)|(-\w+))@[A-Za-z0-9]+((.|-)[A-Za-z0-9]+).[A-Za-z0-9]+$/;
		if(deptEmail.val().match(patrn)){
			validateTip(deptEmail.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(deptEmail.next(),{"color":"red"},imgNo + " 您输入的邮箱号格式不正确",false);
		}
	});


	addBtn.bind("click",function(){
		if(deptCode.attr("validateStatus") != "true"){
			deptCode.blur();
		}else if(deptName.attr("validateStatus") != "true"){
			deptName.blur();
		}else if(leader.attr("validateStatus") != "true"){
			leader.blur();
		}else if(deptPhone.attr("validateStatus") != "true"){
			deptPhone.blur();
		}else{
			if(confirm("是否确认提交数据")){
				$("#providerForm").submit();
			}
		}
	});
	
	backBtn.on("click",function(){
		if(referer != undefined 
			&& null != referer 
			&& "" != referer
			&& "null" != referer
			&& referer.length > 4){
		 window.location.href = referer;
		}else{
			history.back(-1);
		}
	});
});