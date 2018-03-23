<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <link rel="stylesheet" type="text/css" href="<%=basePath %>css/mycss.css">
  <link rel="stylesheet" type="text/css" href="<%=basePath %>js/themes/gray/easyui.css"/>
  <link rel="stylesheet" type="text/css" href="<%=basePath %>js/themes/icon.css" />
<title>审核房产信息</title>

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
					window.location.href='<%=basePath%>fileinfo-getAllFile?pageNumer='+pageNumber+'&pageSize='+pageSize;
					$(this).pagination('loaded');
					
				}
			});
			
		});
</script>

</head>
<body>
	<div class="location"><img src="<%=basePath %>/images/room.jpg" width="14" height="14"style="border:0px;border-top:10px;" />当前位置:审核信息管理->审核房产信息</div>
	<br/>
	<div  class="pagetitle">审核房产信息</div>
	<br/>
   <hr class="hr"/><br/>
 	<br/>
	<div>
		<s:form>
		  <table class="RentInfo"  width="960" border="1" align="center"style="BORDER-RIGHT:#099 2px ridge; BORDER-TOP:#099 2px ridge; BORDER-LEFT:#099 2px ridge; BORDER-BOTTOM:#099 2px ridge">
			<tr>
			  <td align="center">拍卖编号</td>
			  <td align="center">标题</td>
			  <td align="center">拍卖日期</td>
			  <td align="center">佣金</td>
			  <td align="center">参考价</td>
			  <td align="center">状态</td>

			</tr>
			<s:iterator value="#request.fileinfos">		
			<tr>
			  <td align="center">${filenumber}</td>
			  <td align="center">${title}</td>
			  <td align="center">${filedate}</td>
			  <td align="center">${yongjin}%</td>
			  <td align="center">${cankaojia}万</td>
			  <td align="center">${state}</td>
				</tr>		
			</s:iterator>
		  </table>
		</s:form>
				
	 <table align="center">
	 	<tr><td><div id="pp" class="bottom"></div></td></tr>
   	 </table>
	</div>
</body>
</html>