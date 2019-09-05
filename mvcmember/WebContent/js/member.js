/**
 * 
 */

function checkWrite() { //유효성 검사 
		if (document.writeForm.name.value == "") {
			alert("이름 입력하시오");
		}else if (document.writeForm.id.value == "") {
			alert("아이디 입력하시오");
		}else if (document.writeForm.pwd.value == "") {
			alert("비밀번호를 입력하시오");
		}else if (document.writeForm.repwd.value == "") {
			alert("비밀번호 재확인을 입력하시오");
		}else if((document.writeForm.pwd.value != document.writeForm.repwd.value)){
			alert("비밀번호 불일치");
		}else if(document.writeForm.check.value != document.writeForm.id.value){
			alert("중복체크 하세요");
		}else{
			document.writeForm.submit();
		}
	}

function checkIdClose(id){
	//1.데이터전달 
	opener.writeForm.id.value = id;
	opener.writeForm.check.value = id; //만약에 중복체크를 하고 아이디를 다른걸로 변경했을때를 위해
	//2.창닫아버리기
	window.close();
	//3.다음창(비밀번호)에 포커스 깜빡깜빡
	opener.writeForm.pwd.focus();
}

function checkId(){ //id 중복 확인
	var sId = document.writeForm.id.value;
	if(sId==""){
		alert("먼저 ID입력하세요");
	}else{
		window.open("http://localhost:8080/mvcmember/member/checkId.do?id="+sId,
				"",
				"width=300 height=100 left=250 top=200");
	}
	
}

function checkGender(){
	var sid = document.modifyForm.gendercheck.value;
}


function checkPost(){ //우편주소 확인
	window.open("checkPost.jsp","","width=500 height=500 scrollbars=yes "); //크롬은 스크롤이 있지만 익스플로러는 없다.
}

function checkPostClose(zipcode,address){
//	opener.document.getElementById('daum_zipcode').value = zipcode;
//	opener.document.getElementById('daum_addr1').value = address;
//	window.close();
//	opener.document.getElementById('daum_addr2').focus();
	
	opener.document.forms[0].zipcode.value = zipcode;
	opener.document.forms[0].addr1.value = address;
	window.close();
	opener.document.forms[0].addr2.focus();
}

function checkLogin() { //유효성 검사 
	if (document.loginForm.id.value == "") 
		alert("아이디를 입력하시오");
	else if (document.loginForm.pwd.value == "") 
		alert("비밀번호를 입력하시오");
	else 
		document.loginForm.submit();
}

function checkModify(){
	if (document.modifyForm.id.value == ""){ 
		alert("이름을 입력하시오");
	}
	else if (document.modifyForm.pwd.value == ""){
		alert("비밀번호 입력하시오");
	}
	else if ((document.modifyForm.pwd.value != document.modifyForm.repwd.value)){
		alert("비밀번호 불일치 합니다.");
	}
	else {
		document.modifyForm.submit();
		
	}
}


