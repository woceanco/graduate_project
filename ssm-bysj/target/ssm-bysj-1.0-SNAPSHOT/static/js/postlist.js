var postObj;

//职位管理页面上点击删除按钮弹出删除框(postlist.jsp)
function deletepost(obj){
	$.ajax({
		type:"GET",
		url:path+"/post/delete",
		data:{postId:obj.attr("postId")},
		dataType:"json",
		success:function(data){
			if(data.delResult == "true"){//删除成功：移除删除行
				cancleBtn();
				obj.parents("tr").remove();
			}else if(data.delResult == "false"){//删除失败
				//alert("对不起，删除职位【"+obj.attr("postcc")+"】失败");
				changeDLGContent("对不起，删除职位【"+obj.attr("postcc")+"】失败");
			}else if(data.delResult == "notexist"){
				//alert("对不起，职位【"+obj.attr("postcc")+"】不存在");
				changeDLGContent("对不起，职位【"+obj.attr("postcc")+"】不存在");
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
	$(".viewpost").on("click",function(){
		//将被绑定的元素（a）转换成jquery对象，可以使用jquery方法
		var obj = $(this);
		window.location.href=path+"/post/view?postId="+ obj.attr("postId");
	});
	
	$(".modifypost").on("click",function(){
		var obj = $(this);
		window.location.href=path+"/post/update?postId="+ obj.attr("postId");
	});
	$('#no').click(function () {
		cancleBtn();
	});
	
	$('#yes').click(function () {
		deletepost(postObj);
	});

	$(".deletepost").on("click",function(){
		postObj = $(this);
		changeDLGContent("你确定要删除职位【"+postObj.attr("postcc")+"】吗？");
		openYesOrNoDLG();
	});

});