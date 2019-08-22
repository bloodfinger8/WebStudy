function checkLogin() { //유효성 검사 
		if (document.loginForm.name.value == "") 
			alert("이름을 입력하시오");
		else if (document.loginForm.id.value == "") 
			alert("아이디를 입력하시오");
		else 
			document.loginForm.submit();
	}