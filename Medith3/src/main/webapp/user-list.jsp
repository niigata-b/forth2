<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.entity.EmployeeBean" %>

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
            名前: <input type="text" name="name">
            役職: <input type="text" name="position">
            部署: <input type="text" name="section">
            <button type="submit">検索</button>
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
                <th>操作</th>
            </tr>
            <%
            for (EmployeeBean emp : empList) {
            %>
            <tr>
                <td><%= emp.getEmployee_id() %></td>
                <td><%= emp.getPosition_name() %></td>
                <td><%= emp.getSection_name() %></td>
                <td><%= emp.getName() %></td>
                <td><%= emp.getGender() %></td>
                <td><%= emp.getAge() %></td>
                <td><%= emp.getYear() %></td>
                <td><%= emp.getTime() %></td>
                <td>
                    <form action="UpdateEmployeeServlet" method="post" style="display:inline;">
                        <input type="hidden" name="employee_id" value="<%= emp.getEmployee_id() %>">
                        <input type="submit" value="変更">
                    </form>
                    <form action="DeleteEmployeeConfirmServlet" method="post" style="display:inline;">
                        <input type="hidden" name="employee_id" value="<%= emp.getEmployee_id() %>">
                        <input type="submit" value="削除">
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
    <a href="menu-servlet">メニューに戻る</a>
</body>
</html>
