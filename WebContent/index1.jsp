<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>买房网</title>
<link href="css/default.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="js/themes/gray/easyui.css" />
<link rel="stylesheet" type="text/css" href="js/themes/icon.css" />
<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="js/jquery.easyui.min.1.2.2.js"></script>
<script type="text/javascript" src='js/outlook.js'> </script>
</head>
<body class="easyui-layout" style="overflow-y: hidden"  scroll="no">
<div region="north" split="true" border="false" style="overflow: hidden; height: 30px;
        background: url(images/layout-browser-hd-bg.gif) #7f99be repeat-x center 50%;
        line-height: 20px;color: #fff; font-family: Verdana, 微软雅黑,黑体"> <span style="float:right; padding-right:20px;" class="head">欢迎 :<span style="color:red;">${magname}</span><a href="#" id="editpass">修改密码</a> <a href="#" id="loginOut">安全退出</a></span> <span style="padding-left:10px; font-size: 16px; "><img src="images/blocks.gif" width="20" height="20" align="absmiddle" />拍卖网</span> </div>
<div region="west" hide="true" split="true" title="导航菜单" style="width:180px;" id="west">
  <input type="hidden" value="${magname}" name="magname" />           
  <div id="nav" class="easyui-accordion" fit="true" border="false">   
  </div>
</div>
<div id="mainPanle" region="center" style="background: #eee; overflow-y:hidden">
  <div id="tabs" class="easyui-tabs"  fit="true" border="false" >
    <div title="欢迎使用" style="padding:20px;overflow:hidden; color:#c0c0c0; margin-top:100px;" align="center" >
      <h1 style="font-size:30px;">欢迎使用买房网</h1>
    </div>
  </div>
</div>
<script type="text/javascript">
	   function affirpwd ()
	   {
	       if(document.form1.newpassword.value != document.form1.affirpwd.value )
	       {
	          doucment.form1.newpassword.focus();
	          alert("两次密码输入不一致！");
	       }
	   }
	
	</script>
<!--修改密码窗口-->
<div id="w" class="easyui-window" title="修改密码" collapsible="false" minimizable="false"
        maximizable="false" icon="icon-save"  style="width: 300px; height: 150px; padding: 5px;
        background: #fafafa;">
  <div class="easyui-layout" fit="true">
    <div region="center" border="false" style="padding: 10px; background: #fff; border: 1px solid #ccc;">
      <form method="post" action="<%=basePath %>mag-updatePwd" name="form1" onsubmit="return affirpwd()">
     <input type="hidden" name="id" value="${id}"/>
      <table cellpadding=5>
         <tr>
          <td>姓名：</td>
          <td><input id="workerName" type="text" class="txt01" name="magname" value="${magname}"/></td>
        </tr>
        <tr>
          <td>新密码：</td>
          <td><input id="txtNewPass" type="password" class="txt01" name="newpassword"/></td>
        </tr>
        <tr>
          <td>确认密码：</td>
          <td><input id="txtRePass" type="password" class="txt01"  name="affirpwd"/></td>
        </tr>
      </table>
      </form>
    <div region="south" border="false" style="text-align: right; height: 30px; line-height: 30px;"> <a id="btnEp" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)" > 确定</a> <a id="btnCancel" class="easyui-linkbutton" icon="icon-cancel" href="javascript:void(0)">取消</a> </div>
  </div>
</div>
</div>
<div id="mm" class="easyui-menu" style="width:150px;">
  <div id="mm-tabupdate">刷新</div>
  <div class="menu-sep"></div>
  <div id="mm-tabclose">关闭</div>
  <div id="mm-tabcloseall">全部关闭</div>
  <div id="mm-tabcloseother">除此之外全部关闭</div>
  <div class="menu-sep"></div>
  <div id="mm-tabcloseright">当前页右侧全部关闭</div>
  <div id="mm-tabcloseleft">当前页左侧全部关闭</div>
  <div class="menu-sep"></div>
  <div id="mm-exit">退出</div>
</div>
</body>
</html>
