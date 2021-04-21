var noticeTitle = null;
var saveBtn = null;
var backBtn = null;


$(function(){
	noticeTitle = $("#noticeTitle");
	saveBtn = $("#save");
	backBtn = $("#back");
	//初始化的时候，要把所有的提示信息变为：* 以提示必填项，更灵活，不要写在页面上
	noticeTitle.next().html("*");


	noticeTitle.on("focus",function(){
		validateTip(noticeTitle.next(),{"color":"#666666"},"* 请输入职位名称",false);
	}).on("blur",function(){
		if(noticeTitle.val() != null && noticeTitle.val() != ""){
			validateTip(noticeTitle.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(noticeTitle.next(),{"color":"red"},imgNo+" 职位名称不能为空，请重新输入",false);
		}
		
	});

	saveBtn.on("click",function(){
		if(noticeTitle.blur()){
			if(confirm("是否确认提交数据")){
				$("#noticeForm").submit();
			}
		}
	});
	
	backBtn.on("click",function(){
		//alert("modify: "+referer);
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