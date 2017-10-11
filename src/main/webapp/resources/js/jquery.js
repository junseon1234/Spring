	/* jQuery 시작
		 * $  : JQuery를 뜻하는 기호
		 * () : 선택자를 넣어서 선언할 수 있는 영역이다.
		 * .  : 점을 이용하여 함수를 연결할 수 있다.
		 */
		 var storage = [];
		 var i = 1; //순서를 위해 초기값 1로 지정
		 $(document).ready(function(){
			 createHtml(); //localStorage에서 데이터 가져와서 화면에 보여주기
			 
			//기능 추가
			 $("#submit").click(function(){
				 
				 //body 태그에 내용을 추가하는 방법은...
				 
				 var text = $("input").val();
				 // 글자만 넣는 방법 : text();
				 //	$("div").text(text);
				 
				 // 태그와 같이 넣는 방법 : html();
				 // $("div").html(tag);
	
				 // 내용을 중첩으로 넣을 경우 : append(), prepend()
				 // append() 뒤에 내용을 넣는 방법. (text1)
				 
				 
				 var newData = {"no":i, "text": text}; //하나의 행을 생성
				 storage.push(newData); //storage 배열에 넣는다.
				 set(storage);
				 
				 createHtml(); //화면 생성
				 
				 // prepend() 앞에 내용을 넣는 방법.
				 // $("div").prepend(tag);
				 
				 $("input").val("");
				
			 }); 
		 });
		//javasript로 함수를 만들어서 호출
		//function appEvent(text){
		 //			alert(text);
		//}
		//appEvent("호출되었습니다.");

		//jQuery로 바로 함수를 호출
		//(function(text){
		//			alert(text);
		//})("바로 호출 되었습니다.")
		 
		 function createHtml(){
			 get(); // localStorage에서 데이터 가져오기
			 $("tbody").empty();
			 for(var j = 0; j<storage.length; j++){
				 var tag ="<tr>"
					 tag += "<td><input type='checkbox'></td>"
					 tag += "<td>" + storage[j].no + "</td>"
					 tag += "<td> <span>"+ storage[j].text +"</span></td>"
					 tag += "<td> <button type='button'> 삭제 </button> </td>"
					 tag += "</tr>"; //jQuery용으로 변경
				 $("table").append(tag); //변수에 저장된 값을 추가해줌
				 i = j;
			 }
			 
//			 	 $("h1").off();  // 이전 이벤트를 종료하게 만든다.
//				 $("h1").on("click", function(){ // 이벤트를 생성해준다
//				 alert("jQuery로 선택되었습니다");
//				 $(this).text($(this).text() + " 선택되었습니다");
//			 });
				if(storage.length > 0){
					i = storage.length + 1; //storage가 생성된 뒤로는 i를 1씩 증가
					$("tbody button").off();
					$("tbody button").on("click", function(){
				//	$(this).remove();  // 자신을 지우는 행위를 하기에 사용 불가
						var index = $("tbody tr").index(this);  // 선택자가 몇번째 인덱스인지를 구한다.
						storage.splice(index, 1);
						set(storage);
						// $("tbody tr").eq(index).remove();  //구한 인덱스를 이용하여 h1태그를 삭제한다.
						/* 인덱스를 구하기 위한 JQuery 함수는 index() 이다.
						 * 선택자가 배열로 되어있기 때문에 구한 인덱스를 eq()를 이용하여 원하는 내용을 선택할 수 있다. 
						 * remove() 는 선택된 내용을 전체 지우는 행위를 한다.
						 */
						createHtml();
					});
							 
							
							
					$("tbody input:checkbox").off();
					$("tbody input:checkbox").on("click",function(){
						// h1의 인덱스 값 가져오가
						var index = $("tbody input:checkbox").index(this);
						//선택된 h1 객체를 변수에 담기(아래에서 공통으로 사용하기 위해 사용)
						var tbody = $("tbody tr").eq(index);
						
						console.log(index);
						
						// 해당 체크박스 상태를 확인하기 위해 if문 사용
						if($(this).prop('checked')){
							// span 태그의 내용을 변수에 담기
							text = tbody.find("span").text();
							// 입력 받을 수 있도록 태그에 추가
							tbody.find("span").html("<input type='text' value='" + text + "'>")
						}else{
							text = tbody.find("span input").val();
							var newData = storage[index];
							newData.text = text;
							storage[index] = newData; // {}
							set(storage); //변경된 storage의 배열를 다시 localStorage로 적용 
							createHtml();
						}
					});
				}
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
							
			 
		 }

