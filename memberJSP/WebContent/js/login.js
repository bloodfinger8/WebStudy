/**
 * 
 */
function checkLogin() { //유효성 검사 
		if (document.loginForm.pwd.value == "") 
			alert("비밀번호를 입력하시오");
		else if (document.loginForm.id.value == "") 
			alert("아이디를 입력하시오");
		else 
			document.loginForm.submit();
	}