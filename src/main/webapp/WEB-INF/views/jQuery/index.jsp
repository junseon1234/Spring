<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jQuery</title>
<!-- jQuery 라이브러리 추가하여 사용 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="resources/js/jquery.js" type="text/javascript"></script>
<script src="resources/js/localstorage.js" type="text/javascript"></script>
</head>
<body style="height: 100px; background-color: cyan;">
	  <!-- 태그에 직접 이벤트를 처리할 경우 onclick과 같은 속성으로 script를 정의할 수 있다 -->
	  
한줄평 : <input type="text" placeholder="입력하세요" class="ratetext"> <button type="button" id="submit"> 내용 추가 </button>	  
<table border="1">
<thead>
	<tr>
		<th>선택</th>
		<th>번호</th>
		<th>한줄평</th>
		<th>삭제</th>
	</tr>
</thead>
<tbody>
</tbody>
</table>
<div></div>

</body>
</html>