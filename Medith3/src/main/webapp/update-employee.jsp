<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="model.entity.EmployeeBean" %>

<!DOCTYPE html>
<html>
<head>
<title>従業員情報変更</title>
<style>
	body {
		text-align: center;
	}
</style>
</head>
<body>
    <h2>従業員情報変更</h2>

    <%
    EmployeeBean emp = (EmployeeBean) request.getAttribute("employee");
    if (emp != null) {
    %>
    <form action="SubmitUpdateEmployeeServlet" method="post">
        <input type="hidden" name="employee_id" value="<%= emp.getEmployee_id() %>">
        <p>
            名前: <input type="text" name="name" value="<%= emp.getName() %>">
        </p>
        <p>
            役職名:
            <select name="position_name">
                <option value="院長" <%= "院長".equals(emp.getPosition_name()) ? "selected" : "" %>>院長</option>
                <option value="副院長" <%= "副院長".equals(emp.getPosition_name()) ? "selected" : "" %>>副院長</option>
                <option value="部門長" <%= "部門長".equals(emp.getPosition_name()) ? "selected" : "" %>>部門長</option>
                <option value="事務部長" <%= "事務部長".equals(emp.getPosition_name()) ? "selected" : "" %>>事務部長</option>
                <option value="医長" <%= "医長".equals(emp.getPosition_name()) ? "selected" : "" %>>医長</option>
                <option value="部長" <%= "部長".equals(emp.getPosition_name()) ? "selected" : "" %>>部長</option>
                <option value="課長" <%= "課長".equals(emp.getPosition_name()) ? "selected" : "" %>>課長</option>
                <option value="室長" <%= "室長".equals(emp.getPosition_name()) ? "selected" : "" %>>室長</option>
                <option value="主任" <%= "主任".equals(emp.getPosition_name()) ? "selected" : "" %>>主任</option>
                <option value="センター長" <%= "センター長".equals(emp.getPosition_name()) ? "selected" : "" %>>センター長</option>
                <option value="看護師" <%= "看護師".equals(emp.getPosition_name()) ? "selected" : "" %>>看護師</option>
                <option value="医師" <%= "医師".equals(emp.getPosition_name()) ? "selected" : "" %>>医師</option>
                <option value="臨床検査技師" <%= "臨床検査技師".equals(emp.getPosition_name()) ? "selected" : "" %>>臨床検査技師</option>
            </select>
        </p>
        <p>
            部署名:
            <select name="section_name">
                <option value="内科" <%= "内科".equals(emp.getSection_name()) ? "selected" : "" %>>内科</option>
                <option value="外科" <%= "外科".equals(emp.getSection_name()) ? "selected" : "" %>>外科</option>
                <option value="救急科" <%= "救急科".equals(emp.getSection_name()) ? "selected" : "" %>>救急科</option>
                <option value="産婦人科" <%= "産婦人科".equals(emp.getSection_name()) ? "selected" : "" %>>産婦人科</option>
                <option value="眼科" <%= "眼科".equals(emp.getSection_name()) ? "selected" : "" %>>眼科</option>
                <option value="小児科" <%= "小児科".equals(emp.getSection_name()) ? "selected" : "" %>>小児科</option>
                <option value="皮膚科" <%= "皮膚科".equals(emp.getSection_name()) ? "selected" : "" %>>皮膚科</option>
                <option value="看護部" <%= "看護部".equals(emp.getSection_name()) ? "selected" : "" %>>看護部</option>
                <option value="予防医療センター" <%= "予防医療センター".equals(emp.getSection_name()) ? "selected" : "" %>>予防医療センター</option>
                <option value="薬剤部" <%= "薬剤部".equals(emp.getSection_name()) ? "selected" : "" %>>薬剤部</option>
                <option value="臨床検査科" <%= "臨床検査科".equals(emp.getSection_name()) ? "selected" : "" %>>臨床検査科</option>
            </select>
        </p>
        <p>
            性別:
            <select name="gender">
                <option value="男" <%= "男".equals(emp.getGender()) ? "selected" : "" %>>男</option>
                <option value="女" <%= "女".equals(emp.getGender()) ? "selected" : "" %>>女</option>
                <option value="その他" <%= "その他".equals(emp.getGender()) ? "selected" : "" %>>その他</option>
            </select>
        </p>
        <p>
            年齢:
            <select name="age">
                <% for (int i = 1; i <= 100; i++) { %>
                    <option value="<%= i %>" <%= (i == emp.getAge()) ? "selected" : "" %>><%= i %></option>
                <% } %>
            </select>
        </p>
        <p>
            勤続年数:
            <select name="year">
                <% for (int i = 1; i <= 70; i++) { %>
                    <option value="<%= i %>" <%= (i == Integer.parseInt(emp.getYear())) ? "selected" : "" %>><%= i %></option>
                <% } %>
            </select>
        </p>
        <p>
            勤続時間帯:
            <select name="time">
                <option value="朝" <%= "朝".equals(emp.getTime()) ? "selected" : "" %>>朝</option>
                <option value="夜" <%= "夜".equals(emp.getTime()) ? "selected" : "" %>>夜</option>
                <option value="不在" <%= "不在".equals(emp.getTime()) ? "selected" : "" %>>不在</option>
            </select>
        </p>
        <p>
            パスワード: <input type="text" name="password" value="<%= emp.getPassword() %>">
        </p>
        <p>
            <input type="submit" value="更新">
        </p>
    </form>
    <%
    } else {
    %>
    <p>従業員情報が見つかりません。</p>
    <%
    }
    %>
</body>
</html>
