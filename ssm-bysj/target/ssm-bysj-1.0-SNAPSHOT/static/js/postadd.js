var postCode = null;
var postName = null;
var addBtn = null;
var backBtn = null;

$(function(){
	postCode = $("#postCode");
	postName = $("#postName");
	addBtn = $("#add");
	backBtn = $("#back");
	//初始化的时候，要把所有的提示信息变为：* 以提示必填项，更灵活，不要写在页面上
	postCode.next().html("*");
	postName.next().html("*");

	/*
	 * 验证
	 * 失焦\获焦
	 * jquery的方法传递
	 */
	postCode.bind("blur",function(){
		//ajax后台验证--postCode是否已存在
		$.ajax({
			type:"GET",//请求类型
			url:"/post/postCode",//请求的url
			data:{postCode:postCode.val()},//请求参数
			dataType:"json",//ajax接口（请求url）返回的数据类型
			success:function(data){//data：返回数据（json对象）
				if(data.postCode == "exist"){//编码已存在，错误提示
					validateTip(postCode.next(),{"color":"red"},imgNo+ " 该编码已存在",false);
				}else if(data.postCode == "error"){//编码输入为空
					validateTip(postCode.next(),{"color":"red"},imgNo + " 编码不能为空",false);
				}else if (data.postCode == "true"){//编码可用，正确提示
					validateTip(postCode.next(),{"color":"green"},imgYes+" 可以使用",true);
				}
			},
			error:function(data){//当访问时候，404，500 等非200的错误状态码
				validateTip(postCode.next(),{"color":"red"},imgNo+" 您访问的页面不存在",false);
			}
		});
	}).bind("focus",function(){
		//显示友情提示
		validateTip(postCode.next(),{"color":"#666666"},"* 请输入职位编码",false);
	}).focus();

	postName.on("focus",function(){
		validateTip(postName.next(),{"color":"#666666"},"* 请输入职位名称",false);
	}).on("blur",function(){
		if(postName.val() != null && postName.val() != ""){
			validateTip(postName.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(postName.next(),{"color":"red"},imgNo+" 职位名称不能为空，请重新输入",false);
		}
		
	});

	
	addBtn.on("click",function(){
		if(postCode.attr("validateStatus") != "true"){
			postCode.blur();
		}else if(postName.attr("validateStatus") != "true"){
			postName.blur();
		}else{
			if(confirm("是否确认提交数据")){
				$("#postForm").submit();
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