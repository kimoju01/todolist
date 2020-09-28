<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>TODO</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- <link rel="stylesheet" href="css/style.css"> -->
    <style>
        html, body {
            margin: 0;
            height: 100%;
            /* overflow: auto; */
        }
        .container {
            background-color: rgb(243, 243, 243);
            height: 100%;
            overflow: auto;
        }
        
        .todoapp {
            margin: 0 auto;
            border-radius: 5px;
            border: 1px solid rgb(200, 200, 200);
            width: 900px;
            height: auto;
            overflow: auto;
            padding-bottom: 100px;
            margin-top: 50px;
            background-color: white;
        }

        h1 {
            font-size: 3.5em;
            text-align: center;
            color: rgb(195,214,155);
            /* color: darkgreen; */
        }

        .new-todo {
            display: block;
            margin: 0 auto;
            padding: 16px 16px 16px 30px;
            border: 1px solid rgb(180, 180, 180);
            font-size: 1em;
            width: 600px;
            height: 15px;
        }

        .new-todo::placeholder {
            color: rgb(200, 200, 200);
            font-style: italic;
        }

        .main {
            padding-top: 50px;
        }
        
        .main > div p {
            text-align: center;
            font-size: 0.8em;
            color: rgb(180, 180, 180);
            padding-bottom: 20px;
        }

        .doing {
            float: left;
            box-sizing: border-box;
            width: 50%;
            /* background-color: darkcyan; */
            border-right: 1px solid rgb(200, 200, 200);
        } 
        
        .done {
            float: left;
            box-sizing: border-box;
            width: 50%;
            margin-left: -1px;
            border-left: 1px solid rgb(200, 200, 200);
            /* background-color: darkgreen; */
        }

        .doing-list, .done-list {
            list-style: none;
            color: rgb(180, 180, 180);
            padding-bottom: 15px;
        }

        .main li {
            border-bottom: 1px solid rgb(200, 200, 200);
            font-size: 1em;
            margin-right: 50px;
            margin-bottom: 3px;
            padding: 0px 0px 8px 8px;
            /* background-color: cadetblue; */
        }

        .main .done-list .view {
            padding-top: 8px;
        }

        .main li label {
            display: inline-block;
        }

        .main li .star {
            display: inline-block;
            width: 20px;
            height: 10px;
            margin-left: -10px;
            margin-right: 3px;
            font-size: 1.4em;
            border: 0;
            transition: color 0.2s ease-out;
            background: none;
            color: rgb(160, 160, 160);
        }

        .main li .star:hover {
            color: orange;
        }

        .main li .star::before {
            content: ' ☆ ';
        }

        .main li .star:hover::before {
            content: ' ★ ';
        }

        .main li .destroy {
            display: none;
            float: right;
            /* width: 15px; */
            /* height: 15px; */
            margin-right: 10px;
            margin-top: 1px;
            color: rgb(195,214,155);
            font-size: 1.5em;
            transition: color 0.2s ease-out;
            background: none;
            border: 0;
        }   

        .main .done-list li .destroy {
            display: none;
            float: right;
            /* width: 15px; */
            /* height: 15px; */
            margin-right: 10px;
            margin-top: -7px;
            color: rgb(195,214,155);
            font-size: 1.5em;
            transition: color 0.2s ease-out;
            background: none;
            border: 0;
        }   

        .main li .destroy:hover {
            color: olivedrab;
        }

        .main li .destroy::after {
            content: ' x ';
        }

        .main li:hover .destroy {
            display: inline-block;
        }

        .done-list li label {
            text-decoration: line-through;
        }

        .footer {
            /* background-color: orange; */
            clear: both;
            text-align: center;
            padding-top: 7px;
            font-size: 0.8em;
            color: rgb(180, 180, 180);
        }

    </style>
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
                                <label>doing</label>
                                <button class="destroy"></button>
                            </div>    
                        </li>
                        <li>
                            <div class="view">
                                <button class="star"></button>
                                <input class="toggle" type="checkbox">
                                <label>doing</label>
                                <button class="destroy"></button>
                            </div>    
                        </li>
                        <li>
                            <div class="view">
                                <button class="star"></button>
                                <input class="toggle" type="checkbox">
                                <label>doing</label>
                                <button class="destroy"></button>
                            </div>    
                        </li>
                        <li>
                            <div class="view">
                                <button class="star"></button>
                                <input class="toggle" type="checkbox">
                                <label>doing</label>
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