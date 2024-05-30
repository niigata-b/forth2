<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.entity.EmployeeBean"%>

<!DOCTYPE html>
<html>
<head>
<title>従業員情報変更確認</title>
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
form {
	display: inline-block;
	text-align: left;
}
form p {
	margin: 30px 0;
	font-weight : bold ;
	
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
	<h2>従業員情報変更確認</h2>

	<%
    EmployeeBean emp = (EmployeeBean) request.getAttribute("employee");
    if (emp != null) {
    %>
	<form action="CompleteUpdateEmployeeServlet" method="post">
		<input type="hidden" name="employee_id"
			value="<%= emp.getEmployee_id() %>">
		<p>
			名前:　　　
			<%= emp.getName() %>
			<input type="hidden" name="name" value="<%= emp.getName() %>">
		</p>
		<p>
			役職名:　　
			<%= emp.getPosition_name() %>
			<input type="hidden" name="position_name"
				value="<%= emp.getPosition_name() %>">
		</p>
		<p>
			部署名:　　
			<%= emp.getSection_name() %>
			<input type="hidden" name="section_name"
				value="<%= emp.getSection_name() %>">
		</p>
		<p>
			性別:　　　
			<%= emp.getGender() %>
			<input type="hidden" name="gender" value="<%= emp.getGender() %>">
		</p>
		<p>
			年齢:　　　
			<%= emp.getAge() %>
			<input type="hidden" name="age" value="<%= emp.getAge() %>">
		</p>
		<p>
			勤続年数:　
			<%= emp.getYear() %>
			<input type="hidden" name="year" value="<%= emp.getYear() %>">
		</p>
		<p>
			勤務時間帯:
			<%= emp.getTime() %>
			<input type="hidden" name="time" value="<%= emp.getTime() %>">
		</p>
		<p>
			
			<input type="hidden" name="password" value="<%= emp.getPassword() %>">
		</p>
		<p>
			<input type="submit" value="変更確定" class="button-submit1">
		</p>
	</form>
	
	<FORM>
	<INPUT type="button" value="戻る" onClick="history.back()" class="button-submit2">
	</FORM>

	
	<%
    } else {
    %>
	<p>従業員情報が見つかりません。</p>
	<%
    }
    %>
</div>
</body>
</html>
