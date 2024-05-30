<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>掲示板詳細画面</title>
<style>
	html {
	background-color: #f0f8ff;
	}
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
  	border: 2px solid #BE4CB5;  /* 枠線 */
  	 border-radius: 0.67em;   /* 角丸 */
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
    .s3{
    font-size: 200%;
    border-bottom: 10px dashed #DEFFCA;
    }
    
    .d5{
	width: 150px;
    padding: 10px;
    padding: 10px;
    font-size: 100%;
 	background-color: #6666FF;
	color: white;
	border: none;
	text-align: center;
	margin: 5px;
    }
    .d6{
	width: 150px;
    padding: 10px;
    padding: 10px;
    font-size: 100%;
 	background-color:  #4CAF50;
	color: white;
	border: none;
	text-align: center;
	margin: 5px;
    }
	.s2{
		
	border-bottom: 10px dashed #BE4CB5;
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

<h2><div class="s3">掲示板詳細画面</div></h2>
<jsp:useBean id="board" scope="request" class="model.entity.BoardBean"/>
<h2><div class="font-f1">Medi<span class="c1">✙</span>h</div></h2>
<div class="d2">
<table border="1">
	<tr><th>No</th><td><jsp:getProperty name="board" property="board_id"/></td></tr>
	<tr><th>更新日時</th><td><jsp:getProperty name="board" property="update_datetime"/></td></tr>
	<tr><th>従業員ID</th><td><jsp:getProperty name="board" property="employee_id"/></td></tr>
	
</table>
</div>
<br>
		<div class="d3">
		<p> <span class="s2">タイトル： <%= board.getTitle() %></span>
        <input type="hidden" name="title" value="<%= board.getTitle() %>">
        </p></div>

		<div class="d3">内容</div>
	 <p>      
        <textarea readonly type="hidden" name="content"><%= board.getContent() %></textarea>
        </p>
	
	<div class="d4">
	<form action="boarddelete" method="POST">
	<input type="hidden" name="board_id" value="<%= board.getBoard_id() %>">
		<input type="submit" value="削除"class="d5">
	</form>
	

	<form action="boardlist" method="POST">
		<input type="submit" value="メニューへ戻る"class="d6">
	</form>
	</div>
	
</body>
</html>