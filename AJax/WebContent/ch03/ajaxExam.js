/**
 * 
 */
var xhr = null;
function startMethod(){
	xhr = new XMLHttpRequest();
	xhr.onreadystatechange = resultProcess;
	xhr.open("GET","ajaxExam.xml" , true );
	xhr.send();
	
}

function resultProcess(){
	if(xhr.readyState==4 && xhr.status==200){
		processXML();
	}
}

function processXML(){
	var trChild = document.getElementById("resultDisplay").childNodes;
//	alert(trChild.length);
	var size = trChild.length;
	for(var i=size-1; i>=0; i--){
		trChild[i].remove();
	
	}
	//if(trChild.length>0) return false;
	
	var xmlDoc = xhr.responseXML;
	var trTag;
	var tdTag;
	var subjectList = xmlDoc.getElementsByTagName("subject");
	//var message = '';
	
	for(var i=0; i<subjectList.length; i++){
		trTag = document.createElement('tr');
		
		var childs = subjectList[i].childNodes;
		for(var j=0; j<childs.length; j++){
			if(childs[j].firstChild != null){
				tdTag = document.createElement('td');
				
				var  text = childs[j].firstChild;
				
				tdTag.appendChild(text);
				trTag.appendChild(tdTag);
			}
		}
		
		//var subject = subjectList.item(i);
		//var [codeNumber, titleName, roomNumber] = subject.children;
//		var codeNumber = subject.getElementsByTagName("codeNumber").item(0).firstChild.nodeValue;
//		var titleName = subject.getElementsByTagName("titleName").item(0).firstChild.nodeValue;
//		var roomNumber = subject.getElementsByTagName("roomNumber").item(0).firstChild.nodeValue;
		
		//message += "<tr><td>" + codeNumber.textContent+"</td>";
		//message += "<td>" + titleName.textContent+"</td>";
		//message += "<td>" + roomNumber.textContent+"</td></tr>";
//		message += "<tr><td>" + codeNumber+"</td>";
//		message += "<td>" + titleName+"</td>";
//		message += "<td>" + roomNumber+"</td></tr>";
		document.getElementById("resultDisplay").appendChild(trTag);
	}
	//document.getElementById("resultDisplay").innerHTML = message;

}


