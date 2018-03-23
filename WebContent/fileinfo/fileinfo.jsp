<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
<title>买房网</title>
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/product.css" rel="stylesheet" type="text/css"/>
<script>
	function saveCart(){
		document.getElementById("carForm").submit();
	}

	function saveDis(){
		var comment = document.getElementById("comment").value;
		if(comment == null || comment == ''){
			alert("评论不能为空！");
			return false;
		}
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
<div class="container productContent">
		<div class="span18 last">
			<form id="carForm" action="car-save"  method="post" novalidate="novalidate">
				<div class="productImage">
					<img style="opacity: 1;" title="" class="medium" src="${ pageContext.request.contextPath }/upload/${fileinfo.photos}""/>
				</div>
				<div class="sn">
					<div>拍卖编号：${fileinfo.filenumber }</div>
				</div>
				<div class="info">
					<dl>
						<dt>佣金:</dt>
						<dt>${fileinfo.yongjin}%</dt>
					</dl>
					<br/>
					<dl>
						<dt>类型:</dt>
						<dt>${fileinfo.type}</dt>
					</dl>
					<br/>
					
					<dl>
						<dt>拍卖时间</dt>
						<dt><s:date name="#request.fileinfo.filedate" format="yyyy-MM-dd" /></dt>
					</dl>
					<br/>
					<dl>
						<dt>参考价格:</dt>
						<dt>
							<span>￥：${fileinfo.cankaojia}万元</span>
						</dt>
					</dl>
					<br/>
					<s:if test="#request.username == null">
						<div class="buy">
							<input id="addCart" class="addCart" value="加入购物车" type="button" onclick="show()"/>
						</div>	
					</s:if>
					<s:else>
						<div class="buy">
							<input id="addCart" class="addCart" value="加入购物车" type="button" onclick="saveCart()"/>
						</div>
					</s:else>
					
				 </div>
				</form> 
				<div id="bar" class="bar">
					<ul>
							<li id="introductionTab">
								<a>介绍</a>
							</li>
					</ul>
				
				</div>
		
				<div id="introduction" name="introduction" class="introduction">
					<div class="comment">
						<strong>${fileinfo.comment}</strong>
					</div>
					<div>
						<img src="${pageContext.request.contextPath }/upload/${fileinfo.photos}" width="400" height="300"/>
					</div>
				</div>
				<div id="bar" class="bar">
					<ul>
						<li id="introductionTab">
							<a>评论</a>
						</li>
					</ul>
				</div>
				<div id="introduction" name="introduction" class="pinglunqu">
					<div class="pinglun">
						<s:if test="#request.discuss.size() == 0">
							<span>还没有评论哦！</span>
						</s:if>
						<s:else>
							<s:iterator value="#request.discuss">
								<li>
									<s:date name="#request.datetime" format="yyyy/MM/dd hh:mm:ss" /><br />
									&nbsp;&nbsp;&nbsp;<t>${username }&nbsp;-发表评论-&nbsp;</t>&nbsp;&nbsp;  ${comment}
								</li>
							</s:iterator>
						</s:else>
					</div>
					<div id="introduction" name="introduction" class="pinglunbtu">
						<form id="discuss" action="dis-save"  method="post" novalidate="novalidate" onsubmit="return saveDis();">
							<s:if test="#session.username == null">
								<input name="pinglun" type="text" style="width: 350px;line-height: 30px;"/><input id="pinglun" type="button" style="height: 35px;" value="发表评论" onclick="show()"/>
							</s:if>
							<s:else>
								<input type="hidden" name="username" value="${username }"></input>
								<input type="hidden" name="fileid" value="${fileinfo.id }"></input>
								<input id="comment" name="comment" type="text" style="width: 350px;line-height: 30px;"/><input id="ping" type="submit" style="height: 35px;" value="发表评论" />
							</s:else>
						</form>
					</div>
				</div>
		</div>
		
		<div class="span6">
			<div class="lianxi">
				<img src="${ pageContext.request.contextPath }/image/saoma.jpg" width="200" height="200" alt="扫码赢好礼" title="扫码赢好礼"/>
			</div>
			<div class="lianxi">
				<img src="${ pageContext.request.contextPath }/image/right.jpg" width="200" height="200" alt="0元领好贷" title="0元领好贷"/>
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