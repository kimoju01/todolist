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
                    <c:forEach var="todo" items="${list }">
			  				<c:if test="${todo.type == 'DOING'}">
		                        <li>
		                            <div class="view">
			                            <input class="star" name="starBtn" type="button" value="★" onclick="starButtonClick(${todo.id}, ${todo.sequence}, this)">
			                            <input class="toggle" name="toggleBtn" type="checkbox" onchange="toggleButtonChange(${todo.id}, this)">
		                                <label>${todo.title }</label>
		                                <button class="destroy" name="desBtn" onclick="destroyButtonClick(${todo.id}, this)"></button>
		                            </div>    
		                        </li>
		                	</c:if> 
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
		                                <input class="toggle" name="toggleBtn" type="checkbox" onchange="toggleButtonChange(${todo.id}, this)" checked>
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
		console.log(id + "/" + sequence);
	}

	
	/*	
	function draw(sequence, eventNode) {
		var insertItem = eventNode.parentNode.parentNode;
		
		if(sequence == 2) {
			sequence = 1;

			var list = document.querySelector(".doing-list");
			list.insertBefore(insertItem, list.firstChild);
		} else if(sequence == 1) {
			sequence = 2;
		}
		
	}
	*/
	
	/*
	function starButtonClick(id, eventNode) {
		var httpRequest = new XMLHttpRequest();
		var sequence = eventNode.getAttribute("id");
		
		httpRequest.addEventListener("load", function() {
			if(this.responseText === "success")
				draw(sequence, eventNode);
		});
		
		httpRequest.open("GET", "./sequence?id=" + id + "&sequence=" + sequence);
		httpRequest.send();
	}
	*/
	
	function toggleButtonChange(id, eventNode) {
		
		
	}
	
	function remove(eventNode) {
		eventNode.parentNode.parentNode.remove();
	}
	
	
	
	/*
	function starButtonClick(id, eventNode) {
		
		
		
		
		var star = document.querySelector('.star');
		var doingList = document.querySelector('.doing-list');
		
		if(star.checked) {
            star.style.color = "rgb(200, 200, 200)";
            star.checked = false;
        } else {
            star.style.color = "orange";
            doingList.insertBefore(star.parentElement.parentElement, doingList.firstChild);
            star.checked = true;
        }
		
		window.location = "/todolist/type";
		
	}
	*/

</script>
</body>
</html>