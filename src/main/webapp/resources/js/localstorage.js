/******************************************************
 * LocalStorage를 이용하여 데이터 저장하는 방법
 * https://www.w3schools.com/html/html5_webstorage.asp
 ******************************************************/
function set(data){ //localStorage에 setItem()을 이용하여 데이터 입력하는 부분
	localStorage.setItem("data", JSON.stringify(data)); //문자열로 변경
}

function get(){ //localStorage에 getItem()을 이용하여 데이터 가져오는 부분
	if(JSON.parse(localStorage.getItem("data"))){	
		storage = JSON.parse(localStorage.getItem("data")); //객체로 변경
	}
}
