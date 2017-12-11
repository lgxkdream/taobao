<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>淘淘网 - 淘 ! 我喜欢</title>
		<link href="favicon.ico" rel="shortcut icon" type="image/x-icon"/>
		<link href="${pageContext.request.contextPath}/css/slider.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/css/banner.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.4.2.min.js"></script>
        <link href="${pageContext.request.contextPath}/css/menu.css" rel="stylesheet" type="text/css"/>
		<%--<script type="text/javascript" src="${pageContext.request.contextPath}/js/index_v20.js" />
        --%>
        <script>
        
$(function(){
        var $banner=$('.banner');
        var $banner_ul=$('.banner-img');
        var $btn=$('.banner-btn');
        var $btn_a=$btn.find('a')
        var v_width=$banner.width();
        
        var page=1;
        
        var timer=null;
        var btnClass=null;

        var page_count=$banner_ul.find('li').length;//把这个值赋给小圆点的个数
        
        var banner_cir="<li class='selected' href='#'><a></a></li>";
        for(var i=1;i<page_count;i++){
                //动态添加小圆点
                banner_cir+="<li><a href='#'></a></li>";
                }
        $('.banner-circle').append(banner_cir);
        
        var cirLeft=$('.banner-circle').width()*(-0.5);
        $('.banner-circle').css({'marginLeft':cirLeft});
        
        $banner_ul.width(page_count*v_width);
        
        function move(obj,classname){
                //手动及自动播放
        if(!$banner_ul.is(':animated')){
                if(classname=='prevBtn'){
                        if(page==1){
                                        $banner_ul.animate({left:-v_width*(page_count-1)});
                                        page=page_count; 
                                        cirMove();
                        }
                        else{
                                        $banner_ul.animate({left:'+='+v_width},"slow");
                                        page--;
                                        cirMove();
                        }        
                }
                else{
                        if(page==page_count){
                                        $banner_ul.animate({left:0});
                                        page=1;
                                        cirMove();
                                }
                        else{
                                        $banner_ul.animate({left:'-='+v_width},"slow");
                                        page++;
                                        cirMove();
                                }
                        }
                }
        }
        
        function cirMove(){
                //检测page的值，使当前的page与selected的小圆点一致
                $('.banner-circle li').eq(page-1).addClass('selected')
                                                                                                .siblings().removeClass('selected');
        }
        
        $banner.mouseover(function(){
                $btn.css({'display':'block'});
                clearInterval(timer);
                                }).mouseout(function(){
                $btn.css({'display':'none'});                
                clearInterval(timer);
                timer=setInterval(move,3000);
                                }).trigger("mouseout");//激活自动播放

        $btn_a.mouseover(function(){
                //实现透明渐变，阻止冒泡
                        $(this).animate({opacity:0.6},'fast');
                        $btn.css({'display':'block'});
                         return false;
                }).mouseleave(function(){
                        $(this).animate({opacity:0.3},'fast');
                        $btn.css({'display':'none'});
                         return false;
                }).click(function(){
                        //手动点击清除计时器
                        btnClass=this.className;
                        clearInterval(timer);
                        timer=setInterval(move,3000);
                        move($(this),this.className);
                });
                
        $('.banner-circle li').live('click',function(){
                        var index=$('.banner-circle li').index(this);
                        $banner_ul.animate({left:-v_width*index},'slow');
                        page=index+1;
                        cirMove();
                });
});
</script>
	</head>
	<body>

		<div class="container header">
		
			<%@ include file="header.jsp"%>

		</div>

 <!-- 此处为图片轮播 此处为图片轮播 此处为图片轮播 此处为图片轮播 此处为图片轮播 --><%--
 
 <div id="nav">
			<div class="area clearfix">
				<div class="category-content" id="guide_2">
					<div>
						<span class="all-goods">全部商品<em>（686310）</em>
						</span>
					</div>
					<div class="category">
						<ul class="category-list" id="js_climit_li">
							<li class="appliance js_toggle relative first">
							
							
								<div class="category-info list-nz">
									<h3 class="category-name b-category-name">
										<i></i><a id="s-category-289" class="ml-22" title="女装">男装女装</a>
									</h3>
									<p class="c-category-list limit-24">
										<a title="连衣裙" id="s-goods-category-289-1">连衣裙</a><a
											title="针织衫" id="s-goods-category-289-2">针织衫</a><a title="T恤"
											id="s-goods-category-289-3">T恤</a><a title="牛仔裤"
											id="s-goods-category-289-4">牛仔裤</a>
									</p>
									<em>&gt;</em>
								</div>
								
								
								<textarea class="menu-item-wrap none">
									<div class="menu-item menu-in top">
										<div class="area-in">
											<div class="area-bg">
												<div class="menu-srot">
													<div class="sort-side">
														<dl class="dl-sort">
															
															<dd>
																<a title="马甲" id="scategory-304"><span>马甲</span>
																</a>
															</dd>
															<dd>
																<a title="风衣/大衣" id="scategory-307"><span>风衣/大衣</span>
																</a>
															</dd>
															<dd>
																<a title="棉衣/棉服" id="scategory-309"><span>棉衣/棉服</span>
																</a>
															</dd>
															<dd>
																<a title="短外套" id="scategory-77878"><span>短外套</span>
																</a>
															</dd>
															<dd>
																<a title="皮衣" id="scategory-77912"><span>皮衣</span>
																</a>
															</dd>
															<dd>
																<a title="皮草" id="scategory-77913"><span>皮草</span>
																</a>
															</dd>
															<dd>
																<a title="小西装" id="scategory-77923"><span>小西装</span>
																</a>
															</dd>
															<dd>
																<a title="中长外套" id="scategory-106545"><span>中长外套</span>
																</a>
															</dd>
															<dd>
																<a title="羽绒服" id="scategory-184539"><span>羽绒服</span>
																</a>
															</dd>
														</dl>
														
														
													</div>
													
												</div>
											</div>
										</div>
									</div>
                                 </textarea>
							</li>


						</ul>
					</div>
				</div>
			</div>
		</div>
 
 
 
 --%><!-- ############################################################################## -->

