<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.entity.EmployeeBean"%>

<!DOCTYPE html>
<html>
<head>
<title>従業員情報変更確認</title>
<style>
body {
	text-align: center;
}
</style>
</head>
<body>
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
			勤続時間帯:
			<%= emp.getTime() %>
			<input type="hidden" name="time" value="<%= emp.getTime() %>">
		</p>
		<p>
			
			<input type="hidden" name="password" value="<%= emp.getPassword() %>">
		</p>
		<p>
			<input type="submit" value="変更確定">
		</p>
	</form>
	
	<FORM>
	<INPUT type="button" value="キャンセル" onClick="history.back()">
	</FORM>

	
	<%
    } else {
    %>
	<p>従業員情報が見つかりません。</p>
	<%
    }
    %>
</body>
</html>
