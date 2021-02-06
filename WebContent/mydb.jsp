<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	try{
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/aiplan?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
		String user = "user";
		String password = "000000";
		
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(url,user,password);
			statement = connection.createStatement();
			
			String sql = "select * from user;";
			
			resultSet = statement.executeQuery(sql);
			
			while(resultSet.next()){
				out.println(resultSet.getString("user"));
				out.println(resultSet.getString("name"));
				out.println(resultSet.getString("password"));
				out.println("---------------------------");
			}
			
		}catch(ClassCastException e){
			e.printStackTrace();
		}
		
	}catch(ClassNotFoundException e){
		e.printStackTrace();
	}
%>
</body>
</html>