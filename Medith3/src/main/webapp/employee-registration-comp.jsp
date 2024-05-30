<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <!-- 従業員登録完了画面 -->
<html>
<head>
<style>
.button-submit1 {
	display: inline-block;
	padding: 10px 20px;
	font-size: 16px;
	cursor: pointer;
	border-radius: 5px;
	background-color: #FF3333;
	color: white;
	border: none;
	text-align: center;
	margin: 5px;
}


.container {
	max-width: 700px;
	margin: 0 auto;
	background: #fff;
	padding: 10px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

html {
	background-color: #f0f8ff;
}

body {
	text-align: center;
	font-family: Arial, sans-serif;
}

title {
	font-size: 2em;
	margin-bottom: 20px;
}

form {
	display: inline-block;
	text-align: left;
}

p {
	margin: 23px 0;
	font-weight: bold;
}

input[type="submit"] {
	display: inline-block;
	padding: 10px 20px;
	font-size: 16px;
	cursor: pointer;
	border-radius: 5px;
	background-color: #6666FF;
	color: white;
	border: none;
	text-align: center;
	margin: 5px;
}
.font-f1{
		font-family:serif;
		font-size:150%;
		position: absolute;
		top: 20px;
		left: 40px;
	}
.c1{
		color:red;
	}
</style>
<meta charset="UTF-8">
<title>登録完了画面</title>
</head>
<body>
<h2><div class="font-f1">Medi<span class="c1">✙</span>h</div></h2>

	<div class="container">
<h2>登録完了画面</h2>

<p>登録が完了しました。</p>

<form action="userlist" method="post">
        <input type="submit" value="一覧に戻る">
    </form>
</div>
</body>
</html>