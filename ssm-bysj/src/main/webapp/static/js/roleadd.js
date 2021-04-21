var roleKey = null;
var roleName = null;
var addBtn = null;
var backBtn = null;

$(function(){

	roleKey = $("#roleKey");
	roleName = $("#roleName");
	addBtn = $("#add");
	backBtn = $("#back");
	//初始化的时候，要把所有的提示信息变为：* 以提示必填项，更灵活，不要写在页面上
	roleName.next().html("*");

	/*
	 * 验证
	 * 失焦\获焦
	 * jquery的方法传递
	 */
	roleKey.bind("blur",function(){
		//ajax后台验证--roleCode是否已存在
		$.ajax({
			type:"GET",//请求类型
			url:"/role/roleKey",//请求的url
			data:{roleKey:roleKey.val()},//请求参数
			dataType:"json",//ajax接口（请求url）返回的数据类型
			success:function(data){//data：返回数据（json对象）
				if(data.roleKey == "exist"){//编码已存在，错误提示
					validateTip(roleKey.next(),{"color":"red"},imgNo+ " 该权限字符已存在",false);
				}else if(data.roleKey == "error"){//编码输入为空
					validateTip(roleKey.next(),{"color":"red"},imgNo + " 权限字符不能为空",false);
				}else if (data.roleKey == "true"){//编码可用，正确提示
					validateTip(roleKey.next(),{"color":"green"},imgYes+" 可以使用",true);
				}
			},
			error:function(data){//当访问时候，404，500 等非200的错误状态码
				validateTip(roleCode.next(),{"color":"red"},imgNo+" 您访问的页面不存在",false);
			}
		});
	}).bind("focus",function(){
		//显示友情提示
		validateTip(roleKey.next(),{"color":"#666666"},"* 请输入角色权限字符",false);
	}).focus();

	roleName.on("focus",function(){
		validateTip(roleName.next(),{"color":"#666666"},"* 请输入角色名称",false);
	}).on("blur",function(){
		if(roleName.val() != null && roleName.val() != ""){
			validateTip(roleName.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(roleName.next(),{"color":"red"},imgNo+" 角色名称不能为空，请重新输入",false);
		}
		
	});

	
	addBtn.on("click",function(){
		if(roleKey.attr("validateStatus") != "true"){
			roleKey.blur();
		}else if(roleName.attr("validateStatus") != "true"){
			roleName.blur();
		}else{
			if(confirm("是否确认提交数据")){
				$("#roleForm").submit();
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