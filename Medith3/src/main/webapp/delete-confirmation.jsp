<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="model.entity.EmployeeBean" %>

<!DOCTYPE html>
<html>
<head>
<title>本当に削除しますか？</title>
</head>
<body>
    <h2>本当に削除しますか？</h2>
	
	<!-- リクエストスコープに入れたデータを持ってくる(nullは略) -->
    <%
    EmployeeBean emp = (EmployeeBean) request.getAttribute("employee");
    if (emp != null) {
    %>
    <p>以下の従業員情報を本当に削除してよろしいですか？</p>
    <p>従業員ID: <%= emp.getEmployee_id() %></p>
    <p>役職名: <%= emp.getPosition_name() %></p>
    <p>部署名: <%= emp.getSection_name() %></p>
    <p>名前: <%= emp.getName() %></p>
    <p>性別: <%= emp.getGender() %></p>
    <p>年齢: <%= emp.getAge() %></p>
    <p>勤続年数: <%= emp.getYear() %></p>
    <p>勤続時間帯: <%= emp.getTime() %></p>

	<!-- 削除したデータの情報を表示と削除のために、従業員IDをhiddenでこっそり持っていく -->
    <form action="DeleteEmployeeFinalServlet" method="post">
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
