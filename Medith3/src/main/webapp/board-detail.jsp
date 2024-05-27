<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>掲示板詳細画面</title>
<style>
	body {
		text-align:center
	}
	table {
		margin:auto
	}
</style>
</head>
<body>
<h2>掲示板詳細画面</h2>
<jsp:useBean id="board" scope="request" class="model.entity.BoardBean"/>

<table border="1">
	<tr><th>No</th><td><jsp:getProperty name="board" property="board_id"/></td></tr>
	<tr><th>更新日時</th><td><jsp:getProperty name="board" property="update_datetime"/></td></tr>
	<tr><th>従業員ID</th><td><jsp:getProperty name="board" property="employee_id"/></td></tr>
	<tr><th>タイトル</th><td><jsp:getProperty name="board" property="title"/></td></tr>
	<tr><th>内容</th><td><jsp:getProperty name="board" property="content"/></td></tr>
</table>

	<form action="boardlist" method="POST">
		<input type="submit" value="メニューへ戻る">
	</form>
	
	
</body>
</html>