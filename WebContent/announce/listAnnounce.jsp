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
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/mycss.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>js/themes/gray/easyui.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>js/themes/icon.css" />
  <script type="text/javascript" src="<%=basePath %>js/jquery-1.4.4.min.js"></script>
  <script type="text/javascript" src="<%=basePath %>js/jquery.easyui.min.1.2.2.js"></script>
<title>公告信息</title>
<script type="text/javascript">
	$(function(){
		
		$('#pp').pagination({
			total:${count},
			pageNumber:${pageNumer==null?1:pageNumer},
			pageSize:${pageSize==null?10:pageSize},
			onSelectPage:function(pageNumber, pageSize){
				$(this).pagination('loading');
				window.location.href='<%=basePath%>areas-listAreas?pageNumer='+pageNumber+'&pageSize='+pageSize;
				$(this).pagination('loaded');
				
			}
		});	
	});

	$(function() {
		//1. 点击 delete 时, 弹出 确定是要删除 xx 的信息吗 ? 若确定, 执行删除, 若不确定, 则取消
		$(".delete").click(function() {
			var title = $(this).next(":hidden").val();
			var flag = confirm("确定要删除  " + title + " 的信息吗?");
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
			style="border: 0px; border-top: 10px;" />当前位置:公告信息管理->公告信息
	</div>
	<br />
	<div class="pagetitle">公告信息</div>
	<br />
	<hr class="hr" />
	<br />
	<br />
	<div>
		<s:form>
			<table class="RentInfo" width="580" border="0" align="center"
				style="BORDER-RIGHT: #099 2px ridge; BORDER-TOP: #099 2px ridge; BORDER-LEFT: #099 2px ridge; BORDER-BOTTOM: #099 2px ridge">
				<tr>
					<td align="center">标题</td>
					<td align="center">发布时间</td>
					<td align="center">编辑</td>
					<td align="center">删除</td>
				</tr>

				<s:iterator value="#request.announces">
					<tr>
						<td align="center">${title}</td>
						<td align="center">${annDate}</td>
						<td align="center"><a
							href="ann-getById?id=${id}"><img
								src="<%=basePath%>/images/edit22.gif" width="15" height="16"
								style="border: 0px;" /></a>&nbsp;</td>
						<td align="center"><a href="ann-delete?id=${id}"
							class="delete"> <img src="<%=basePath%>/images/delete22.gif"
								width="15" height="16" style="border: 0px;" />
						</a> <input type="hidden" value="${title}" /></td>
					</tr>
				</s:iterator>
			</table>
		</s:form>
		<table align="center">
	 	<tr><td><div id="pp" class="bottom1"></div></td></tr>
   	 </table>
	</div>
</body>
</html>