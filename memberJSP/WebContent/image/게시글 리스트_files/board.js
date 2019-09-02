/**
 * 
 */

function checkBoardWrite(){
	if (document.boardWriteForm.subject.value == ""){ 
		alert("제목을 입력하시오");
	}
	else if (document.boardWriteForm.content.value == ""){
		alert("비밀번호 입력하시오");
	}
	else {
		document.boardWriteForm.submit();
	}
}

function isLogin(memId,seq,pg){
	if(memId==""){
		alert("로그인 먼저 해주세요");
	}else{
		location.href="../board/boardView.jsp?seq="+seq+"&pg="+pg;
	}
	
}