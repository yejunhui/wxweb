<%@page import="java.sql.ResultSet"%>
<%@page import="org.json.JSONObject"%>
<%@page import="com.google.gson.JsonObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dxxt.*" %>

<%
	String openid = null;
	String shop = null;
	String jString = "{\'data\':[";
	JSONObject jsonObject = null;
	ResultSet resultSet = null;
	
	openid=request.getParameter("openid");
	shop = request.getParameter("shop");
	
	MyDB myDB = new MyDB();
	myDB.myDBInit(8, "user", "000000", "wxweb");
	
	String sql = "select * from card where wxid=\'"+openid+"\' and shop=\'"+shop+"\';";
	System.out.print(sql);
	resultSet = myDB.myDBSql(sql);
	
	while(resultSet.next()){
		ResultSet resultSet2 = myDB.myDBSql("select name from productlist where shop=\'"+shop+"\' and id=\'"+resultSet.getString("product")+"\';");
		String product = null;
		while(resultSet2.next()){
			product = resultSet2.getString("name");
		}
		jString = jString+"{\'id\':"+resultSet.getString("id")+",\'name\':\'"+resultSet.getString("name")+"\',\'val\':"+resultSet.getString("val")+",\'stopdate\':\'"+resultSet.getString("stopdate")+"\',\'product\':\'"+product+"\'},";
	}
	
	jsonObject = new JSONObject(jString+"]}");
	out.print(jsonObject);
%>
