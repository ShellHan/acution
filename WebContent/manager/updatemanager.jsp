<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
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
<title>�޸Ĺ���Ա��Ϣ</title>
<script type="text/javascript">
		function check(){
		
		if (document.forms[0].magname.value=="") {  
				$("#magname").nextAll("font").remove();
				$("#magname").after("<font color='red' > * �û�������Ϊ��</font>");
			}else{
				$("#magname").nextAll("font").remove();
			}
		
			if (document.forms[0].password.value=="") { 
				$("#password").nextAll("font").remove();
				$("#password").after("<font color='red' > * ���벻��Ϊ��</font>"); 
				return false; 
			}else{
				$("#magname").nextAll("font").remove();
			}
	
	}
	</script>	

</head>

<body>
<div class="location"><img src="<%=basePath %>/images/room.jpg" width="14" height="14"style="border:0px;border-top:10px;" />��ǰλ��:����Ա��Ϣ����->����Ա��Ϣ
</div>
<br/>
<div  class="pagetitle">�޸Ĺ���Ա��Ϣ</div>
<br/>
<hr class="hr" />
<br/>
<form action="mag-save" enctype="multipart/form-data" onsubmit="return check();" method="post">
	<input type="hidden" name="id" value="${manager.magid }"/>
  <table width="360" height="120" border="1" align="center"style="BORDER-RIGHT:#099 2px ridge; BORDER-TOP:#099 2px ridge; BORDER-LEFT:#099 2px ridge; BORDER-BOTTOM:#099 2px ridge">
    <tr>
     <td align="center">�û���</td>
    <td><label> &nbsp;
            <input id="magname" name="magname" type="text" value="${manager.magname }"/>
        </label>      </td>
    </tr>
        <tr>
      <td ><div align="center">����</div></td>
      <td><label> &nbsp;
            <input id="password" name="password" type="text" value="${manager.password }"/>
        </label>      </td>
    </tr>
    <tr>
      <td><label></label></td>
      <td><label>
        &nbsp;
        <input type="submit" name="Submit2" value="���" />
       </label>
        <label>
        <input type="reset" name="Submit3" value="����" />
      </label></td>
    </tr>
  </table>
</form>
			
</body>
</html>