<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<title>変更完了</title>
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
.button-submit2 {
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
.container {
	max-width: 600px;
	margin: 0 auto;
	background: #fff;
	padding: 20px;
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
h2 {
	font-size: 2em;
	margin-bottom: 20px;
}

p {
	margin: 30px 0;
	font-size: 25px;
	font-weight : bold;
}

input[type="submit"],
button {
	width: 100px;
	height: 40px;
	font-size: 1em;
	margin-top: 20px;
}
</style>
</head>
<body>
    <div class="container">
    <h2>変更完了</h2>
    <p>従業員情報の変更が完了しました。</p>
    <form action="userlist" method="post">
        <button type="submit" class ="button-submit2">戻る</button>
    </form>
        </div>
</body>
</html>
