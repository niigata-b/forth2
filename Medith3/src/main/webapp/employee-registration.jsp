<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 従業員登録画面 -->
<!-- Ctrl + Shift + Sを押すと、表示がおかしくなるので、押さないでください -->
<!DOCTYPE html>
<html>
<head>
<script>
	let btn_passview = document.getElementById("btn_passview");
	let input_pass = document.getElementById("input_pass");

	btn_passview.addEventListener("click", (e)=>{

		e.preventDefault();

		if( input_pass.type === 'password' ) {

			input_pass.type = 'text';
			btn_passview.textContent = '非表示';

		} else {

			input_pass.type = 'password';
			btn_passview.textContent = '表示';
		}
	});

});
	</script>
<meta charset="UTF-8">
<title>従業員登録</title>
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
	margin: -20px;
}

.container {
	max-width: 700px;
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
	margin: 23px 0;
	font-weight: bold;
}

input[type="submit"] {
	display: inline-block;
	padding: 10px 20px;
	font-size: 16px;
	cursor: pointer;
	border-radius: 5px;
	background-color: #6666FF;
	color: white;
	border: none;
	text-align: center;
	margin: 5px;
}
/*label {
	display: inline-block;
	width: 100px;
	text-align:left;
} */
</style>
</head>
<body>
	<div class="container">
		<h2>従業員登録画面</h2>
		<form action="EmployeeRegistrationServlet" method="post">
			<p>
				※IDは１文字目がE（一般ユーザ）かS（管理者ユーザ）のみで２文字目以降は数字のみ<br>
				<lable>従業員ID:　</lable> <input
					type="text" name="employee_id" maxlength="5" pattern="^[ES][0-9]+$"
					required placeholder="※半角英数で入力">
			</p>

			<p>
			<lable>名前:　　　</lable> <input type="text" name="name" maxlength="12" pattern=".*\S+.*"
					required placeholder="入力してください">
			</p>
			<p>
				<label>役職名:　　</label> <select name="position_id">
					<option value="Y001">院長</option>
					<option value="Y002">副院長</option>
					<option value="Y003">部門長</option>
					<option value="Y004">事務部長</option>
					<option value="Y005">医長</option>
					<option value="Y006">部長</option>
					<option value="Y007">課長</option>
					<option value="Y008">室長</option>
					<option value="Y009">主任</option>
					<option value="Y010">センター長</option>
					<option value="Y011">看護師</option>
					<option value="Y012">医師</option>
					<option value="Y013">臨床検査技師</option>
				</select>

			</p>
			<p>
				<label>部署名:　　</label> <select name="section_id">
					<option value="B001">外科</option>
					<option value="B002">内科</option>
					<option value="B003">救急科</option>
					<option value="B004">産婦人科</option>
					<option value="B005">眼科</option>
					<option value="B006">小児科</option>
					<option value="B007">皮膚科</option>
					<option value="B008">看護部</option>
					<option value="B009">予防医療センター</option>
					<option value="B010">薬剤部</option>
					<option value="B011">臨床検査科</option>
				</select>
			</p>
			<p>
				<label>性別:　　　</label> <select name="gender">
					<option value="男">男</option>
					<option value="女">女</option>
					<option value="その他">その他</option>
				</select>
			</p>

			<p>
				<lable>年齢:　　　</lable> <select name="age">
					<%
					for (int i = 18; i <= 99; i++) {
					%>
					<option value=<%=i%>>
						<%=i%>歳
					</option>
					<%
					}
					%>
				</select>
			</p>

			<p>
				<label>勤続年数:　</label> <select name="year">
					<%
					for (int i = 1; i <= 99; i++) {
					%>
					<option value=<%=i%>>
						<%=i%>年
					</option>
					<%
					}
					%>
				</select>
			</p>

			<p>
				<label>勤続時間帯:</label> <select name="time">
					<option value="朝">朝</option>
					<option value="夜">夜</option>
					<option value="不在">不在</option>
				</select>
			</p>
			<p>
				<label>パスワード:</label> <input type="password" id="input_pass" name="password"
					minlength="9" maxlength="32" pattern="^[a-zA-Z0-9]+$" required
					placeholder="※半角英数で入力" class="soroeru"> <input
					type="button" id="buttonPassword" value="表示"
					onclick="pushHideButton();">
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
			<input type="submit" value="登録">

		</form>
		<form action="userlist" method="post">
			<button type="submit" class="button-submit1">戻る</button>
		</form>
	</div>
</body>
</html>