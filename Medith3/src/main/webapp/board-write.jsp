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
	html {
	background-color: #f0f8ff;
	}
	body {
		text-align:center
	}
	table {
		margin:auto
	}
	.one{
	
	}
	
	.example form {
	
	display: inline-block;
	margin: 0 10px;	

}
	
	textarea {
	 width: 500px;  /* 幅を固定 */
  	height: 200px; /* 高さを固定 */
  	resize: none;  /* リサイズを無効にする */
  	font-size: 150%;
  	
  	whit-space: nomal;
	}
	
	.d1{
	width:30%;
    min-width: 200px;
    max-width: 600px;
    padding: 10px;
    font-size: 100%;
    }
	
	
	.d2{
	
    font-size: 150%;
 	/*background-color: blue;
 	text-align: center;
	 padding: 4px;
 	color: white;*/
    }
	
	.d3{
	width: 150px;
    padding: 10px;
    padding: 10px;
    font-size: 100%;
 	background-color: #6666FF;
	color: white;
	border: none;
	text-align: center;
	margin: 5px;
    }
	.d4 {
	font-size: 200%;
	border-bottom: 10px dashed #DEFFCA;
	}
	
	.d5{
	width: 150px;
    padding: 10px;
    padding: 10px;
    font-size: 100%;
 	background-color: #f44336;
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
</head>
<body>
<%
    EmployeeBean emp = (EmployeeBean) session.getAttribute("employee");

%>
	<h2><div class="font-f1">Medi<span class="c1">✙</span>h</div></h2>
	
	<h2><div class="d4">掲示板新規書き込み</div></h2><br>
	<form action="boardwrite" method="post">
	
	<div class="s1">
	<table border="1">
		<tr><th>従業員ID</th><td><%= emp.getEmployee_id() %></td></tr>
	<input type="hidden" name="employee_id" value="<%= emp.getEmployee_id() %>">
	</table>
	<br>
	
	
	<div class="d2">タイトル</div>
		<input type="text" name="title" pattern=".*\S+.*" maxlength="20" required class="d1"><br><br>
		
	<div class="d2">内容</div>
	<p><textarea name="content" maxlength="200" cols="90" rows="70"></textarea></p>
		
	<div class="example">
		<input type="submit" value="登録する"class="d3">
	</form>
	
	<form action="boardlist" method="post">
		<input type="submit" value="戻る" class="d5">
	</form>
	</div>
	
	</div>

</body>
</html>