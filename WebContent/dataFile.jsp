<%@page import="java.io.IOError"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dxxt.*" %>
<%@ page import="org.json.*" %>
<%@page import="java.sql.ResultSet"%>

<%
	String jString = "{data:[";//这是rightLists
	String jlString = ",lists:[";
	String userString = "user";
	String shopName = "0";
	
	userString = request.getParameter("user");
	shopName = request.getParameter("shopname");
	//shopName = "root";
	
	MyDB myDB = new MyDB();
	myDB.myDBInit(8, "user", "000000", "wxweb");
	//myDB.myDBInit(8, "x202lxy1mo", "30j5j1z25iiyyi2zxz3511xk215k1m4z3z13mlh0", "app_dxxtwxweb");
	ResultSet resultset = myDB.myDBSql("select * from productlist where shop=\'"+shopName+"\';");
	ResultSet resultSet2 = myDB.myDBSql("select * from classlist where shop=\'"+shopName+"\';");
	
	while(resultSet2.next()){
		jlString = jlString+"{\'imageurl\':"+"\'"+resultSet2.getString("imageurl")+"\',\'id\':\'"+resultSet2.getString("id")+"\',\'name\':\'"+resultSet2.getString("name")+"\'},";
	}
	
	while(resultset.next()){
		jString =   jString+ 
				    "{\'id\':"+
				    resultset.getString("id")+
				    ",\'class\':"+
				    "\'"+
				    resultset.getString("class")+
				    "\',"+
					"\'name\':"+
					"\'"+
					resultset.getString("name")+
					"\',"+
					"\'imageurl\':"+
					"\'"+
					resultset.getString("imageurl")+
					"\',"+
					"\'price\':"+
					resultset.getString("price")+
					",\'specialprice\':"+
					resultset.getString("specialprice")+
					",\'memberprice\':"+
					resultset.getString("memberprice")+
					",\'state\':"+
					"\'"+
					resultset.getString("state")+
					"\'"+
					",\'discounts\':"+
					resultset.getString("discounts")+
					",\'satisfy\':"+
					resultset.getString("satisfy")+
					",\'mitigate\':"+
					resultset.getString("mitigate")+
					",\'number\':"+
					resultset.getString("number")+
					",\'num\':0"+
					",\'dis\':0"+
					",\'mit\':0"+
					",},";
		
	}
	jString = jString+"]"+jlString+"]}";
	
	JSONObject jsonObject =new JSONObject(jString);
	String errjString = "{\'error_code\':\'password_error\',}";
		
	if(true){
		out.print(jsonObject);
		//out.print(jString);
	}
	else{
		out.print(new JSONObject(errjString));
	}


%>
