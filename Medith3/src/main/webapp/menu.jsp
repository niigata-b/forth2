<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="model.entity.EmployeeBean"%>
<%@ page import="java.util.List"%>
<%@ page import="model.entity.BoardBean"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>メニュー+掲示板</title>
<style>
.table {
	overflow-y: auto;
	max-height: 450px;
}

body {
	text-align: center;
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

form {
	display: inline-block;
	margin: 0 10px;
	padding: 30px;
}
</style>
</head>
<body>
	<%
	EmployeeBean emp = (EmployeeBean) session.getAttribute("employee");
	%>
	<div class="botan">
		<form action="userlist" method="post">
			<input type="submit" value="従業員一覧">
		</form>

		<form action="logout" method="post">
			<input type="submit" value="ログアウト">
		</form>
		<br>
	</div>

	<h2>掲示板</h2>
	</form>
	<form action="BoardDetailServlet" method="post">
		<input type="hidden" name="title">
	</form>

	<form action="board-write.jsp" method="post">
		<input type="submit" value="新規書き込み">　　　　　　　　　　　　　　　　　
	</form>
	<br>

	<%
	List<BoardBean> boardList = (List<BoardBean>) request.getAttribute("boardList");
	%>
	<div class="table">
		<table>
			<tr>
				<th>No</th>
				<th>タイトル</th>
				<th>内容</th>
				<th>更新日時</th>
			</tr>
			<%
			if (boardList != null) {
				for (BoardBean board : boardList) {
			%>
			<tr>
				<td><%=board.getBoard_id()%></td>
				<td><a href="boarddetail?board_id=<%=board.getBoard_id()%>"><%=board.getTitle()%></a></td>
				<td><%=board.getContent()%></td>
				<td><%=board.getUpdate_datetime()%></td>
			</tr>
			<%
			}
			}
			%>
		</table>
	</div>
</body>
</html>
