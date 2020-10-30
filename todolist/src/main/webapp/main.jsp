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
                    <ul class="tasklist" id="${type }">
	                    <c:forEach var="sequence" items="${todoSequence }">
	                    	<c:forEach var="todo" items="${list }">
	                    		<c:if test="${todo.type eq type }">
	                    			<c:if test="${todo.sequence eq sequence }">
			                        <li>
			                       		<div class="view">
				                           <c:choose>
			                           	   		<c:when test="${type == 'DOING'}">
			                           				<c:choose>
					                           			<c:when test="${sequence == '1'}">
						                           			<input class="star" type="button" value="★" onclick="starButtonClick(${todo.id}, ${todo.sequence}, this)" style="color:orange">
						                           		</c:when>
						                           		<c:when test="${sequence == '2'}">
						                           			<input class="star" type="button" value="★" onclick="starButtonClick(${todo.id}, ${todo.sequence}, this)">
						                         		</c:when>
					                           		</c:choose>
				                           			<input class="toggle" id="${type }" type="checkbox" onchange="toggleButtonChange(${todo.id}, ${todo.sequence}, this)">
				                           		</c:when>
				                           		<c:when test="${type == 'DONE'}">
				                           			<input class="toggle" id="${type }" type="checkbox" onchange="toggleButtonChange(${todo.id}, ${todo.sequence}, this)" checked>
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
    
<script src="js/script.js"></script>
</body>
</html>