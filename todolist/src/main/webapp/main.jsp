<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>TODO</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container">
        <section class="todoapp">
            <header class="header">
                <h1>T O - D O</h1>
                <form name="writetask" action="/todolist/add" method="post" onsubmit="return check();">
                	<input class="new-todo" name="newtask" type="text" placeholder="Add a new task" autofocus>
                </form>
            </header>
            <section class="main">
            <c:forEach var="type" items="${todoTypes }">
                <div class="${type}">
                    <p>${type}</p>
                    <ul class="tasklist">
	                    <c:forEach var="sequence" items="${todoSequence }">
	                    	<c:forEach var="todo" items="${list }">
	                    		<c:if test="${todo.type eq type }">
	                    			<c:if test="${todo.sequence eq sequence }">
			                        <li>
			                       		<div class="view">
			                       			<c:if test="${type == 'DOING' }">
			                           			<c:choose>
			                           			<c:when test="${sequence == '1'}">
				                           			<input class="star" name="starBtn1" type="button" value="★" onclick="starButtonClick(${todo.id}, ${todo.sequence}, this)" style="color:orange">
				                           		</c:when>
				                           		<c:when test="${sequence == '2'}">
				                           			<input class="star" name="starBtn2" type="button" value="★" onclick="starButtonClick(${todo.id}, ${todo.sequence}, this)">
				                         	 	</c:when>
				                           		</c:choose>
				                           	</c:if>
				                           	<c:choose>
			                           		<c:when test="${type == 'DOING'}">
				                           		<input class="toggle" id="${todo.type }" name="toggleBtn" type="checkbox" onchange="toggleButtonChange(${todo.id}, ${todo.type}, this)">
				                           	</c:when>
				                           	<c:when test="${type == 'DONE'}">
				                           		<input class="toggle" id="${todo.type }" name="toggleBtn" type="checkbox" onchange="toggleButtonChange(${todo.id}, ${todo.type}, this)" checked>
				                          	</c:when>
				                          	</c:choose>
			                               	<label>${todo.title }</label>
			                               	<button class="destroy" name="desBtn" onclick="destroyButtonClick(${todo.id}, this)"></button>
			                           	</div>    
			                       	</li>
			                       	</c:if>
			               		</c:if>
			            	</c:forEach> 
		                </c:forEach>
                    </ul>
                </div>
                </c:forEach>
            </section>
        </section>
        <footer class="footer">
            kimoju03@naver.com
        </footer>
    </div>
    
<script>

	var doingList = document.querySelector('.doing-list');
	var doneList = document.querySelector('.done-list');
	
	function check() {
		var form = document.writetask;

		if(form.newtask.value == "") {
			alert("할 일을 적어주세요");
		    form.newtask.focus();
		    return false;
		    }
			
			form.submit();
					      
	}
	
	function destroyButtonClick(id, eventNode) {
	
		var httpRequest = new XMLHttpRequest();
		httpRequest.addEventListener("load", function() {
			if(this.responseText === "success")
				eventNode.parentNode.parentNode.remove();		
		});
		
		httpRequest.open('GET', "./delete?id=" + id);
		httpRequest.send();
	}
	
	
	function starButtonClick(id, sequence, eventNode) {
	
		var httpRequest = new XMLHttpRequest();
		httpRequest.addEventListener("load", function() {
			if(this.responseText === "success") {
				if(sequence == 1) {		//중요 표시 되어있을 때 클릭하면
					eventNode.style.color = "rgb(200, 200, 200)";	//중요 표시 해제하고
					sequence = 2;
				} else if(sequence == 2) {
					eventNode.style.color = "orange";
					sequence = 1;
					}
				}	//if절 끝
			});
		
		httpRequest.open('GET', "./sequence?id=" + id + "&sequence=" + sequence);
		httpRequest.send();
		
	}

	function toggleButtonChange(id, newtype, eventNode) {
		
		console.log(eventNode[0]);
		
		var httpRequest = new XMLHttpRequest();
		httpRequest.addEventListener("load", function() {
			if(this.responseText === "success") {
				if(eventNode.id == "DOING") {	
					newtype = "DONE";
					doneList.appendChild(eventNode.parentNode.parentNode);
				} else if(eventNode.id == "DONE") {
					newtype = "DOING";
					doingList.appendChild(eventNode.parentNode.parentNode);
					}
				}
			});
		
		httpRequest.open('GET', "./type?id=" + id + "&type=" + newtype);
		httpRequest.send();
		
	}


</script>
</body>
</html>