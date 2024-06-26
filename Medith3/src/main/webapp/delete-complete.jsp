<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.entity.EmployeeBean"%>

<!DOCTYPE html>
<html>
<head>
<title>削除完了</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 20px;
	background-color: #f0f8ff; /* 背景色の設定 */
	text-align: center;
}

h2 {
	color: #333;
	font-weight: bold; /* 太文字 */
	text-align: center;
}

.container {
	max-width: 600px;
	margin: 0 auto;
	background: #fff;
	padding: 40px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	text-align: left; /* コンテナ内のテキストを左揃え */
}

p {
	font-size: 16px;
	margin: 30px 0;
	font-weight: bold; /* 太文字 */
}

.button-group {
	display: flex;
	justify-content: space-between;
	margin-top: 20px; /* ボタンの上にスペースを追加 */
}

.button-group form {
	margin: 0;
}

.button-submit {
	padding: 10px 20px;
	font-size: 16px;
	cursor: pointer;
	border-radius: 5px;
	border: none;
	color: white;
	background-color: #4CAF50;
	text-align: center;

}

.button-submit2 {
	padding: 10px 20px;
	font-size: 16px;
	cursor: pointer;
	border-radius: 5px;
	border: none;
	color: white;
	background-color: #4CAF50;
	text-align: center;

}

.button-cancel {
	padding: 10px 20px;
	font-size: 16px;
	cursor: pointer;
	border-radius: 5px;
	border: none;
	color: white;
	background-color: #f44336;
	text-align: center;
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
	.font-size{
		font-size:150%;
		font-weight:120%;
		text-align: center;
	}
	.f-size{
		font-size:100%;
		font-weight:120%;
		}
	label {
		display: inline-block;
		width: 150px;
		vertical-align: top;
		
	}
</style>
</head>
<body>
<h2><div class="font-f1">Medi<span class="c1">✙</span>h</div></h2>

	<div class="container">
		<h2>削除完了</h2>

		<!--リクエストスコープのデータを持ってくる(nullは略)  -->
		<%
    EmployeeBean emp = (EmployeeBean) request.getAttribute("employee");
    if (emp != null) {
    %>
		<div class="font-size">以下の従業員情報が削除されました。</div><br><br>
		<span class="f-size"> <label for="employee_id">従業員ID: </label><%= emp.getEmployee_id() %><br><br>
            <label for="position_name">役職名: </label><%= emp.getPosition_name() %><br><br>
            <label for="section_name">部署名: </label><%= emp.getSection_name() %><br><br>
            <label for="name">名前: </label><%= emp.getName() %><br><br>
            <label for="gender">性別: </label><%= emp.getGender() %><br><br>
            <label for="age">年齢: </label><%= emp.getAge() %><br><br>
            <label for="year">勤続年数: </label><%= emp.getYear() %><br><br>
            <label for="time">勤続時間帯: </label><%= emp.getTime() %><br><br></span>

		<form action="userlist" method="post">
			<button type="submit" class="button-submit">従業員一覧に戻る</button>
		</form>
		<%
    } else {
    %>
		<p style="color: #FF3333;">従業員情報が見つかりませんでした。</p>
		<form action="userlist" method="post">
			<button type="submit" class="button-submit2">従業員一覧に戻る</button>
		</form>
		<%
    }
    %>
	</div>
</body>
</html>
