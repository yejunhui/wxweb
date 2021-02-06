<%@page import="org.json.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dxxt.*"%>
<%@ page import="java.util.*" %>

<%
	String openid = null;
	String shop = null;
	String sql = null;
	String jsonList = null;
	String ordernumber = null;
	JSONArray jsonArray = null;
	double play = 0;
	Calendar now = Calendar.getInstance();
	int n = 0;
	
	openid = request.getParameter("openid");
	jsonList = request.getParameter("jsonList");
	play = Double.parseDouble(request.getParameter("play"));
	shop = request.getParameter("shop");
	
	jsonArray = new JSONArray(jsonList);
	//System.out.print(jsonArray);
	
	MyDB myDB = new MyDB();
	myDB.myDBInit(8, "user", "000000", "wxweb");
	
	ResultSet resultset = myDB.myDBSql("select * from orderlist;");
	while(resultset.next()){
		n++;
	}
	
	String createdate = ""+now.get(Calendar.YEAR)+"-"+now.get(Calendar.MONTH)+"-"+now.get(Calendar.DATE)+" "+now.get(Calendar.HOUR_OF_DAY)+":"+now.get(Calendar.MINUTE)+":"+now.get(Calendar.SECOND);
	for(int i =0; i <jsonArray.length(); i++){
			ordernumber = ""+now.get(Calendar.YEAR)+""+now.get(Calendar.MONTH)+""+now.get(Calendar.DATE)+""+now.get(Calendar.HOUR_OF_DAY)+""+now.get(Calendar.MINUTE)+now.get(Calendar.SECOND)+n;
			JSONObject j =  jsonArray.getJSONObject(i);
			String name = j.getString("name");
			String num = j.getString("num");
			String price = j.getString("price");
			String dis = j.getString("dis");
			String mit = j.getString("mit");
			//play = play+Double.parseDouble(j.getString("orPrice"));
			sql = "insert into orderlist (ordernumber,name,num,price,orprice,createdate,openid,state,dis,mit,shop) values (\'"+ordernumber+"\',\'"+name+"\',"+num+","+price+","+play+",\'"+createdate+"\',\'"+openid+"\',\'"+"等待支付"+"\',\'"+dis+"\',\'"+mit+"\'"+",\'"+shop+"\');";
			System.out.print(sql);
			myDB.myDBSql(sql);
	}
	out.print(new JSONObject("{\'ordernumber\':\'"+ordernumber+"\'}"));
%>