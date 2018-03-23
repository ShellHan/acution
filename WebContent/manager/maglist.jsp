<%@ page language="java" pageEncoding="utf-8"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/mycss.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>js/themes/gray/easyui.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>js/themes/icon.css" />
<script type="text/javascript"
	src="<%=basePath%>js/jquery-1.4.4.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/jquery.easyui.min.1.2.2.js"></script>
<title>管理员信息</title>
<script type="text/javascript">
	$(function() {
		//1. 点击 delete 时, 弹出 确定是要删除 xx 的信息吗 ? 若确定, 执行删除, 若不确定, 则取消
		$(".delete").click(function() {
			var magname = $(this).next(":hidden").val();
			var flag = confirm("确定要删除  " + magname + " 的信息吗?");
			if (flag) {
				var $tr = $(this).parent().parent();
				//删除, 使用 ajax 的方式
				var url = this.href;
				var args = {
					"time" : new Date()
				};
				$.post(url, args, function(data) {
					//若 data 的返回值为 1, 则提示 删除成功, 且把当前行删除
					if (data == "1") {
						alert("删除成功!");
						$tr.remove();
					} else {
						//若 data 的返回值不是 1, 提示删除失败. 
						alert("删除失败!");
					}
				});
			}
			//取消超链接的默认行为
			return false;
		});
	})
</script>
</head>
<body>
	<div class="location">
		<img src="<%=basePath%>/images/room.jpg" width="14" height="14"
			style="border: 0px; border-top: 10px;" />当前位置:管理员信息管理->管理员信息
	</div>
	<br />
	<div class="pagetitle">管理员信息</div>
	<br />
	<hr class="hr" />
	<br />
	<br />
	<div>
		<form>
			<table class="RentInfo" width="500" border="1" align="center"
				style="BORDER-RIGHT: #099 2px ridge; BORDER-TOP: #099 2px ridge; BORDER-LEFT: #099 2px ridge; BORDER-BOTTOM: #099 2px ridge">

				<tr>

					<td align="center">用户名</td>
					<td align="center">密码</td>
					<td align="center">编辑</td>
					<td align="center">删除</td>
				</tr>

				<s:iterator value="#request.managers">
					<tr>
						<td align="center">${magname}</td>
						<td align="center">${password}</td>
						<td align="center"><a href="mag-input?id=${magid}"><img
								src="<%=basePath%>/images/edit22.gif" width="15" height="16"
								style="border: 0px;" /></a>&nbsp;</td>
						<td align="center"><a href="mag-delete?id=${magid}"
							class="delete"> <img src="<%=basePath%>/images/delete22.gif"
								width="15" height="16" style="border: 0px;" />
						</a> <input type="hidden" value="${magname }" /></td>
					</tr>
				</s:iterator>
			</table>
		</form>
	</div>
</body>
</html>