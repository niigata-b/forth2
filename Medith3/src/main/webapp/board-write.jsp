<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="model.entity.EmployeeBean"%>
<%@ page import="model.entity.BoardBean"%>
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
<%
    EmployeeBean emp = (EmployeeBean) session.getAttribute("employee");

%>
	<h2>掲示板新規書き込み</h2><br>
	<form action="boardwrite" method="post">
	
	<table border="1">
		<tr><th>従業員ID</th><td><%= emp.getEmployee_id() %></td></tr>
	<input type="hidden" name="employee_id" value="<%= emp.getEmployee_id() %>">
	</table>
	<br>
	<table border="1">
		<tr><th>タイトル</th></tr>
		<tr><td><input type="text" name="title" required></td></tr>
		<tr><th>内容</th></tr>
		<tr><td><input type="text" size="200" name="content"></td></tr>
	</table>
		<input type="submit" value="登録する">
	</form>
	
	<form action="boardlist" method="post">
		<input type="submit" value="戻る">
	</form>
</body>
</html>