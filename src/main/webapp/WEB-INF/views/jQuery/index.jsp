<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jQuery</title>
<!-- jQuery 라이브러리 추가하여 사용 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
//javasript로 함수를 만들어서 호출
//function appEvent(text){
//	alert(text);
//}
//appEvent("호출되었습니다.");

//jQuery로 바로 함수를 호출
//(function(text){
//	alert(text);
//})("바로 호출 되었습니다.")
</script>
<script type="text/javascript">

	/* jQuery 시작
	 * $  : JQuery를 뜻하는 기호
	 * () : 선택자를 넣어서 선언할 수 있는 영역이다.
	 * .  : 점을 이용하여 함수를 연결할 수 있다.
	 */
	 console.log("시작");
	 console.log($("html"));    //HTML 태그 정보
	 console.log($("head"));	//HEAD 태그 정보
	 console.log($("meta"));	//META 태그 정보
	 console.log($("title"));	//TITLE 태그 정보
	 console.log($("script"));	//SCRIPT 태그 정보
	 console.log("그냥 실행할 경우 ", $("body"));	//BODY 태그 정보
	 $(document).ready(function(){
		 console.log("document가 모두 실행된 후", $("body"));
		 
		 var i = 1;
		//기능 추가
		 $("button").click(function(){
			 alert("눌렀습니다");
			 
			 //body 태그에 내용을 추가하는 방법은...
			 
			 var text = "안녕!";
//var tag = "<h1 onclick='hEvent(this);'>" + i + ", 안녕!</h1>"; //JavaScript 식으로
			 var tag = "<h1>" + i + ", 안녕!</h1>"; //jQuery용으로 변경
			 
			 // 글자만 넣는 방법 : text();
//			 $("div").text(text);
			 
			 // 태그와 같이 넣는 방법 : html();
//			 $("div").html(tag);

			 // 내용을 중첩으로 넣을 경우 : append(), prepend()
			 // append() 뒤에 내용을 넣는 방법. (text1)
//			 $("div").append(tag); 

			 // prepend() 앞에 내용을 넣는 방법.
			 $("div").prepend(tag);
			 
			 $("h1").off();  // 이전 이벤트를 종료하게 만든다.
			 $("h1").on("click", function(){ // 이벤트를 생성해준다
				 alert("jQuery로 선택되었습니다");
				 $(this).text($(this).text() + " 선택되었습니다");
			 });
			 
			 i++;
		 }); 
	 });
	 console.log("종료");
	 
	 function hEvent(attr){
		 alert("h1 태그 선택");
		 // this의 정보 중에 속에 있는(innerHTML) 내용을 가져 올 수 있다.
		 console.log(attr.innerHTML);
		 // innerHTML을 이용하여 내용을 변경도 가능하다.
		 attr.innerHTML = attr.innerHTML + " 선택 되었습니다."
	//		 document.getElementsByTagName("h1")[0].innerHTML
	//		 this) -> atter.innerHTML   //위와 동일한 방법으로 처리 가능
	 }
	 
</script>
</head>
<body style="height: 100px; background-color: green;">
	  <!-- 태그에 직접 이벤트를 처리할 경우 onclick과 같은 속성으로 script를 정의할 수 있다 -->
	  
<button type="button"> 추가 </button>	  
<div></div>

</body>
</html>