<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>${requestScope.hpname}_淘淘搜索</title>
<link href="favicon.ico" rel="shortcut icon" type="image/x-icon"/>
<link href="${ pageContext.request.contextPath }/css/common.css" rel="stylesheet" type="text/css"/>
<link href="${ pageContext.request.contextPath }/css/product.css" rel="stylesheet" type="text/css"/>

</head>
<body>
<div class="container header">

	<%@ include file="header.jsp"%>
	
</div>	
<div class="container productList">
		<div class="span6">
			<div class="hotProductCategory">
			   <s:iterator var="c" value="#session.clist">
						<dl>
							<dt> 
								<a href="${ pageContext.request.contextPath }/product_findByCid.action?cid=<s:property value="#c.cid"/>&page=1"><s:property value="#c.cname"/></a>
							</dt>
							      <s:iterator var="cs" value="#c.categorySeconds">
									<dd>
										<a href="${ pageContext.request.contextPath }/product_findByCsid.action?csid=<s:property value="#cs.csid"/>&page=1"><s:property value="#cs.csname"/></a>
									</dd>
								  </s:iterator>
						</dl>
						
		    	</s:iterator>	
						
			</div>
		</div>
		<div class="span18 last">
			
			<form id="productForm" action="${ pageContext.request.contextPath }/" method="get">
				
				<div id="result" class="result table clearfix">
						<ul>
						  <s:iterator var="p" value="pageBean.list">
					         	<li>
										<a href="${pageContext.request.contextPath}/product_findByPid.action?pid=<s:property value="#p.pid"/>">
											<img src="${ pageContext.request.contextPath }/<s:property value="#p.image"/>" width="170" height="170"  style="display: inline-block;"/>
											   
											<span class="price">
												￥<strong><s:property value="formatDouble(#p.shop_price)" /></strong>
											</span>
											 
											<span style='color:green'>
											   <s:property value="#p.pname"/>
											</span>
										</a>
								</li>
									
									
						 </s:iterator>			
									
						</ul>
				</div>
				
			<s:if test="pageBean.totalPage !=0">
	<div class="pagination">
	        <s:if test="pageBean.page !=1">
	            <a href="${pageContext.request.contextPath }/product_searchByPagePname.action?pname=${requestScope.hpname}&page=1" class="firstPage"></a>
			    <a href="${pageContext.request.contextPath }/product_searchByPagePname.action?pname=${requestScope.hpname}&page=<s:property value="pageBean.page-1"/>" class="previousPage"></a>
			</s:if>
			<s:else>
			    <span class="firstPage"></span>
			    <span class="previousPage"></span>
			</s:else>
			
			
			<!-- 中间分页码 中间分页码 中间分页码 -->
			<s:if test="pageBean.totalPage>5">
			    <s:if test="(pageBean.page+3)>pageBean.totalPage"> 
			    <span class="ellipsis">…</span>
			    <s:iterator var="p" begin="pageBean.totalPage-4" end="pageBean.totalPage">
		       	<s:if test="pageBean.page !=#p">
			    <a href="${pageContext.request.contextPath }/product_searchByPagePname.action?pname=${requestScope.hpname}&page=<s:property value="#p"/>"><s:property value="#p"/></a>
		    	</s:if>
			    <s:else>
			    <span class="currentPage"><s:property value="#p"/></span>
			    </s:else>
			    </s:iterator>
			    </s:if>
			    
			    <s:else>
			         <s:if test="pageBean.page>3">
			         <span class="ellipsis">…</span>
			         <s:iterator var="p" begin="pageBean.page-2" end="pageBean.page+2">
		           	 <s:if test="pageBean.page !=#p">
			         <a href="${pageContext.request.contextPath }/product_searchByPagePname.action?pname=${requestScope.hpname}&page=<s:property value="#p"/>"><s:property value="#p"/></a>
		    	     </s:if>
			         <s:else>
			         <span class="currentPage"><s:property value="#p"/></span>
			         </s:else>
			         </s:iterator>
			         <span class="ellipsis">…</span>
			         </s:if>
			     <!-- jia yi ge pan duan -->
			         <s:else>
			         <s:iterator var="p" begin="1" end="5">
		           	 <s:if test="pageBean.page !=#p">
			         <a href="${pageContext.request.contextPath }/product_searchByPagePname.action?pname=${requestScope.hpname}&page=<s:property value="#p"/>"><s:property value="#p"/></a>
		    	     </s:if>
			         <s:else>
			         <span class="currentPage"><s:property value="#p"/></span>
			         </s:else>
			         </s:iterator>
			         <span class="ellipsis">…</span>
			         </s:else>
			    </s:else>
			</s:if>
			<s:else>
			    <s:iterator var="p" begin="1" end="pageBean.totalPage">
		       	<s:if test="pageBean.page !=#p">
			    <a href="${pageContext.request.contextPath }/product_searchByPagePname.action?pname=${requestScope.hpname}&page=<s:property value="#p"/>"><s:property value="#p"/></a>
		    	</s:if>
			     <s:else>
			    <span class="currentPage"><s:property value="#p"/></span>
			    </s:else>
			    </s:iterator>
			</s:else>
			<!-- 中间分页码 中间分页码 中间分页码 -->
			
			
			<s:if test="pageBean.page !=pageBean.totalPage">
			    <a href="${pageContext.request.contextPath }/product_searchByPagePname.action?pname=${requestScope.hpname}&page=<s:property value="pageBean.page+1"/>" class="nextPage"></a>
			    <a href="${pageContext.request.contextPath }/product_searchByPagePname.action?pname=${requestScope.hpname}&page=<s:property value="pageBean.totalPage"/>" class="lastPage"></a>
			</s:if>
			<s:else>
			    <span class="nextPage"></span>
			    <span class="lastPage"></span>
			</s:else>    
	</div>
	
	        </s:if>
			<s:else>
			<br/><br/><br/>
			<center><h2>非常抱歉，暂无此类商品!</h2></center>
			</s:else>
	
			</form>
		</div>
	</div>
<div class="container footer">
<%@ include file="footer.jsp"%>
</div>
</body>
</html>