<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
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
</style>
<meta charset="UTF-8">

<title>登録エラー画面</title>
</head>
<body>
	<div class="container">
		<h2>登録エラー画面</h2>

		<p>その従業員IDはすでに使われています。</p>


		<input type="submit" value="戻る" onClick="history.back()">
	</div>
</body>
</html>