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