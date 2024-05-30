<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="model.entity.EmployeeBean" %>

<!DOCTYPE html>
<html>
<head>
<title>削除確認</title>
<style>
    body {
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
</style>
</head>
<body>
    <div class="container">
        <h2>削除確認</h2>

        <% EmployeeBean emp = (EmployeeBean) request.getAttribute("employee");
        if (emp != null) { %>
            <p>以下の従業員情報を削除します。よろしいですか？</p>
            <p>従業員ID:　 <%= emp.getEmployee_id() %></p>
            <p>役職名:　　 <%= emp.getPosition_name() %></p>
            <p>部署名:　　 <%= emp.getSection_name() %></p>
            <p>名前:　　　 <%= emp.getName() %></p>
            <p>性別:　　　 <%= emp.getGender() %></p>
            <p>年齢:　　　 <%= emp.getAge() %></p>
            <p>勤続年数: 　<%= emp.getYear() %></p>
            <p>勤続時間帯: <%= emp.getTime() %></p>

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
