var xhr = null;

function startMethod(){
	document.getElementById("displayArea").style.visibility="visible";
	xhr = new XMLHttpRequest();
	xhr.onreadystatechange = resultProcess;
	xhr.open("GET","ajaxExam.xml",true);
	xhr.send();
}

function resultProcess(){
	if(xhr.readyState==4 && xhr.status==200){
		document.getElementById("displayArea").innerHTML = xhr.responseText;
	}
}