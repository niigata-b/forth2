<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.entity.EmployeeBean"%>

<!DOCTYPE html>
<html>
<head>
<title>従業員情報変更</title>

<style>
.button-submit1 {
	display: inline-block;
	padding: 10px 20px;
	font-size: 16px;
	cursor: pointer;
	border-radius: 5px;
	background-color: #FF3333;
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
	background-color: #6666FF; /* 赤色 */
	color: white;
	border: none;
	text-align: center;
	margin: 5px;
}

.container {
	max-width: 600px;
	max-height: 700px;
	margin: 0 auto;
	background: #fff;
	padding: 10px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

html {
	background-color: #f0f8ff;
}

body {
	text-align: center;
	font-family: Arial, sans-serif;
}

h2 {
	font-size: 2em;
	margin-bottom: 20px;
}

form {
	display: inline-block;
	text-align: left;
}

form p {
	margin: 30px 0;
}


input[type="submit"], button {
	width: 100px;
	height: 40px;
	font-size: 1em;
	margin-top: 20px;
}

.form-inline {
	display: inline-block;
}

label {
	font-weight: bold; /* 太文字にする */
}
</style>
</head>
<body>
 <div class="container">
	<h2>従業員情報変更</h2>

	<%
	EmployeeBean emp = (EmployeeBean) request.getAttribute("employee");
	if (emp != null) {
	%>
	<form action="SubmitUpdateEmployeeServlet" method="post">
		<input type="hidden" name="employee_id"
			value="<%=emp.getEmployee_id()%>">
		<p>

			<label for="name">名前:　　　 </label> <input type="text" id="name"
				name="name" maxlength="12" value="<%=emp.getName()%>"
				pattern=".*\S+.*" required placeholder="入力してください">

		</p>
		<p>
			<label for="position_name">役職名:　　 </label> <select id="position_name"
				name="position_name">
				<option value="院長"
					<%="院長".equals(emp.getPosition_name()) ? "selected" : ""%>>院長</option>
				<option value="副院長"
					<%="副院長".equals(emp.getPosition_name()) ? "selected" : ""%>>副院長</option>
				<option value="部門長"
					<%="部門長".equals(emp.getPosition_name()) ? "selected" : ""%>>部門長</option>
				<option value="事務部長"
					<%="事務部長".equals(emp.getPosition_name()) ? "selected" : ""%>>事務部長</option>
				<option value="医長"
					<%="医長".equals(emp.getPosition_name()) ? "selected" : ""%>>医長</option>
				<option value="部長"
					<%="部長".equals(emp.getPosition_name()) ? "selected" : ""%>>部長</option>
				<option value="課長"
					<%="課長".equals(emp.getPosition_name()) ? "selected" : ""%>>課長</option>
				<option value="室長"
					<%="室長".equals(emp.getPosition_name()) ? "selected" : ""%>>室長</option>
				<option value="主任"
					<%="主任".equals(emp.getPosition_name()) ? "selected" : ""%>>主任</option>
				<option value="センター長"
					<%="センター長".equals(emp.getPosition_name()) ? "selected" : ""%>>センター長</option>
				<option value="看護師"
					<%="看護師".equals(emp.getPosition_name()) ? "selected" : ""%>>看護師</option>
				<option value="医師"
					<%="医師".equals(emp.getPosition_name()) ? "selected" : ""%>>医師</option>
				<option value="臨床検査技師"
					<%="臨床検査技師".equals(emp.getPosition_name()) ? "selected" : ""%>>臨床検査技師</option>
			</select>
		</p>
		<p>
			<label for="section_name">部署名:　　 </label> <select id="section_name"
				name="section_name">
				<option value="内科"
					<%="内科".equals(emp.getSection_name()) ? "selected" : ""%>>内科</option>
				<option value="外科"
					<%="外科".equals(emp.getSection_name()) ? "selected" : ""%>>外科</option>
				<option value="救急科"
					<%="救急科".equals(emp.getSection_name()) ? "selected" : ""%>>救急科</option>
				<option value="産婦人科"
					<%="産婦人科".equals(emp.getSection_name()) ? "selected" : ""%>>産婦人科</option>
				<option value="眼科"
					<%="眼科".equals(emp.getSection_name()) ? "selected" : ""%>>眼科</option>
				<option value="小児科"
					<%="小児科".equals(emp.getSection_name()) ? "selected" : ""%>>小児科</option>
				<option value="皮膚科"
					<%="皮膚科".equals(emp.getSection_name()) ? "selected" : ""%>>皮膚科</option>
				<option value="看護部"
					<%="看護部".equals(emp.getSection_name()) ? "selected" : ""%>>看護部</option>
				<option value="予防医療センター"
					<%="予防医療センター".equals(emp.getSection_name()) ? "selected" : ""%>>予防医療センター</option>
				<option value="薬剤部"
					<%="薬剤部".equals(emp.getSection_name()) ? "selected" : ""%>>薬剤部</option>
				<option value="臨床検査科"
					<%="臨床検査科".equals(emp.getSection_name()) ? "selected" : ""%>>臨床検査科</option>
			</select>
		</p>
		<p>
			<label for="gender">性別:　　　 </label> <select id="gender" name="gender">
				<option value="男" <%="男".equals(emp.getGender()) ? "selected" : ""%>>男</option>
				<option value="女" <%="女".equals(emp.getGender()) ? "selected" : ""%>>女</option>
				<option value="その他"
					<%="その他".equals(emp.getGender()) ? "selected" : ""%>>その他</option>
			</select>
		</p>
		<p>
			<label for="age">年齢:　　　 </label> <select id="age" name="age">
				<%
				for (int i = 1; i <= 100; i++) {
				%>
				<option value="<%=i%>" <%=(i == emp.getAge()) ? "selected" : ""%>><%=i%></option>
				<%
				}
				%>
			</select>
		</p>
		<p>
			<label for="year">勤続年数:　 </label> <select id="year" name="year">
				<%
				for (int i = 1; i <= 70; i++) {
				%>
				<option value="<%=i%>"
					<%=(i == Integer.parseInt(emp.getYear())) ? "selected" : ""%>><%=i%></option>
				<%
				}
				%>
			</select>
		</p>
		<p>
			<label for="time">勤続時間帯:</label> <select id="time" name="time">
				<option value="朝" <%="朝".equals(emp.getTime()) ? "selected" : ""%>>朝</option>
				<option value="夜" <%="夜".equals(emp.getTime()) ? "selected" : ""%>>夜</option>
				<option value="不在" <%="不在".equals(emp.getTime()) ? "selected" : ""%>>不在</option>
			</select>
		</p>
		<p>
			<label for="password">パスワード:</label> <input type="password"
				id="input_pass" name="password" minlength="9" maxlength="32"
				value="<%=emp.getPassword()%>" pattern="^[a-zA-Z0-9]+$" required
				placeholder="※半角英数で入力"> <input type="button"
				id="buttonPassword" value="表示" onclick="pushHideButton();">
			<script language="javascript">
      function pushHideButton() {
        var txtPass = document.getElementById("input_pass");
        var btnPass = document.getElementById("buttonPassword");
        if (txtPass.type === "text") {
          txtPass.type = "password";
          btnPass.value = "表示";
        } else {
          txtPass.type = "text";
          btnPass.value = "非表示";
        }
      }
    </script>
		</p>
		<p>
			<input type="submit" value="更新" class="button-submit1">
		</p>
		<p>
			<input type="hidden" name="update_datetime"
				value="<%=emp.getUpdate_datetime()%>">
		</p>
	</form>
	<form action="userlist" method="post">
		<button type="submit" class="button-submit2">戻る</button>
	</form>

	<%
	} else {
	%>
	<p>従業員情報が見つかりません。</p>
	<%
	}
	%>
	<script language="javascript">
      function pushHideButton() {
        var txtPass = document.getElementById(“input_pass”);
        var btnPass = document.getElementById(“buttonPassword”);
        if (txtPass.type === “text”) {
          txtPass.type = “password”;
          btnPass.value = “表示”;
        } else {
          txtPass.type = “text”;
          btnPass.value = “非表示”;
        }
      }
</script>
</div>
</body>
</html>
