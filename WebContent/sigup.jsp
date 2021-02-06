<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javax.xml.crypto.Data"%>
<%@page import="java.io.IOError"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dxxt.*" %>
<%@ page import="org.json.*" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.time.*" %>

<%
	//初始数据
	String passwdString = null;//openid
	String nameString = null;//name
	String userString = null;//
	String code = null;//code
	String phoneString = null;//phone
	String emailString = null;
	boolean b = false;//判断是否已经注册
	String openid = null;//从微服务器返回的openid
	
	nameString = request.getParameter("name");
	code = request.getParameter("code");
	System.out.print("code is:"+code);
	System.out.print("name is :"+nameString);
	
	MyDB myDB = new MyDB();
	String[] s = {"wx7bfa5d81bc7ab3c6", "09f116d30db307ae34022e1ccdc949b8", code};
	Sigup sigup = new Sigup("crawl", true,s);

	myDB.myDBInit(8, "user", "000000", "wxweb");
	LocalDateTime currDateTime = LocalDateTime.now();
	sigup.start(1);
	JSONObject resObject= sigup.reu();
	
	ResultSet resultset = null;
	
	
	if(resObject.has("openid")){
		resultset = myDB.myDBSql("select wxid from user where wxid=\'"+resObject.get("openid")+"\';");
		int i = 0;
		while(resultset.next()){
			b = (resultset != null);
			openid = resultset.getString("wxid");
			i++;
		}
		if(b){
			out.print(new JSONObject("{\'code\':\'用户存在\',\'openid\':\'"+openid+"\'}"));
		}else{
			String sql = "insert into user (user,wxid,createdate,password,phone,email,class,id)values (\'"+nameString+"\',\'"+resObject.get("openid")+"\',\'"+currDateTime+"\',\'"+resObject.get("openid")+"\',\'"+phoneString+"\',\'"+""+"\',\'"+"user"+"\',\'"+i+"\');";
			myDB.myDBSql(sql);
			out.print(new JSONObject("{\'code\':\'创建用户\',\'openid\':\'"+openid+"\'}"));
		}
		
	}else{
		out.print(new JSONObject("{\'code\':\'error_code错误\',\'openid\':\'"+"err"+"\'}"));
	}
%>
