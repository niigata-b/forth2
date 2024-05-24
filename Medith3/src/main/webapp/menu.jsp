<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>メニュー+掲示板</title>
</head>
<body>

<form action="EmployeeListServlet" method="post">

<input type="submit" value="従業員一覧">

</form>

<form action="logout.jsp" method="post">

<input type="submit" value="ログアウト">

</form><br>

<h2>掲示板</h2>

<form action="BoardDetailServlet" method="post">

<input type="link" name="title">

</form>

<form action="board-write.jsp" method="post">

<input type="submit" value="新規書き込み">

</form><br>

<table border="1">
<tr><th>No</th><th>タイトル</th><th>内容</th><th>更新日時</th></tr>



</table>

</body>
</html>