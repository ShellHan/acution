<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/mycss.css" />
<script src="<%=basePath%>js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/jquery-1.4.4.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/jquery.easyui.min.1.2.2.js"></script>
<title>添加公告信息</title>
</head>

<body>
	<div class="location">
		<img src="<%=basePath%>/images/room.jpg" width="14" height="14"
			style="border: 0px; border-top: 10px;" />当前位置:公告信息管理->修改公告信息
	</div>
	<br />
	<div class="pagetitle">修改公告信息</div>
	<br />
	<hr class="hr" />
	<br />
	<form action="ann-save" method="post" onSubmit="return check();"
		name="form">
		<input type="hidden" name="id" value="${announce.id }"/>
		<table width="450" height="300" border="1" align="center"
			style="BORDER-RIGHT: #099 2px ridge; BORDER-TOP: #099 2px ridge; BORDER-LEFT: #099 2px ridge; BORDER-BOTTOM: #099 2px ridge">
			<tr>
				<td align="center">标题</td>
				<td><label> &nbsp; <input id="title" name="title" type="text"  style="width:250px;" value="${announce.title }"/>
				</label></td>
			</tr>
			<tr>
				<td align="center">内容</td>
				<td><label> &nbsp; <textarea id="comment" name="comment" cols="40" rows="10">${announce.comment}</textarea>
				</label></td>
			</tr>
			<tr>
				<td><label></label></td>
				<td><label> &nbsp; <input type="submit" value="修改" />
				</label> <label> &nbsp; <input type="reset" value="重置" />
				</label></td>
			</tr>
		</table>
	</form>
	<script type="text/javascript">
		function check() {
	
			if (document.form.title.value == "") {
				$("#title").nextAll("font").remove();
				$("#title").after("<font color='red' > * 不能为空</font>");
				return false;
			}else{
				$("#title").nextAll("font").remove();
			}
			
			if (document.form.comment.value == "") {
				$("#comment").nextAll("font").remove();
				$("#comment").after("<font color='red' > * 不能为空</font>");
				return false;
			}else{
				$("#comment").nextAll("font").remove();
			}

		}
	</script>
</body>
</html>