<div align="center" style="width:850px; margin:0 auto">
<div class="banner">
	<div class="banner-btn">
		<a href="javascript:;" class="prevBtn"><i></i></a>
		<a href="javascript:;" class="nextBtn"><i></i></a>
	</div>
	<ul class="banner-img">
		<li><a href="#" target="_blank"><img width="850px" height="280px" src="${pageContext.request.contextPath}/images/banner/T1B1JYFCpdXXazuKP7-520-280.jpg"/></a></li>
		<li><a href="#"><img width="850px" height="280px" src="${pageContext.request.contextPath}/images/banner/T16YtiFE4aXXb1upjX.jpg"/></a></li>
		<li><a href="#"><img width="850px" height="280px" src="${pageContext.request.contextPath}/images/banner/T1Oi0oFrFkXXb1upjX.jpg"/></a></li>
		<li><a href="#"><img width="850px" height="280px" src="${pageContext.request.contextPath}/images/banner/T1LtlPFppjXXb1upjX.jpg"/></a></li>
		<li><a href="#"><img width="850px" height="280px" src="${pageContext.request.contextPath}/images/banner/T1GGJWFvpgXXazuKP7-520-280.jpg"/></a></li>
		<li><a href="#"><img width="850px" height="280px" src="${pageContext.request.contextPath}/images/banner/T104hZFBVdXXazuKP7-520-280.jpg"/></a></li>
	</ul>
	<ul class="banner-circle"></ul>
</div>
</div>



<br/>
 <!-- 图片轮播结束 图片轮播结束 图片轮播结束 图片轮播结束 图片轮播结束 图片轮播结束 -->
 
		<div class="container index">


			<div class="span24">
				<div id="hotProduct" class="hotProduct clearfix">
					<div class="title">
						<strong>热门商品</strong>
						<!-- <a  target="_blank"></a> -->
					</div>
					<ul class="tab">
						<li class="current">
							<a href="./蔬菜分类.htm?tagIds=1" target="_blank"></a>
						</li>
						<li>
							<a target="_blank"></a>
						</li>
					</ul>
					
					<ul class="tabContent" style="display: block;">
					    <s:iterator var="p" value="phlist">
						<li>
							<a href="${pageContext.request.contextPath}/product_findByPid.action?pid=<s:property value="#p.pid"/>" target="_blank"><img
									src="${pageContext.request.contextPath}/<s:property value="#p.image"/>"
									style="display: block;"/>
							</a>
						</li>
					    </s:iterator>
					</ul>
					
				</div>
			</div>
			<div class="span24">
				<div id="newProduct" class="newProduct clearfix">
					<div class="title">
						<strong>最新商品</strong>
						<a target="_blank"></a>
					</div>
					<ul class="tab">
						<li class="current">
							<a href="./蔬菜分类.htm?tagIds=2" target="_blank"></a>
						</li>
						<li>
							<a target="_blank"></a>
						</li>
						
					</ul>
						
					<ul class="tabContent" style="display: block;">
						  <s:iterator var="p" value="pnlist">
						<li>
							<a href="${pageContext.request.contextPath}/product_findByPid.action?pid=<s:property value="#p.pid"/>" target="_blank"><img
									src="${pageContext.request.contextPath}/<s:property value="#p.image"/>"
									style="display: block;"/>
							</a>
						</li>
					    </s:iterator>
					</ul>
					
					
				</div>
			</div>
			<div class="span24">
				<div class="friendLink">
					<dl>
						<dt>
							新手指南
						</dt>
						<dd>
							<a target="_blank">支付方式</a> |
						</dd>
						<dd>
							<a target="_blank">配送方式</a> |
						</dd>
						<dd>
							<a target="_blank">售后服务</a> |
						</dd>
						<dd>
							<a target="_blank">购物帮助</a> |
						</dd>
						<dd>
							<a target="_blank">蔬菜卡</a> |
						</dd>
						<dd>
							<a target="_blank">礼品卡</a> |
						</dd>
						<dd>
							<a target="_blank">银联卡</a> |
						</dd>
						<dd>
							<a target="_blank">亿家卡</a> |
						</dd>

						<dd class="more">
							<a>更多</a>
						</dd>
					</dl>
				</div>
			</div>
		</div>
		<div class="container footer">
		<%@ include file="footer.jsp"%>
		</div>
<script type="text/javascript">
(function() {
	var $menuLi = $('#nav .menu');
	var $menuHd = $('#nav .menu-hd');
	var $menuBd = $('#nav .menu-bd');
	var $arrow = $('#nav .m1 i');
	$menuBd.hover(function() {
		$menuHd.addClass('on');
	}, function() {
		$menuHd.removeClass('on');
	});
	$menuLi.hover(function() {
		$menuHd.children('b').addClass('b-on');
	}, function() {
		$menuHd.children('b').removeClass('b-on');
	})
})();
</script>
	</body>
</html>