/**
 * 
 */

function checkBoard(){
	if (document.getElementById("subject").value == ""){ 
		alert("제목을 입력하시오");
		document.getElementById("content").focus();
	}
	else if (document.getElementById("content").value == ""){
		alert("비밀번호 입력하시오");
	}
	else {
		document.forms[0].submit();
	}
}

function isLogin(memId,seq,pg){
	if(memId==""){
		alert("로그인 먼저 해주세요");
	}else{
		location.href="/miniproject/board/boardView.do?seq="+seq+"&pg="+pg;
	}
}
