<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/mycss.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>js/themes/gray/easyui.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>js/themes/icon.css" />

<script type="text/javascript" src="<%=basePath%>js/jquery-1.4.2.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/jquery.easyui.min.js"></script>
	
<script type="text/javascript">
		$(function(){
			$('#pp').pagination({
				total:${count},
				pageNumber:${pageNumer==null?1:pageNumer},
				pageSize:${pageSize==null?10:pageSize},
				onSelectPage:function(pageNumber, pageSize){
					$(this).pagination('loading');
					window.location.href='<%=basePath%>user-listUsers?pageNumer='+pageNumber+'&pageSize='+pageSize;
					$(this).pagination('loaded');
				}
			});	
		});		
</script>
</head>
<body>
	<div class="location">
		<img src="<%=basePath%>/images/room.jpg" width="14" height="14"
			style="border: 0px; border-top: 10px;" />当前位置:用户信息管理->用户信息
	</div>
	<br />
	<div class="pagetitle">用户信息</div>
	<br />
	<hr class="hr" />
	<br />
	<br />
	<div class="location">
		<s:form theme="simple">
			<table class="RentInfo" width="930" border="0" align="center"
				style="BORDER-RIGHT: #099 2px ridge; BORDER-TOP: #099 2px ridge; BORDER-LEFT: #099 2px ridge; BORDER-BOTTOM: #099 2px ridge">
				<tr>
					<td align="center">用户名</td>
					<td align="center">邮箱</td>
					<td align="center">密码</td>
					<td align="center">电话</td>
					<td align="center">注册日期</td>
				</tr>

				<s:iterator value="#request.user">
					<tr>
						<td align="center">${username}</td>
						<td align="center">${email}</td>
						<td align="center">${password}</td>
						<td align="center">${phone}</td>
						<td align="center">
							<s:date name="datetime" format="yyyy-MM-dd HH:mm:ss" />
						</td>
					</tr>
				</s:iterator>
			</table>
		</s:form>
	</div>
	<table align="center">
		<tr>
			<td><div id="pp" class="bottom"></div></td>
		</tr>
	</table>


</body>
</html>