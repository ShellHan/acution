<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0080)http://localhost:8080/mango/login.jhtml?redirectUrl=%2Fmango%2Fcart%2Flist.jhtml -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>会员登录</title>

<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/login.css" rel="stylesheet" type="text/css"/>


</head>
<body>

<div class="container header">
	<div class="span3">
		<div class="logo">
			<a href="http://localhost:8080/house/fileinfo-inputFile">
				<strong><h1>拍卖网</h1></strong>
			</a>
		</div>
	</div>
	<div class="span15">
<div class="headerAd">
	<img src="${pageContext.request.contextPath}/image/header.jpg" width="590" height="70" alt="0元领好贷" title="0元领好贷"/>
</div>	
</div>
	
	<%@ include file="menu.jsp" %>

</div>	
		<br/>
<div class="container login">
		<div class="span11">
		<br/>
<div class="ad">
		<img src="${pageContext.request.contextPath}/image/login.jpg" width="330" height="270" alt="用户登录" title="用户登录"/>
</div>		</div>
		
		<div class="span12 last">
			<div class="wrap">
				<div class="main">
					<div class="title">
						<strong>登录</strong>LOGIN 
						
					</div>
					<div>${login }</div>
					<form action="user-isLogin"  method="post" novalidate="novalidate">
						<table>
							<tbody><tr>
								<th>
										用户名:
								</th>
								<td>
									<input type="text" id="username" name="username" class="text" maxlength="20"/>
									
								</td>
							</tr>
							<tr>
								<th>
									密&nbsp;&nbsp;码:
								</th>
								<td>
									<input type="password" id="password" name="password" class="text" maxlength="20" autocomplete="off"/>
								</td>
							</tr>
							<tr>
							<th>
								&nbsp;
								</th>
								<td>
									<input type="radio" name="radio" id="d1" value="用户" checked="checked" />用户
	            					<input type="radio" name="radio" id="d2" value="管理员" />管理员
								</td>
							</tr>			
							<tr>
								<th>&nbsp;
								</th>
								<td>
									<input type="submit" class="submit" value="登 录"/>
								</td>
							</tr>
							<tr class="register">
								<th>&nbsp;	
								</th>
								<td>
									<dl>
										<dt>还没有注册账号？</dt>
										<dd>
											立即注册即可发布房产！
											<a href="${ pageContext.request.contextPath }/regist.jsp">立即注册</a>
										</dd>
									</dl>
								</td>
							</tr>
						</tbody></table>
					</form>
				</div>
			</div>
		</div>
	</div>
<div class="container footer">
	<div class="span24">
	  <div class="footerAd">					
	  	<img src="${pageContext.request.contextPath}/image/12.png" width="950" height="110" alt="我们的优势" title="我们的优势"/>
	  </div>	
	</div>
	<div class="span24">
		<div class="copyright">Copyright © 2017  拍卖网 版权所有</div>
	</div>
</div>
</body></html>