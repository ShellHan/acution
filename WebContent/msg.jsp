<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=basePath%>css/common.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>css/login.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="container header">
	<div class="span3">
		<div class="logo">
			<a href="http://localhost:8080/house/fileinfo-inputFile">
				<strong><h1>买房网</h1></strong>
			</a>
		</div>
	</div>
	<div class="span15">
<div class="headerAd">
	<img src="<%=basePath%>image/header.jpg" width="590" height="70" alt="0元领好贷" title="0元领好贷"/>
</div>	
</div>	
	<%@ include file="../menu.jsp" %>
</div>
<div class="container login">
		<div class="span10">
<div class="ad">
					<img src="${pageContext.request.contextPath}/image/login.jpg" width="300" height="300"/>
</div>		</div>

<div class="span9">
<table width="350px" border="0" cellspacing="0" align="right">
  <tr>
    <td style="padding:30px; text-align:center"><table width="60%" border="0" cellspacing="0" style="margin-top:70px">
      <tr>
        <td style="width:98"><img src="<%=basePath%>/images/IconTexto_WebDev_009.jpg" width="100" height="100" /></td>
        <td style="padding-top:30px"><font style="font-weight:bold; color:#FF0000">
	        ${msg }
        </font>
         </td>
      </tr>
    </table>
    <h1>&nbsp;</h1></td>
    </tr>
</table>
</div>
</div>
<div class="container footer">
	<div class="span24">
		<div class="footerAd">
					<img src="${pageContext.request.contextPath}/image/12.png" width="950" height="110" alt="我们的优势" title="我们的优势"/>
</div>	</div>
	<div class="span24">
		<div class="copyright">Copyright © 2016  买房网  版权所有</div>
	</div>
</div>
</body>
</html>