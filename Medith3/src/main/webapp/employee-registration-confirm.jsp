<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="model.entity.EmployeeBean"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>従業員登録確認</title>
</head>
<body>
<h2>従業員登録確認画面</h2>

 <%
    EmployeeBean emp = (EmployeeBean) request.getAttribute("employee");
    %>
    <form action="CompleteRegistrationEmployeeservlett" method="post">
        <p>
            従業員ID: <%= emp.getEmployee_id() %>
        <input type="hidden" name="employee_id" value="<%= emp.getEmployee_id() %>">
        </p>
        <p>
            名前: <%= emp.getName() %>
            <input type="hidden" name="name" value="<%= emp.getName() %>">
        </p>
        <p>
            性別: <%= emp.getGender() %>
            <input type="hidden" name="gender" value="<%= emp.getGender() %>">
        </p>
        <p>
            年齢: <%= emp.getAge() %>
            <input type="hidden" name="age" value="<%= emp.getAge() %>">
        </p>
        <p>
            勤続年数: <%= emp.getYear() %>
            <input type="hidden" name="year" value="<%= emp.getYear() %>">
        </p>
        <p>
            勤続時間帯: <%= emp.getTime() %>
            <input type="hidden" name="time" value="<%= emp.getTime() %>">
        </p>
         <p>
            部署名: <%= emp.getSection_id() %>
            <input type="hidden" name="section_id" value="<%= emp.getSection_id() %>">
        </p>
        <p>
            役職名: <%= emp.getPosition_id() %>
            <input type="hidden" name="position_id" value="<%= emp.getPosition_id() %>">
        </p>
        <p>
            <input type="hidden" name="password" value="<%= emp.getPassword() %>">
        </p>
        <p>
            <input type="submit" value="登録確定">
        </p>
<form action="EmployeeRegistrationServlet" method="post">

<input type="submit" value="戻る">
</form>
</body>
</html>