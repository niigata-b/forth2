<!DOCTYPE html>
<html>
<head>
<title>従業員一覧</title>
</head>
<body>
	<h2>従業員一覧</h2>
	<form action="search-user" method="get">
		<label for="position_name">役職:</label> <input type="text"
			id="position_name" name="position_name"> <label
			for="section_name">部署:</label> <input type="text"
			id="section_name" name="section_name"> <label for="name">名前:</label>
		<input type="text" id="name" name="name"> <input type="submit"
			value="Search">
	</form>
	<%
		List<UserBean> userList = (List<UserBean>) request.getAttribute("userList");

		if (userList.size() != 0) {
	%>
	<h3>従業員一覧</h3>

	<table>
		<tr>
			<th>従業員ID</th>
			<th>役職名</th>
			<th>部署名</th>
			<th>名前</th>
			<th>性別</th>
			<th>年齢</th>
			<th>勤続年数</th>
			<th>勤続時間帯</th>
		</tr>
	<%
			for (EmployeeBean emp : empList) {
	%>
		<tr>
			<td><%=emp.getEmployee_id()%></td>
			<td><%=emp.getPosition_name()%></td>
			<td><%=emp.getSection_name()%></td>
			<td><%=emp.getName()%></td>
			<td><%=emp.getGender()%></td>
			<td><%=emp.getAge()%></td>
			<td><%=emp.getYear()%></td>
			<td><%=emp.getTime()%></td>
		</tr>
	<%
			}
	%>
		</table>
	<%
		} else {
	%>
	従業員情報がありません。<br>
	<%
		}
	%>
	
	<a href="menu-servlet">メニューに戻る</a>
	
</body>
</html>
