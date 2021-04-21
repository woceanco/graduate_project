var deptObj;

//点击删除按钮弹出删除框(deptlist.jsp)
function deleteProvider(obj){
	$.ajax({
		type:"GET",
		url:path+"/dept/delete",
		data:{deptId:obj.attr("deptId")},
		dataType:"json",
		success:function(data){
			if(data.delResult == "true" ){
				//删除成功：移除删除行
				cancleBtn();
				obj.parents("tr").remove();
			}else if(data.delResult == "exist"){
				changeDLGContent("对不起，部门【"+obj.attr("deptName")+"】下有【"+data.num+"】个员工，不能删除");
			}else{
				//删除失败
				changeDLGContent("对不起，删除部门【"+obj.attr("deptName")+"】失败");
			}
		},
		error:function(data){
			//alert("对不起，删除失败");
			changeDLGContent("对不起，删除失败");
		}
	});
}

function openYesOrNoDLG(){
	$('.zhezhao').css('display', 'block');
	$('#removeProv').fadeIn();
}

function cancleBtn(){
	$('.zhezhao').css('display', 'none');
	$('#removeProv').fadeOut();
}
function changeDLGContent(contentStr){
	var p = $(".removeMain").find("p");
	p.html(contentStr);
}
$(function(){
	$(".viewdept").on("click",function(){
		//将被绑定的元素（a）转换成jquery对象，可以使用jquery方法
		var obj = $(this);
		window.location.href=path+"/dept/view?deptId="+ obj.attr("deptId");
	});
	
	$(".modifydept").on("click",function(){
		var obj = $(this);
		window.location.href=path+"/dept/update?deptId="+ obj.attr("deptId");
	});

	$('#no').click(function () {
		cancleBtn();
	});
	
	$('#yes').click(function () {
		deleteProvider(deptObj);
	});

	$(".deletedept").on("click",function(){
		deptObj = $(this);
		changeDLGContent("你确定要删除供应商【"+deptObj.attr("deptName")+"】吗？");
		openYesOrNoDLG();
	});

});