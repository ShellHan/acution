<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>会员注册</title>
<link href="<%=basePath%>css/common.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>css/apply.css" rel="stylesheet" type="text/css"/>
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
</div>	<div class="container apply">
		<div class="span18 last">
			<div class="wrap">
				<div class="main clearfix">
				<div class="title">
						<strong>个人信息</strong>User Infomation
					</div>
					<form>
						<table>
							<tbody><tr>
								<th>
									用户名:
								</th>
								<td>
									${user.username}
								</td>
							</tr>
							<tr>
								<th>
								密&nbsp;&nbsp;&nbsp;码:
								</th>
								<td>
									${user.password}				
								</td>
							</tr>
							<tr>
								<th>
								E-mail :
								</th>
								<td>
									${user.email}
								</td>
							</tr>				
							<tr>
								<th>
									手机号:
								</th>
								<td>
									${user.phone}
								</td>
							</tr>
							<tr>
								<th>
									注册时间:
								</th>
								<td>
									<s:date name="#request.user.datetime" format="yyyy-MM-dd HH:mm:ss" />
								</td>
							</tr>
									 
						</tbody></table>
						<div class="cang">
						<dl>
								<dd>
									<a href="${pageContext.request.contextPath}/user-getInfoByName?username=${user.username}">修改个人信息</a>
								</dd>
						</dl>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="span6">
			<div class="lianxi">
				<img src="${ pageContext.request.contextPath }/image/saoma.jpg" width="210" height="200" alt="扫码赢好礼" title="扫码赢好礼"/>
			</div>
			<div class="lianxi">
				<img src="${ pageContext.request.contextPath }/image/right.jpg" width="210" height="200" alt="0元领好贷" title="0元领好贷"/>
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
