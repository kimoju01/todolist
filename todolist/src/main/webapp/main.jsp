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
                <div class="doing">
                    <p>DOING</p>
                    <ul class="doing-list">
                    <c:forEach var="sequence" items="${todoSequence }">
                    	<c:forEach var="todo" items="${list }">
                    		<c:if test="${todo.sequence == sequence }">
			  					<c:if test="${todo.type == 'DOING'}">
		                        	<li>
		                        		<div class="view">
		                            		<c:choose>
		                            		<c:when test="${todo.sequence == '1'}">
			                            		<input class="star" name="starBtn1" type="button" value="★" onclick="starButtonClick(${todo.id}, ${todo.sequence}, this)" style="color:orange">
			                            	</c:when>
			                            	<c:when test="${todo.sequence == '2'}">
			                            		<input class="star" name="starBtn2" type="button" value="★" onclick="starButtonClick(${todo.id}, ${todo.sequence}, this)">
			                          	 	</c:when>
			                            	</c:choose>
			                            	<input class="toggle" name="toggleBtn" type="checkbox" onchange="toggleButtonChange(${todo.id}, ${todo.type }, this)">
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
                <div class="done">
                    <p>DONE</p>
                    <ul class="done-list">
                        <c:forEach var="todo" items="${list }">
			  				<c:if test="${todo.type == 'DONE'}">
		                        <li>
		                            <div class="view">
		                                <input class="toggle" name="toggleBtn" type="checkbox" onchange="toggleButtonChange(${todo.id}, ${todo.type }, this)" checked>
		                                <label>${todo.title }</label>
		                                <button class="destroy" name="desBtn" onclick="destroyButtonClick(${todo.id}, this)"></button>
		                            </div>    
		                        </li>
		                	</c:if> 
	                    </c:forEach>
                    </ul>
                </div>
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
					//doingList.insertBefore(eventNode.parentNode.parentNode, doingList.firstChild);
					}
				}	//if절 끝
			});
		
		httpRequest.open('GET', "./sequence?id=" + id + "&sequence=" + sequence);
		httpRequest.send();
		
	}

	function toggleButtonChange(id, type, eventNode) {
		
		
	}


</script>
</body>
</html>