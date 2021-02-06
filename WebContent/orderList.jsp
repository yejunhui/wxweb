<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dxxt.*" %>
<%
	String openid = null;
	String orderNumber = null;
	ResultSet resultSet = null;
	JSONObject jsonObject = null;
	List<String> list = new ArrayList<String>();
	
	orderNumber = request.getParameter("ordernumber");
	openid = request.getParameter("openid");

	String sql = "select * from orderlist where openid=\'"+openid+"\'";
	String jString = "{\'data\':[";
	String jLiString = "\'list\':[";

	MyDB myDB = new MyDB();
	myDB.myDBInit(8, "user", "000000", "wxweb");
	
	resultSet = myDB.myDBSql(sql);

	//out.print(orderNumber == null);
	//用于表示是否录入ordernumber和orprice
	boolean st = true;
	
	while(resultSet.next()){
		//判断订单号为空？T返回列表，F返回明细
		if(orderNumber == null){
			//订单去重复值
			if(!list.contains(resultSet.getString("ordernumber"))){
				jString = 	jString+"{\'ordernumber\':\'"+resultSet.getString("ordernumber")+"\',\'orprice\':\'"+resultSet.getString("orprice")+"\',\'createdate\':\'"+resultSet.getString("createdate")+"\',\'state\':\'"+resultSet.getString("state")+"\'},";
				list.add(resultSet.getString("ordernumber"));
			}
		}else{
			if(orderNumber.equals(resultSet.getString("ordernumber"))){
				//返回明细只取一次订单号和总价
				if(st){
					jString = jString+"{\'ordernumber\':\'"+resultSet.getString("ordernumber")+"\',\'orprice\':"+resultSet.getString("orprice")+"},";
					st = false;
				}
				jLiString = jLiString+ "{\'name\':\'"+resultSet.getString("name")+"\',\'price\':"+resultSet.getString("price")+",\'num\':"+resultSet.getString("num")+",\'dis\':"+resultSet.getString("dis")+",\'mit\':"+resultSet.getString("mit")+"},";
			}
		}
	}
	
	jLiString = jLiString+"]";
	jString = jString+"],"+jLiString+"}";
	System.out.print(jString);
	jsonObject = new JSONObject(jString);
	out.print(jsonObject);
%>
