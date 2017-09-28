<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>File Upload OK</title>
</head>
<body>
	<h1>성공하셨습니다.</h1>
<%
	HashMap<String, HashMap<String, Integer>> data 
= (HashMap<String, HashMap<String, Integer>>) request.getAttribute("data");
if(data != null){
%>
	<p><%=data%></p>
	<p><%=data.get("status")%></p>
	
<% System.out.println(data.get("status"));
// 	if(data.get("status") == 1){
%>
	<a href="fileList">리스트 보기</a>
<%  
// 	}else {
%>
<!-- 	<p>오류가 발생 하였습니다.</p> -->
<%  
// 	}
}%>	
</body>
</html>