<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dxxt.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WX WEB-Login</title>
</head>
<body>
<%
	String hint = request.getParameter("hint");

	if(hint != null){
		out.print(hint);
	}
%>
	<form action="index.jsp" method="post" style="text-align: center; display: block;">
		<p>登录</p>
		<input type="text" name="user" placeholder="User"><br><br>
		<input type="password" name="passwd" placeholder="Password"><br><br>
		<input type="submit" value="登录">
	</form>

</body>
</html>