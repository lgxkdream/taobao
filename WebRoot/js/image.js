﻿//鼠标经过预览图片函数
function preview(img){
	$("#preview .jqzoom img").attr("src",$(img).attr("src"));
	$("#preview .jqzoom img").attr("jqimg",$(img).attr("bimg"));
}
//图片放大镜效果
$(function(){
	$(".jqzoom").jqueryzoom({xzoom:200,yzoom:210});
});

