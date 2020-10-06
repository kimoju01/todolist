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
<script>

</script>
</head>
<body>
    <div class="container">
        <section class="todoapp">
            <header class="header">
                <h1>T O - D O</h1>
                <input class="new-todo" type="text" placeholder="Add a new task" autofocus>
            </header>
            <section class="main">
                <div class="doing">
                    <p>DOING</p>
                    <ul class="doing-list">
                    <c:forEach var="todo" items="${list }">
			  				<c:if test="${todo.type == 'DOING'}">
		                        <li>
		                            <div class="view">
		                            	<button class="star" onclick="starButtonClick(${todo.id }, this)"></button>
		                                <input class="toggle" type="checkbox">
		                                <label>${todo.title }</label>
		                                <button class="destroy" onclick="destroyButtonClick(${todo.id }, this)"></button>
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
		                                <input class="toggle" type="checkbox" checked>
		                                <label>${todo.title }</label>
		                                <button class="destroy"></button>
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
</body>
</html>