<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="model.entity.EmployeeBean"%>

<!DOCTYPE html>
<html>
<head>
<title>従業員一覧</title>
<style>
.table-wrapper {
	overflow-y: auto;
	max-height: 500px;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	border: 1px solid black;
	padding: 8px;
	text-align: left;
}

th {
	background-color: #f2f2f2;
}
</style>
</head>
<body>
	<h2>従業員一覧</h2>

	<form method="post" action="userlist">
		<p>
			名前: <input type="text" name="name"> 役職: <select
				name="position_name">
				<option value="">選択してください</option>
				<option value="院長">院長</option>
				<option value="副院長">副院長</option>
				<option value="部門長">部門長</option>
				<option value="事務部長">事務部長</option>
				<option value="医長">医長</option>
				<option value="部長">部長</option>
				<option value="課長">課長</option>
				<option value="室長">室長</option>
				<option value="主任">主任</option>
				<option value="センター長">センター長</option>
				<option value="看護師">看護師</option>
				<option value="医師">医師</option>
				<option value="臨床検査技師">臨床検査技師</option>
			</select> 部署: <select name="section_name">
				<option value="">選択してください</option>
				<option value="内科">内科</option>
				<option value="外科">外科</option>
				<option value="救急科">救急科</option>
				<option value="産婦人科">産婦人科</option>
				<option value="眼科">眼科</option>
				<option value="小児科">小児科</option>
				<option value="皮膚科">皮膚科</option>
				<option value="看護部">看護部</option>
				<option value="予防医療センター">予防医療センター</option>
				<option value="薬剤部">薬剤部</option>
				<option value="臨床検査科">臨床検査科</option>
			</select>
			<button type="submit">検索</button>
			<input type="submit" value="クリア">
		</p>
	</form>

	<%
	List<EmployeeBean> empList = (List<EmployeeBean>) request.getAttribute("empList");

	if (empList != null && !empList.isEmpty()) {
	%>
	<div class="table-wrapper">
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
				<th>更新時間</th>
				<th>操作</th>
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
				<td><%=emp.getUpdate_datetime()%></td>

				<td>
					<form action="UpdateEmployeeServlet" method="post"
						style="display: inline;">
						<input type="hidden" name="employee_id"
							value="<%=emp.getEmployee_id()%>"> <input type="submit"
							value="変更">
					</form>
					<form action="DeleteEmployeeConfirmServlet" method="post"
						style="display: inline;">
						<input type="hidden" name="employee_id"
							value="<%=emp.getEmployee_id()%>"> <input type="submit"
							value="削除">
					</form>
				</td>
			</tr>
			<%
			}
			%>
		</table>
	</div>
	<%
	} else {
	%>
	<p>従業員情報がありません。</p>
	<%
	}
	%>
	<form action="boardlist" method="POST">
		<input type="submit" value="メニュー表示">
	</form>
</body>
</html>
