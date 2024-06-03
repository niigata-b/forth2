<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="model.entity.EmployeeBean"%>
<!DOCTYPE html>
<html>
<head>
<title>ログアウト画面</title>
<style>
html {
	background-color: #f0f8ff;
}

.example {
	text-align: center;
	margin-top: 50px;
}

.d1 {
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

.d3 {
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
	max-height: 700px;
	margin: 0 auto;
	background: #fff;
	padding: 10px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

select {
	font-size: 18px;
	padding: 10px;
	width: 200px;
	margin-bottom: 20px;
}

.font-f1 {
	font-family: serif;
	font-size: 150%;
	position: absolute;
	top: 20px;
	left: 40px;
}

.c1 {
	color: red;
}
</style>
</head>
<body>
	<h2>
		<div class="font-f1">
			Medi<span class="c1">✙</span>h
		</div>
	</h2>
	<div class="container">
		<div class="example">
			<h1>
				<span class="s1">ログアウト画面</span>
			</h1>
			<%
		    EmployeeBean emp = (EmployeeBean) session.getAttribute("employee");
		    
			%>
			<h2>ログアウトしますか。</h2>
			<br>

			<form action="TimeServlet" method="POST">
				<label for="time">勤務時間帯:</label> <select id="time" name="time">
					<option value="日勤"
						<%="日勤".equals(emp.getTime()) ? "selected" : ""%>>日勤</option>
					<option value="準夜勤"
						<%="準夜勤".equals(emp.getTime()) ? "selected" : ""%>>準夜勤</option>
					<option value="深夜勤"
						<%="深夜勤".equals(emp.getTime()) ? "selected" : ""%>>深夜勤</option>
					<option value="不在"
						<%="不在".equals(emp.getTime()) ? "selected" : ""%>>不在</option>

				</select> <br> <br> <input type="submit" value="ログアウト" class="d3"
					style="text-align: center;">
			</form>
			<form action="boardlist" method="POST">
				<input type="submit" value="戻る" class="d1"
					style="text-align: center;">
			</form>
		</div>
	</div>
</body>
</html>
