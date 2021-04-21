var userObj;

$(function(){
    //通过jquery的class选择器（数组）
    //对每个class为viewUser的元素进行动作绑定（click）
    /**
     * bind、live、delegate
     * on
     */
    $(".viewUser").on("click",function(){
        //将被绑定的元素（a）转换成jquery对象，可以使用jquery方法
        var obj = $(this);
        //console.log("userid=",obj.attr("userid"))
        window.location.href="/user/view?userId="+ obj.attr("userId");
    });
    //修改
    $(".modifyUser").on("click",function(){
        var obj = $(this);
        window.location.href="/user/update?userId="+ obj.attr("userId");
    });


    $('#no').click(function () {
        cancleBtn();
    });
    $('#yes').click(function () {
        deleteUser(userObj);
    });
    $(".deleteUser").on("click",function () {
        userObj = $(this);
        changeDLGContent("你确定要删除用户【"+userObj.attr("userName")+"】吗？");
        openYesOrNoDLG();
    })
});

//用户管理页面上点击删除按钮弹出删除框(oper.jsp)
function deleteUser(obj){

    $.ajax({
        type:"GET",
        url:path+"/user/delete",
        data:{uid:obj.attr("userId")},
        dataType:"json",
        success:function(data){
            if(data.delResult == "true"){//删除成功：移除删除行
                cancleBtn();
                obj.parents("tr").remove();
            }else if(data.delResult == "false"){//删除失败
                //alert("对不起，删除用户【"+obj.attr("userName")+"】失败");
                changeDLGContent("对不起，删除用户【"+obj.attr("userName")+"】失败");
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
    $('#removeUse').fadeIn();
}
function cancleBtn(){
    $('.zhezhao').css('display', 'none');
    $('#removeUse').fadeOut();
}
function changeDLGContent(contentStr){
    var p = $(".removeMain").find("p");
    p.html(contentStr);
}
