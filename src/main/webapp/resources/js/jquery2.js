		 var storage = [];
		 var i = 1; 
		 $(document).ready(function(){
			 createHtml(); 
			 
			 $("#submit").click(function(){
				 var text = $("input").val();
				 var newData = {"no":i, "text": text};
				 storage.push(newData); 
				 set(storage);
				 createHtml();
				 $("input").val("");
			 }); 
			 
			 
			 $("#delete").click(function(){
				 for(var j = 0; j<storage.length; j++){ 
					 if($("input:checkbox").eq(j).prop("checked")){ //input 배열에서 checked가 된 경우만 
						storage.splice(j, 1); //삭제하고
						set(storage);  //로컬에 반영해서
						createHtml();  //HTML에 적용
						break;
					 }
				 }
			 });
			 
			 
			 $("#update").click(function(){
				 for(var j = 0; j<storage.length; j++){
					 if($("input:checkbox").eq(j).prop("checked")){
						var text = $("input:text").val();
						storage[j].text = text;  //storage의 text라는 key의 value를 위의 input창에 입력된 text로 변경하고
						set(storage);  //로컬스토리지 넣어서
						createHtml(); //반영한다
						$("input:text").val("");
						break;
					 }
				 }
			 });
		 });
		 
		 
		
		
		 function createHtml(){
			 get(); 
			 $("tbody").empty();
			 for(var j = 0; j<storage.length; j++){
				 var tag ="<tr>"
					 tag += "<td><input type='checkbox'></td>"
					 tag += "<td>" + storage[j].no + "</td>"
					 tag += "<td> <span>"+ storage[j].text +"</span></td>"
					 tag += "</tr>"; 
				 $("table").append(tag); 
				 i = j;
			 }

			if(storage.length > 0){
				i = storage.length + 1;
				$("input:checkbox").click(function(){ 
					if($(this).prop("checked")){ 
						 $("input:checkbox").prop("checked",false); 
						 $(this).prop("checked",true); 
						 
					 }else{
						 $("input:checkbox").prop("checked",false); 
					 }
				 });
			}
			
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


