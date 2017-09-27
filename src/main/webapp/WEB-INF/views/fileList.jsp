<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>File List</title>
</head>
<body>
	<%
		HashMap<String, Object> map = (HashMap<String, Object>) request.getAttribute("data");
		if(map != null){
			List<HashMap<String, Object>> list = (List<HashMap<String, Object>>) map.get("list");
			for(int i = 0; i < list.size(); i++){
	%>
		<a href="<%=list.get(i).get("path") %><%=list.get(i).get("file") %>"><%=list.get(i).get("file") %></a>
		<hr>
	<%		}
		}%>
</body>
</html>