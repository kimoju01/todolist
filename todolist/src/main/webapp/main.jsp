<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                <input class="new-todo" type="text" placeholder="Add a new task" autofocus>
            </header>
            <section class="main">
                <div class="doing">
                    <p>DOING</p>
                    <ul class="doing-list">
                        <li>
                            <div class="view">
                                <button class="star"></button>
                                <input class="toggle" type="checkbox">
                                <label>doingfawefawfwafeawfwafafeawfeawffaefsefasfesfeas</label>
                                <button class="destroy"></button>
                            </div>    
                        </li>
                    </ul>
                </div>
                <div class="done">
                    <p>DONE</p>
                    <ul class="done-list">
                        <li>
                            <div class="view">
                                <input class="toggle" type="checkbox" checked>
                                <label>done</label>
                                <button class="destroy"></button>
                            </div>    
                        </li>
                        <li>
                            <div class="view">
                                <input class="toggle" type="checkbox" checked>
                                <label>done</label>
                                <button class="destroy"></button>
                            </div>    
                        </li>
                        <li>
                            <div class="view">
                                <input class="toggle" type="checkbox" checked>
                                <label>done</label>
                                <button class="destroy"></button>
                            </div>    
                        </li>
                        <li>
                            <div class="view">
                                <input class="toggle" type="checkbox" checked>
                                <label>done</label>
                                <button class="destroy"></button>
                            </div>    
                        </li>
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