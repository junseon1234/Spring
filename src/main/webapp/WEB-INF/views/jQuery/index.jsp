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
	 $(document).ready(function(){
		 console.log("document가 모두 실행된 후", $("body"));
		 
		 var i = 1;
		//기능 추가
		 $("button").click(function(){
			 
			 //body 태그에 내용을 추가하는 방법은...
			 
			 var text = $("input").val();
			 //var tag = "<h1 onclick='hEvent(this);'>" + i + ", 안녕!</h1>"; //JavaScript 식으로
			 var tag ="<tr class='tablerow'>"
			 tag += "<td><input type='checkbox'></td>"
			 tag += "<td>" + i + "</td>"
			 tag += "<td> <span>"+ text +"</span></td>"
			 tag += "<td> <button type='button'> 삭제 </button> </td>"
			 tag += "</tr>"; //jQuery용으로 변경
			 
			 // 글자만 넣는 방법 : text();
//			 $("div").text(text);
			 
			 // 태그와 같이 넣는 방법 : html();
//			 $("div").html(tag);

			 // 내용을 중첩으로 넣을 경우 : append(), prepend()
			 // append() 뒤에 내용을 넣는 방법. (text1)
			 $("table").append(tag); 

			 // prepend() 앞에 내용을 넣는 방법.
//			 $("div").prepend(tag);
			 
//				 $("h1").off();  // 이전 이벤트를 종료하게 만든다.
//				 $("h1").on("click", function(){ // 이벤트를 생성해준다
//				 alert("jQuery로 선택되었습니다");
//				 $(this).text($(this).text() + " 선택되었습니다");
//			 });

			$(".tablerow button").off();
			$(".tablerow button").on("click", function(){
//				$(this).remove();  // 자신을 지우는 행위를 하기에 사용 불가
				var index = $(".tablerow button").index(this);  // 선택자가 몇번째 인덱스인지를 구한다.
				console.log(index);
				$(".tablerow").eq(index).remove();  //구한 인덱스를 이용하여 h1태그를 삭제한다.
				/* 인덱스를 구하기 위한 JQuery 함수는 index() 이다.
				 * 선택자가 배열로 되어있기 때문에 구한 인덱스를 eq()를 이용하여 원하는 내용을 선택할 수 있다. 
				 * remove() 는 선택된 내용을 전체 지우는 행위를 한다.
				 */
			});
			 
			
			
			$(".tablerow input:checkbox").off();
			$(".tablerow input:checkbox").on("click",function(){
				// h1의 인덱스 값 가져오가
				var index = $(".tablerow input:checkbox").index(this);
				//선택된 h1 객체를 변수에 담기(아래에서 공통으로 사용하기 위해 사용)
				var tbody = $(".tablerow").eq(index);
				
				// 해당 체크박스 상태를 확인하기 위해 if문 사용
				if($(this).prop('checked')){
					// span 태그의 내용을 변수에 담기
					var text = tbody.find("span").text();
					// 입력 받을 수 있도록 태그에 추가
					tbody.find("span").text("");
					tbody.find("span").append("<input type='text' value='" + text + "'>")
				}else{
					// 입력받은 내용을 다시 span태그에 덮어쓰기
					tbody.find("span").text(tbody.find("input:text").val());
					// 입력받는 태그 화면에서 제거
					tbody.find("input:text").remove();
				}
			});
			/************************************************************************
			 * 1. 선택자 중에 input의 type은 여러가지가 올 수 있기 때문에 input:type를 선택할 수 있다
			 * 예) <input type="text">   -> $("input:text")
			 * 
			 * 2. 체크박스는 결과값이 true & false를 리턴하기 때문에 jQuery에서 .prop()을 사용한다
			 * 예) $("input:checkbox").prop('checked') <-- 결과값 가져오는 방법
			 *
			 * 3. 하위 태그를 찾기 위한 방법으로 find()를 이용하여 정보를 가져올 수 있다.
			 * 예) $("h1").find("span")  <-- h1 태그 안에 span 태그 정보 가져오는 방법
			 ************************************************************************/
			
			i++;
		 }); 
	 });
	 
	 
	 
	 function hEvent(attr){
		 alert("h1 태그 선택");
		 // this의 정보 중에 속에 있는(innerHTML) 내용을 가져 올 수 있다.
		 console.log(attr.innerHTML);
		 // innerHTML을 이용하여 내용을 변경도 가능하다.
		 attr.innerHTML = attr.innerHTML + " 선택 되었습니다."
	//		 document.getElementsByTagName("h1")[0].innerHTML
	//		 this) -> attr.innerHTML   //위와 동일한 방법으로 처리 가능
	 }
	 
</script>
</head>
<body style="height: 100px; background-color: cyan;">
	  <!-- 태그에 직접 이벤트를 처리할 경우 onclick과 같은 속성으로 script를 정의할 수 있다 -->
	  
한줄평 : <input type="text" placeholder="입력하세요" class="ratetext"> <button type="button"> 내용 추가 </button>	  
<table border="1">
<tr>
	<th>선택</th>
	<th>번호</th>
	<th>한줄평</th>
	<th>삭제</th>
</tr>

</table>
<div></div>

</body>
</html>