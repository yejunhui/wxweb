<%@page import="org.json.JSONObject"%>
<%@page import="com.google.gson.JsonObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dxxt.*" %>

<%
	String text = "01234abcdefghijklmnopqrstuvwxyz.";
	text = request.getParameter("openid");
	String jString = "{";
	
	Member member = new Member();
	member.qcCode(text);
	jString = jString+"\'imageUrl\':"+"\'https://uranus.nat123.fun/image/"+text+".jpg\',\'text\':\'"+text+"\'}";
	JSONObject jsonObject = new JSONObject(jString);
	out.print(jsonObject);
%>