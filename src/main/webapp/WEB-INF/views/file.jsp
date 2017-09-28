<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>File Upload</title>
</head>
<body>
	<h1>File</h1>
	<form action="fileUpload" method="post" enctype="multipart/form-data">
		<input type="file" name="file" multiple="multiple">
		<input type="submit" value="업로드">
	</form>
</body>
</html>