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

.button-submit {
	display: inline-block;
	padding: 10px 20px;
	font-size: 16px;
	cursor: pointer;
	border-radius: 5px;
	background-color: #4CAF50;
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

html {
	background-color: #f0f8ff;
}

body {
	text-align: center;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th {
	background-color: #f2f2f2;
}

th, td {
	border: 1px solid black;
	padding: 8px;
	text-align: left;
}

.s1 form {
	display: inline-block;
	margin: 0 10px;
}

.d3 {
	font-size: 300%;
	border-bottom: 10px dashed #DEFFCA;
}

.d4 {
	margin-left: 1150px;
}

.d5 {
	width: 150px;
	padding: 10px;
	padding: 10px;
	font-size: 100%;
}

.f1 {
	position: absolute;
	top: 50px;
	right: 40px;
}
</style>
</head>
<body>
	<%
	EmployeeBean emp = (EmployeeBean) session.getAttribute("employee");
	%>

	<h2>
		<div class="d3">掲示板</div>
	</h2>
	<div class="s1">
		<form action="userlist" method="post">
			<input type="submit" value="従業員一覧" class="button-submit"></span>
		</form>

		<form action="board-write.jsp" method="post">
			<input type="submit" value="新規書き込み" class="button-submit">
		</form>
	</div>

	<form action="BoardDetailServlet" method="post">
		<input type="hidden" name="title">
	</form>

	<div class="f1">
		<form action="logout" method="post">
			<input type="submit" value="ログアウト" class="button-submit2">
		</form>
	</div>


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
