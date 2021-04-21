var roleObj;

//角色管理页面上点击删除按钮弹出删除框(rolelist.jsp)
function deleterole(obj){
	$.ajax({
		type:"GET",
		url:path+"/role/delete",
		data:{roleId:obj.attr("roleId")},
		dataType:"json",
		success:function(data){
			if(data.delResult == "true"){//删除成功：移除删除行
				cancleBtn();
				obj.parents("tr").remove();
			}else if(data.delResult == "false"){//删除失败
				//alert("对不起，删除角色【"+obj.attr("rolecc")+"】失败");
				changeDLGContent("对不起，删除角色【"+obj.attr("roleName")+"】失败");
			}else if(data.delResult == "notexist"){
				//alert("对不起，角色【"+obj.attr("rolecc")+"】不存在");
				changeDLGContent("对不起，角色【"+obj.attr("roleName")+"】不存在");
			}
		},
		error:function(data){
			changeDLGContent("对不起，删除失败");
		}
	});
}

function openYesOrNoDLG(){
	$('.zhezhao').css('display', 'block');
	$('#removeBi').fadeIn();
}

function cancleBtn(){
	$('.zhezhao').css('display', 'none');
	$('#removeBi').fadeOut();
}
function changeDLGContent(contentStr){
	var p = $(".removeMain").find("p");
	p.html(contentStr);
}

$(function(){
	$(".viewrole").on("click",function(){
		//将被绑定的元素（a）转换成jquery对象，可以使用jquery方法
		var obj = $(this);
		window.location.href=path+"/role/view?roleId="+ obj.attr("roleId");
	});
	
	$(".modifyrole").on("click",function(){
		var obj = $(this);
		window.location.href=path+"/role/update?roleId="+ obj.attr("roleId");
	});
	$('#no').click(function () {
		cancleBtn();
	});
	
	$('#yes').click(function () {
		deleterole(roleObj);
	});

	$(".deleterole").on("click",function(){
		roleObj = $(this);
		changeDLGContent("你确定要删除角色【"+roleObj.attr("roleName")+"】吗？");
		openYesOrNoDLG();
	});

});