var noticeObj;

//职位管理页面上点击删除按钮弹出删除框(noticelist.jsp)
function deletenotice(obj){
	$.ajax({
		type:"GET",
		url:path+"/notice/delete",
		data:{noticeId:obj.attr("noticeId")},
		dataType:"json",
		success:function(data){
			if(data.delResult == "true"){//删除成功：移除删除行
				cancleBtn();
				obj.parents("tr").remove();
			}else if(data.delResult == "false"){//删除失败
				changeDLGContent("对不起，删除公告【"+obj.attr("noticeTitle")+"】失败");
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
	$(".viewnotice").on("click",function(){
		//将被绑定的元素（a）转换成jquery对象，可以使用jquery方法
		var obj = $(this);
		window.location.href=path+"/notice/view?noticeId="+ obj.attr("noticeId");
	});
	
	$(".modifynotice").on("click",function(){
		var obj = $(this);
		window.location.href=path+"/notice/update?noticeId="+ obj.attr("noticeId");
	});
	$('#no').click(function () {
		cancleBtn();
	});
	
	$('#yes').click(function () {
		deletenotice(noticeObj);
	});

	$(".deletenotice").on("click",function(){
		noticeObj = $(this);
		changeDLGContent("你确定要删除公告【"+noticeObj.attr("noticeTitle")+"】吗？");
		openYesOrNoDLG();
	});

});