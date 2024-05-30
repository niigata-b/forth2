<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
<head>
<title>ログアウト画面</title>
<style>
.example {
	text-align: center;
	margin-top: 50px;
}

.d1 {
	padding: 10px 20px;
	font-size: 16px;
	cursor: pointer;
	border-radius: 5px;
	border: none;
	color: white;
	background-color: #4CAF50;
	margin: 5px;
}

.d1:hover {
	background-color: #45a049;
}
</style>
</head>
<body>
	<div class="example">
		<h1>
			<span class="s1">ログアウト画面</span>
		</h1>
		<h2>ログアウトしますか。</h2>
		<br>
		<form action="TimeServlet" method="POST">
			<label for="time">勤務時間帯:</label> <select id="time" name="time">
				<option value="日勤">日勤</option>
				<option value="準夜勤">準夜勤</option>
				<option value="深夜勤">深夜勤</option>
				<option value="不在">不在</option>
			</select> <br>
			<br> <input type="submit" value="ログアウト" class="d1">
		</form>
		<form action="boardlist" method="POST">
			<input type="submit" value="戻る" class="d1">
		</form>
	</div>
</body>
</html>
