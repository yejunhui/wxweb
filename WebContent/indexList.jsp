<%@page import="com.google.gson.JsonArray"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dxxt.*" %>

<%
	String shop = null;
	String jString = null;
	JSONObject jsonObject = null;
	ResultSet resultSet = null;
	
	shop = request.getParameter("shop");

	MyDB myDB = new MyDB();
	myDB.myDBInit(8, "user", "000000", "wxweb");
	resultSet = myDB.myDBSql("select * from shop where shop=\'"+shop+"\';");
	
	while(resultSet.next()){
		jString = "{dis:\'"+resultSet.getString("discounts")+"\',\'sat\':\'"+resultSet.getString("satisfy")+"\',\'mit\':\'"+resultSet.getString("mitigate")+"\',data:[{\'image\':\'"+resultSet.getString("image1")+"\'},{\'image\':\'"+resultSet.getString("image2")+"\'},{\'image\':\'"+resultSet.getString("image3")+"\'}]}";
	}
	
	jsonObject = new JSONObject(jString);
	out.print(jsonObject);
%>