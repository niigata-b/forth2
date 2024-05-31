<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="model.entity.EmployeeBean"%>
<%@ page import="javax.servlet.http.HttpSession"%>

<!DOCTYPE html>
<html>
<head>
<title>従業員一覧</title>
<!--overflow-yは、縦にはみ出た部分の表示方法を指定する。（autoはブラウザー依存）（一般的にはスクロール)-->

<style>
/*新規登録ボタンの配置*/
.InsertButton {
	position: absolute;
	top: 260px;
	right: 60px;
}
/*メニューボタンの配置*/
.MenuButton {
	position: absolute;
	top: 20px;
	right: 30px;
	
}

/* テーブル全体のスクロール設定 */
.table {
	overflow-y: auto;
	max-height: 330px;
}

/*後ろの色*/
html{
	background-color: #f0f8ff;
}
/* テーブルの基本設定 */
table {
	width: 100%;
	border-collapse: collapse;
	
}
/* テーブルヘッダーとデータセルのスタイル */
th, td {
	border: 1px solid black;
	padding: 8px;
	text-align: left;
}

/* テーブルヘッダーの背景色 */
th {
	background-color: #f2f2f2;
}

/* ボタンフォームのスタイル */
.button-form {
	display: inline-block;
	text-align: 10px;
}
/* ボタンの基本スタイル */
/* 変更、削除 */
.button-submit5 {
	display: inline-block;
	padding: 10px 20px ;
	font-size: 16px;
	cursor: pointer;
	border-radius: 5px;
	background-color: #4CAF50;
	color: white;
	border: none;
	text-align: center;
	margin: 5px;
}

/* ボタンの基本スタイル */
/* 新規登録 */
.button-submit {
	display: inline-block;
	padding: 10px 20px;
	font-size: 16px;
	cursor: pointer;
	border-radius: 5px;
	background-color: #4CAF50;
	color: white;
	border: none;
	text-align: center;
	margin: 5px;
}

