<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>掲示板詳細画面</title>
<style>
	body {
		text-align:center
	}
	table {
		margin:auto
	}
	.one{
	
	}
	
	textarea {
	 width: 500px;  /* 幅を固定 */
  	height: 200px; /* 高さを固定 */
  	resize: none;  /* リサイズを無効にする */
  	font-size: 150%;
	}
	
	.d4 form {
	
	display: inline-block;
	margin: 0 10px;	

}
	
	.d2{
    font-size: 100%;
    }
    .d3{
    font-size: 150%;
    }
    
    .d5{
	width: 150px;
    padding: 10px;
    padding: 10px;
    font-size: 100%;
 	/*background-color: blue;
 	text-align: center;
	 padding: 4px;
 	color: white;*/
    }
	
</style>
</head>
<body>
<h2>掲示板詳細画面</h2>
<jsp:useBean id="board" scope="request" class="model.entity.BoardBean"/>

<div class="d2">
<table border="1">
	<tr><th>No</th><td><jsp:getProperty name="board" property="board_id"/></td></tr>
	<tr><th>更新日時</th><td><jsp:getProperty name="board" property="update_datetime"/></td></tr>
	<tr><th>従業員ID</th><td><jsp:getProperty name="board" property="employee_id"/></td></tr>
	
</table>
</div>
<br>
		<div class="d3">
		<p>
            タイトル： <%= board.getTitle() %>
        <input type="hidden" name="title" value="<%= board.getTitle() %>">
        </p></div>

	 <p>
             
        <textarea readonly type="hidden" name="content"><%= board.getContent() %></textarea>
        </p>
	
	<div class="d4">
	<form action="boarddelete" method="POST">
	<input type="hidden" name="board_id" value="<%= board.getBoard_id() %>">
		<input type="submit" value="削除"class="d5">
	</form>
	

	<form action="boardlist" method="POST">
		<input type="submit" value="メニューへ戻る"class="d5">
	</form>
	</div>
	
</body>
</html>