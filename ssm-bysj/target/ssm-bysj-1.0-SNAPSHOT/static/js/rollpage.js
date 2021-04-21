function page_nav(frm,num){
	console.log("num=",num);
		frm.pageIndex.value = num;
		frm.submit();
}

function jump_to(frm,num){
    //alert(num);
	//验证用户的输入
	var regexp=/^[1-9]\d*$/;
	var totalPageCount = document.getElementById("totalPageCount").value;
	//alert(totalPageCount);
	if(!regexp.test(num)){
		console.log("num=",num);
		alert("请输入大于0的正整数！");
		return false;
	}else if((num-totalPageCount) > 0){
		alert("请输入小于总页数的页码");
		console.log("num=",num);
		return false;
	}else{
		console.log("num=",num);
		page_nav(frm,num);
	}
}