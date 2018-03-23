 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0048)http://localhost:8080/mango/product/list/1.jhtml -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>拍卖网</title>
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/product.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet" type="text/css"/>
<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script>

<script type="text/javascript"> 
	function select(){
		document.getElementById("selectFrom").submit();
	}
</script>
</head>
<body>
<div class="container header">
	<div class="span3">
		<div class="logo">
			<a href="http://localhost:8080/acution/fileinfo-inputFile">
				<strong><h1>Pai卖网</h1></strong>
			</a>
		</div>
	</div>
	<div class="span14">
<div class="headerAd">
	<img src="${ pageContext.request.contextPath }/image/header.jpg" width="420" height="70" />
</div>	
</div>
	
	<%@ include file="../menu.jsp" %>

</div>	
<br/>
<div class="container productList">
		 <div class="span18 last">
			<div class="ProductSelect">
				<div align="right">
				<form id="selectFrom" action="fileinfo-selectFile" enctype="multipart/form-data" method="post">
					<input name="select" type="text" style="width: 180px;line-height: 25px;" value="${select }"/><a></a><img src="${pageContext.request.contextPath}/image/select.png" style="display: inline-block;width: 25px;height: 25px;" onclick="select()"/>
				</form>
				</div>	
			</div>
		</div> 
		<div class="span24">
		
		<div class="span18 last">
			
			<form id="productForm" action="" method="get">
					
				<div id="result" class="result table clearfix">
						<ul>
							<s:iterator value="#request.fileinfos">
								<li>
										<a href="fileinfo-getFileById?id=${id }">
											<img src="${pageContext.request.contextPath}/upload/${photos}" style="display: inline-block;"/>
												<span>
													<span style='color:green'>
															 ${title }
													</span>
													<span>
														 类型:  ${type}
													</span>
													<span>
														 佣金: ${yongjin}%
													</span>
												</span>
												<strong><font class="price">
														参考价:￥${cankaojia} 万
														</font>
												</strong>
										</a>
								</li>
							</s:iterator>		
						</ul>
				</div>
	<div class="pagination">
			<span>第 ${page}/${total} 页</span>
			
				<s:if test="#request.page != 1 && #request.select == null">
					<a href="${ pageContext.request.contextPath }/fileinfo-inputFileList?pageNumer=1" class="firstPage">&nbsp;</a>
					<a href="${ pageContext.request.contextPath }/fileinfo-inputFileList?pageNumer=${page-1 == 0?page:1}" class="previousPage">&nbsp;</a>
				
					 <s:iterator var="i" begin="1" end="#request.total">
						<s:if test="#request.page != i">
							<a href="${ pageContext.request.contextPath }/fileinfo-inputFileList?pageNumer=${i}">${i }</a>
						</s:if>
						<s:else>
							<span class="currentPage">${i }</span>
						</s:else>
					</s:iterator>
					<s:if test="#request.page != #request.total">	
						<a class="nextPage" href="${ pageContext.request.contextPath }/fileinfo-inputFileList?pageNumer=${page+1 }">&nbsp;</a>
						<a class="lastPage" href="${ pageContext.request.contextPath }/fileinfo-inputFileList?pageNumer=${total }">&nbsp;</a>
					</s:if> 
				</s:if>
				<s:else>
					<a href="${ pageContext.request.contextPath }/fileinfo-inputFileList?select=${select }&pageNumer=1" class="firstPage">&nbsp;</a>
					<a href="${ pageContext.request.contextPath }/fileinfo-inputFileList?select=${select }&pageNumer=${page-1 == 0?page:1}" class="previousPage">&nbsp;</a>
				
					 <s:iterator var="i" begin="1" end="#request.total">
						<s:if test="#request.page != i">
							<a href="${ pageContext.request.contextPath }/fileinfo-inputFileList?select=${select }&pageNumer=${i}">${i }</a>
						</s:if>
						<s:else>
							<span class="currentPage">${i }</span>
						</s:else>
					</s:iterator>
					<s:if test="#request.page != #request.total">	
						<a class="nextPage" href="${ pageContext.request.contextPath }/fileinfo-inputFileList?select=${select }&pageNumer=${page+1 }/>">&nbsp;</a>
						<a class="lastPage" href="${ pageContext.request.contextPath }/fileinfo-inputFileList?select=${select }&pageNumer=${total }">&nbsp;</a>
					</s:if> 
				</s:else>
			
	</div>
	</form>
		</div>
		<div class="span6">
			<div class="lianxi">
				<img src="${ pageContext.request.contextPath }/image/saoma.jpg" width="200" height="200" alt="0元领好贷" title="0元领好贷"/>
			</div>
			<div class="lianxi">
				<img src="${ pageContext.request.contextPath }/image/right.jpg" width="200" height="200" alt="0元领好贷" title="0元领好贷"/>
			</div>
		</div>
		</div>
	</div>
	<div class="container footer">
	<div class="span24">
	    <h2><img src="${pageContext.request.contextPath}/image/link.jpg" width="1000" height="120"/></h2>
	    <ul>
	        <li><a href="http://www.a-court.gov.cn"><img src="${pageContext.request.contextPath}/image/link1.jpg" title="上海第一中级人民法院"  alt="上海第一中级人民法院" width="185" height="89" /></a>
	        <a href="http://www.shezfy.com"><img src="${pageContext.request.contextPath}/image/link2.jpg" title="上海第二中级人民法院"  alt="上海第二中级人民法院" width="185" height="89" /></a>
	        <a href="http://shszy.hshfy.sh.cn"><img src="${pageContext.request.contextPath}/image/link3.jpg" title="上海第三中级"  alt="上海第三中级" width="185" height="89" /></a>
	        <a href="http://www.pdfy.gov.cn"><img src="${pageContext.request.contextPath}/image/link4.jpg" title="浦东新区法院"  alt="浦东新区法院" width="185" height="89" /></a>
	        <a href="http://www.justice.gov.cn"><img src="${pageContext.request.contextPath}/image/link5.jpg" title="上海司法行政"  alt="上海司法行政" width="185" height="89" /></a></li>
	        <li><a href="http://www.sls.org.cn"><img src="${pageContext.request.contextPath}/image/link6.jpg" title="上海法学会"  alt="上海法学会" width="185" height="89" /></a>
	        <a href="http://www.gwamcc.com"><img src="${pageContext.request.contextPath}/image/link7.jpg" title="中国长城"  alt="中国长城" width="185" height="89" /></a>
	        <a href="http://www.cinda.com.cn"><img src="${pageContext.request.contextPath}/image/link8.jpg" title="中国信达"  alt="中国信达" width="185" height="89" /></a>
	        <a href="http://www.coamc.com.cn/"><img src="${pageContext.request.contextPath}/image/link9.jpg" title="东方资产"  alt="东方资产" width="185" height="89" /></a>
	        <a href="http://www.chamc.com.cn/"><img src="${pageContext.request.contextPath}/image/link10.jpg" title="中国华融"  alt="中国华融" width="185" height="89" /></a></li>
	     </ul>  
	</div>

	<div class="span24">
		<div class="copyright">
			<ul>
				<li>Copyright © 2017  拍卖网  版权所有</li>
				<li>地址：上海市 邮编：200010 电话：400-888-8888 88888888 传真：021-88888888 邮箱：paimai@pai.net </li>
			    <li><img src="${pageContext.request.contextPath}/image/ga.png" width="20" height="20" />沪公网安备 31010102002574号</li>
			</ul>
		</div>
	</div>
</div>
</body>
</html>