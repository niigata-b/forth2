<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>従業員登録</title>
</head>
<body>
<h2>従業員登録画面</h2>
<form action="employee-registration-confirm.jsp" method="post">
<input type="text" name="employee_id"><br>

<input type="text" name="name"><br>

<select name="gender">
<option value="男">男</option>
<option value="女">女</option>
<option value="その他">その他</option>
</select><br>

<select name="name">
			<%
				for (int i = 1; i >= 99; i--) {
			%>
			<option value=<%="i年"%>>
				<%=i年%>
			</option>
			<%
				}
			%>
		</select><br>
 <select name="time">
<option value="朝">朝</option>
<option value="夜">夜</option>
<option value="不在">不在</option>
</select><br>

<select name="example">
<option value="外科">外科</option>
<option value="内科">内科</option>
<option value="救急科">救急科</option>
<option value="産婦人科">産婦人科</option>
<option value="眼科">眼科</option>
<option value="小児科">小児科</option>
<option value="皮膚科">皮膚科</option>
<option value="看護部">看護部</option>
<option value="予防医療センター">予防医療センター</option>
<option value="薬剤部">薬剤部</option>
<option value="臨床検査科">臨床検査科</option>
</select><br>

<select name="position">
<option value="院長">院長</option>
<option value="副院長">副院長</option>
<option value="部門長">部門長</option>
<option value="事務部長">事務部長</option>
<option value="看護部長">看護部長</option>
<option value="医長">医長</option>
<option value="部長">部長</option>
<option value="課長">課長</option>
<option value="室長">室長</option>
<option value="主任">主任</option>
<option value="センター長">センター長</option>
<option value="看護師">看護師</option>
<option value="医師">医師</option>
<option value="臨床検査技師">臨床検査技師</option>
</select><br>

<input type="password" name="password"><br>

<input type="submit" value="登録">
</form>

<form action="EmployeeListServlet" method="post">
<input type="submit" value="戻る">
</form>
</body>
</html>