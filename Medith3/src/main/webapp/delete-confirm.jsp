<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="model.entity.EmployeeBean" %>

<!DOCTYPE html>
<html>
<head>
<title>削除確認</title>
</head>
<body>
    <h2>削除確認</h2>

    <%
    EmployeeBean emp = (EmployeeBean) request.getAttribute("employee");
    if (emp != null) {
    %>
    <p>以下の従業員情報を削除します。よろしいですか？</p>
    <p>従業員ID: <%= emp.getEmployee_id() %></p>
    <p>役職名: <%= emp.getPosition_name() %></p>
    <p>部署名: <%= emp.getSection_name() %></p>
    <p>名前: <%= emp.getName() %></p>
    <p>性別: <%= emp.getGender() %></p>
    <p>年齢: <%= emp.getAge() %></p>
    <p>勤続年数: <%= emp.getYear() %></p>
    <p>勤続時間帯: <%= emp.getTime() %></p>

    <form action="deleteemployeefservlet" method="post">
        <input type="hidden" name="employee_id" value="<%= emp.getEmployee_id() %>">
        <input type="submit" value="削除">
    </form>
    
    <form action="userlist" method="post">
        <button type="submit">キャンセル</button>
    </form>
    <%
    } else {
    %>
    <p>従業員情報が見つかりません。</p>
    <form action="userlist" method="post">
        <button type="submit">従業員一覧に戻る</button>
    </form>
    <%
    }
    %>
</body>
</html>
