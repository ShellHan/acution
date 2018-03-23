<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function show() {
		alert("您还没有登录！请登录！");
	}
</script>
</head>
<body>
<div class="span7 last">
	<div class="topNav clearfix">
		<ul>
			<s:if test="#session.username == null">
			<li id="headerLogin" class="headerLogin" style="display: list-item;">
				<a href="${ pageContext.request.contextPath }/login.jsp">登录</a>
			|</li>
			<li id="headerRegister" class="headerRegister"
				style="display: list-item;"><a href="${ pageContext.request.contextPath }/regist.jsp">注册</a>
			|</li>
			<li id="headerLogin" class="headerLogin" style="display: list-item;">
				<a onclick="show();">个人信息</a>
			|</li>
			<li id="headerLogin" class="headerLogin" style="display: list-item;">
				<a href="http://www.aacaward.com/">艺术中国</a>
			</li>
			</s:if>
			<s:else>
			<li id="headerLogin" class="headerLogin" style="display: list-item;">
				${username}
			|</li>
			<li id="headerLogin" class="headerLogin" style="display: list-item;">
				<a href="user-getByName?username=${username }">个人信息</a>
			|</li>
			<li id="headerLogin" class="headerLogin" style="display: list-item;">
				<a href="fileinfo-findByAppname?name=${username }">购物车</a>
			|</li>
			<li id="headerLogin" class="headerLogin" style="display: list-item;">
				<a href="fileinfo-findByAppname?name=${username }">我的订单</a>
			|</li>
			<li id="headerRegister" class="headerRegister"
				style="display: list-item;"><a href="user-logout">退出</a>
			</li>
			</s:else>
		</ul>
	</div>
	<div class="phone">
		客服热线: <strong>15988888888</strong>
	</div>
</div>
<div class="span24">
	<ul class="mainNav">
		<li><a href="${ pageContext.request.contextPath }/fileinfo-inputFile">首页</a>|</li>
		<li><a href="${ pageContext.request.contextPath }/fileinfo-inputFileList">拍卖</a>|</li>
		<li><a href="${ pageContext.request.contextPath }/ann-listAnnsTwo">新闻中心</a></li>
	</ul>
</div>
</body>
</html>