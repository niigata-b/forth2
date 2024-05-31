<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>この従業員データは削除できません</title>
<style>
body {
	text-align: center;
	background-color: #f0f8ff; /* 背景色の設定 */
}
h1{
	color: #FF3333;
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
</head>
<body>
	<h2><div class="font-f1">Medi<span class="c1">✙</span>h</div></h2>
	<h1>この従業員データは削除できません</h1>
	<form action="userlist" method="post">
		<input type="submit" value="従業員一覧画面に戻る">
	</form>
</body>
</html>