/* ボタンの基本スタイル */
/* メニューに戻る */
.button-submit2 {
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
/* ボタンの基本スタイル */
/* 検索とクリア */
.button-submit3 {
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

/* ボタンのホバー効果 */
.button-submit:hover {
	background-color: #45a049;
}

/* 検索フォームの余白設定 */
.search-form {
	margin-bottom: 20px;
}

/* 入力フィールドと選択フィールドのスタイル */
.input-field, .select-field {
	padding: 10px;
	margin: 5px;
	font-size: 16px;
	border: 1px solid #ccc;
	border-radius: 5px;
	width: 180px;
}

/* ページタイトルのスタイル */
.page-title {
	text-align: center;
	font-size: 40px;
	color: #333;
	margin-bottom: 20px;
	font-weight: bold;
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
</style>
</head>
<body>
	<h2><div class="font-f1">Medi<span class="c1">✙</span>h</div></h2>
	
	<h2 class="page-title">従業員一覧</h2>


	<form method="post" action="userlist" class="search-form">
		<p>
			従業員ID: <input type="text" name="employee_id" class="input-field" maxlength="5" pattern="^[a-zA-Z0-9]+$" title="半角英数字で入力してください" placeholder="※半角英数字で入力">

			　　名前: <input type="text" name="name" class="input-field"  maxlength="12"> 
			　　役職: <select name="position_name" class="select-field">
				<option value="">選択してください</option>
				<option value="院長">院長</option>
				<option value="副院長">副院長</option>
				<option value="部門長">部門長</option>
				<option value="事務部長">事務部長</option>
				<option value="医長">医長</option>
				<option value="部長">部長</option>
				<option value="課長">課長</option>
				<option value="室長">室長</option>
				<option value="主任">主任</option>
				<option value="センター長">センター長</option>
				<option value="看護師">看護師</option>
				<option value="医師">医師</option>
				<option value="臨床検査技師">臨床検査技師</option>
			</select> 　　部署: <select name="section_name" class="select-field">
				<option value="">選択してください</option>
				<option value="内科">内科</option>
				<option value="外科">外科</option>
				<option value="救急科">救急科</option>
				<option value="産婦人科">産婦人科</option>
				<option value="眼科">眼科</option>
				<option value="小児科">小児科</option>
				<option value="皮膚科">皮膚科</option>
				<option value="看護部">看護部</option>
				<option value="予防医療センター">予防医療センター</option>
				<option value="薬剤部">薬剤部</option>
				<option value="臨床検査科">臨床検査科</option>
			</select> 　　勤務時間帯: <select name="time" class="select-field">
				<option value="">選択してください</option>
				<option value="日勤">日勤</option>
				<option value="準夜勤">準夜勤</option>
				<option value="深夜勤">深夜勤</option>
				<option value="不在">不在</option>
			</select> <br> 　　性別: <select name="gender" class="select-field">
				<option value="">選択してください</option>
				<option value="男">男</option>
				<option value="女">女</option>
				<option value="その他">その他</option>
			</select>　　　 <input type="submit" value="検索+クリア" class="button-submit3"> 

		</p>
	</form>

	<%-- 検索条件を表示 --%>

	<p style="margin-bottom: 20px; font-size: 20px;">●検索条件:</p>
	<div style="margin-bottom: 20px; font-size: 30px;">

		従業員ID: <span style="margin-right: 20px; color: #005AFF; font-weight:bold;"> <%= request.getAttribute("employee_id") != null ? request.getAttribute("employee_id") : " " %>
			<%-- request.getAttribute("name") が null でなければその値を表示し、null であれば " " と表示 --%>

		</span> 名前: <span style="margin-right: 20px; color: #005AFF; font-weight:bold;"> <%= request.getAttribute("name") != null ? request.getAttribute("name") : " " %>
			<%-- request.getAttribute("name") が null でなければその値を表示し、null であれば " " と表示 --%>

		</span> 役職: <span style="margin-right: 20px; color: #FF4B00; font-weight:bold;"> <%= request.getAttribute("position_name") != null ? request.getAttribute("position_name") : " " %>
			<%-- request.getAttribute("position_name") が null でなければその値を表示し、null であれば " " と表示 --%>

		</span> 部署: <span style="margin-right: 20px; color: #FF4B00; font-weight:bold;"> <%= request.getAttribute("section_name") != null ? request.getAttribute("section_name") : " " %>
			<%-- request.getAttribute("section_name") が null でなければその値を表示し、null であれば " " と表示 --%>

		</span> 勤務時間帯: <span style="margin-right: 20px; color: #4CAF50; font-weight:bold;"> <%= request.getAttribute("time") != null ? request.getAttribute("time") : " " %>
			<%-- request.getAttribute("time") が null でなければその値を表示し、null であれば " " と表示 --%>

		</span> 性別: <span style="margin-right: 20px; color: #4CAF50; font-weight:bold;"> <%= request.getAttribute("gender") != null ? request.getAttribute("gender") : " " %>
			<%-- request.getAttribute("gender") が null でなければその値を表示し、null であれば " " と表示 --%>
		</span>
	</div>

	<!-- セッション情報、従業員情報を取得する。 -->
	<!-- セッション情報で、従業員IDがSから始まるならばisAdminがTrueになる -->
	<%
    // セッションから "employee" 属性を取得し、EmployeeBean 型にキャストして empSession に代入
    EmployeeBean empSession = (EmployeeBean) session.getAttribute("employee");
    
    // リクエストから "empList" 属性を取得し、List<EmployeeBean> 型にキャストして empList に代入
    List<EmployeeBean> empList = (List<EmployeeBean>) request.getAttribute("empList");
    
    // empSession が null でなく、かつ employee_id が "S" で始まるかを判定し、isAdmin に結果を代入
    // boolean型なので、結果はTrueかFalse
    boolean isAdmin = empSession != null && empSession.getEmployee_id().startsWith("S");

    // empList が null でなく、かつ空でない場合に処理を続行
    if (empList != null && !empList.isEmpty()) {
%>

	<div class="table">
		<table>
			<tr>
				<th style="text-align: center;">従業員ID</th>
				<th style="text-align: center;">役職名</th>
				<th style="text-align: center;">部署名</th>
				<th style="text-align: center;">名前</th>
				<th style="text-align: center;">性別</th>
				<th style="text-align: center;">年齢</th>
				<th style="text-align: center;">勤続年数</th>
				<th style="text-align: center;">勤務時間帯</th>
				<th style="text-align: center;">更新時間</th>
				<th style="text-align: center;">操作</th>
			</tr>
			<%
                for (EmployeeBean emp : empList) {
            %>
			<tr>
				<td style="text-align: center;"><%= emp.getEmployee_id() %></td>
				<td style="text-align: center;"><%= emp.getPosition_name() %></td>
				<td style="text-align: center;"><%= emp.getSection_name() %></td>
				<td style="text-align: center;"><%= emp.getName() %></td>
				<td style="text-align: center;"><%= emp.getGender() %></td>
				<td style="text-align: center;"><%= emp.getAge() %></td>
				<td style="text-align: center;"><%= emp.getYear() %></td>
				<td style="text-align: center;"><%= emp.getTime() %></td>
				<td style="text-align: center;"><%= emp.getUpdate_datetime() %></td>
				<td style="text-align: center;">
					<% if (isAdmin) { %>
					<form action="UpdateEmployeeServlet" method="post"
						style="display: inline-block;" >
						<input type="hidden" name="employee_id"
							value="<%= emp.getEmployee_id() %>"> <input type="submit"
							value="変更" class="button-submit5">
					</form>
					<form action="DeleteEmployeeConfirmServlet" method="post"
						style="display: inline-block;">
						<input type="hidden" name="employee_id"
							value="<%= emp.getEmployee_id() %>"> <input type="submit"
							value="削除" class="button-submit5">
					</form> <% } %>
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

	<div class="InsertButton">
		<% if (isAdmin) { %>
		<form action="employee-registration.jsp" method="POST" class="button-form">
			<input type="submit" value="新規登録" class="button-submit">
		</form>
		<% } %>
	</div>
	<div class="MenuButton">
		<form action="boardlist" method="POST" class="button-form">
			<input type="submit" value="メニューに戻る" class="button-submit2">
		</form>
	</div>
</body>
</html>
