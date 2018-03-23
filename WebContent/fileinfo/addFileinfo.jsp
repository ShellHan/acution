<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" type="text/css" href="<%=basePath %>css/mycss.css"/>
<script src="<%=basePath %>js/My97DatePicker/WdatePicker.js"></script>
  <script type="text/javascript" src="<%=basePath %>js/jquery-1.4.4.min.js"></script>
  <script type="text/javascript" src="<%=basePath %>js/jquery.easyui.min.1.2.2.js"></script>
<title>添加管理员信息</title>
<script type="text/javascript">
	function check(){
		
		var filenumber = document.getElementById("filenumber").value;
		if(filenumber == null || filenumber == ''){
			$("#filenumber").nextAll("font").remove();
			$("#filenumber").after("<font color='red'>* 拍卖编号不能为空!</font>");
			return false;
		}else{
			$("#filenumber").nextAll("font").remove();
		}				
	}
	
	$(function(){
		$("#filenumber").change(function(){
			var val = document.getElementById("filenumber").value;
			if(val != ""){
				//把当前节点后面的所有 font 兄弟节点删除
				$("#filenumber").nextAll("font").remove();
				var url = "fileinfo-isOnlyNum";
				var args = {"filenumber":val, "time":new Date()};
				$.post(url, args, function(data){
					//表示可用
					if(data == "1"){
						$("#filenumber").after("<font color='green'>* 拍卖编号可用!</font>");
					}
					//不可用
					else if(data == "0"){
						$("#filenumber").after("<font color='red'>* 拍卖编号不可用!</font>");						
					}
					//服务器错误
					else{
						alert("服务器错误!");
					}
				});
			}else{
				$("#filenumber").nextAll("font").remove();
				$("#filenumber").after("<font color='red'>* 拍卖编号不能为空!</font>");	
				$(this).val("");
				$this.focus();
			}
		});
	})
	</script>	

</head>

<body>
<div class="location"><img src="<%=basePath %>/images/room.jpg" width="14" height="14"style="border:0px;border-top:10px;" />当前位置:管理员信息管理->添加管理员
</div>
<br/>
<div  class="pagetitle">添加拍卖信息</div>
<br/>
<hr class="hr" />
<br/>
<s:form action="fileinfo-save" enctype="multipart/form-data" onsubmit="return check();" method="post">
  <table width="400" height="120" border="1" align="center"style="BORDER-RIGHT:#099 2px ridge; BORDER-TOP:#099 2px ridge; BORDER-LEFT:#099 2px ridge; BORDER-BOTTOM:#099 2px ridge">
   <input type="hidden" name="magid" value="${id }"></input>
		<tr>
			<th>
				拍卖编号：
			</th>
			<td>
				<input type="text" id="filenumber" name="filenumber" class="text" maxlength="20" style="width:120px"/>
			</td>
		</tr>
		<tr>
			<th>
				标题：
			</th>
			<td>
				<input type="text" id="title" name="title" class="text" style="width:120px"/>
			</td>
		</tr>
		<tr>
			<th>
				佣金：
			</th>
			<td>
				<input type="text" id="yongjin" name="yongjin" class="text" style="width:20px"/><span>%</span>
			</td>
		</tr>
		<tr>
			<th>
				参考价：
			</th>
			<td>
				<input type="text" id="cankaojia" name="cankaojia" class="text" style="width:20px"/><span>万元</span>
			</td>
		</tr>
		<tr>
			<th>
				照片：
			</th>
			<td>
				<s:file name="file"></s:file>						
			</td>
		</tr>
		<tr>
			<th>
			       类型:
			</th>
			<td>
				<input type="text" id="type" name="type" class="text" style="width:40px"/>
			</td>
		</tr>	
		<tr>
			<th>
				简介：
			</th>
			<td>
				<textarea name="comment"></textarea>
			</td>
		</tr>
		<tr>
			<th>&nbsp;
			</th>
			<td>
				<input type="submit" class="submit" value="发布"/>
			</td>
		</tr>
  </table>
</s:form>
			
</body>
</html>