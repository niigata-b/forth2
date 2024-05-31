<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="model.entity.EmployeeBean" %>

<!DOCTYPE html>
<html>
<head>
<title>削除確認</title>
<style>
    body {
    	text-align: center;
        font-family: Arial, sans-serif;
        margin: 20px;
        background-color: #f0f8ff; /* 背景色の設定 */
    }
    h2 {
        color: #333;
        text-align: center;
        font-weight: bold; /* 太文字 */
    }
    .container {
        max-width: 600px;
        margin: 0 auto;
        background: #fff;
        padding: 20px;
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
	.font-color{
		font-size: 130%;
		color: #FF0000;
	}
	.f-size{
		font-size:110%;
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
        <h2>削除確認</h2>

        <% EmployeeBean emp = (EmployeeBean) request.getAttribute("employee");
        if (emp != null) { %>
            <p><span class="font-color">以下の従業員情報を削除します。よろしいですか？</span></p>
           <span class="f-size"> <label for="employee_id">従業員ID: </label><%= emp.getEmployee_id() %><br><br>
            <label for="position_name">役職名: </label><%= emp.getPosition_name() %><br><br>
            <label for="section_name">部署名: </label><%= emp.getSection_name() %><br><br>
            <label for="name">名前: </label><%= emp.getName() %><br><br>
            <label for="gender">性別: </label><%= emp.getGender() %><br><br>
            <label for="age">年齢: </label><%= emp.getAge() %><br><br>
            <label for="year">勤続年数: </label><%= emp.getYear() %><br><br>
            <label for="time">勤続時間帯: </label><%= emp.getTime() %><br><br></span>

            <div class="button-group">
                <form action="deleteemployeefservlet" method="post">
                    <input type="hidden" name="employee_id" value="<%= emp.getEmployee_id() %>">
                    <input type="submit" value="削除" class="button-submit">
                </form>
                
                <form action="userlist" method="post">
                    <button type="submit" class="button-cancel">キャンセル</button>
                </form>
            </div>
        <% } else { %>
            <p>従業員情報が見つかりません。</p>
            <form action="userlist" method="post">
                <button type="submit" class="button-cancel">従業員一覧に戻る</button>
            </form>
        <% } %>
    </div>
</body>
</html>
