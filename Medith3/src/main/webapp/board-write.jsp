<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>掲示板新規書き込み入力</title>
<style>
	body {
		text-align:center
	}
	table {
		margin:auto
	}
	.one{
	
	}
</style>
</head>
<body>
	<h2>掲示板新規書き込み</h2><br>
	<form action="boardwrite" method="post">
	<table border="1">
		<tr><th>No</th><td></td></tr>
		<tr><th>更新日時</th><td></td></tr>
		<tr><th>従業員ID</th><td></td></tr>
	
	</table>
	<br>
	<table border="1">
		<tr><th>タイトル</th></tr>
		<tr><td><input type="text" name="title"></td></tr>
		<tr><th>内容</th></tr>
		<tr><td><input type="text" name="content"></td></tr>
	</table>
		<input type="submit" value="登録する">
	</form>
</body>
</html>