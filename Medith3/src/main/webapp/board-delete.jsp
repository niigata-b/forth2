<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="model.entity.BoardBean" %>

<!DOCTYPE html>
<html>
<head>
<title>削除確認</title>
<style>
	html {
	background-color: #f0f8ff;
	}
	body {
		text-align:center
	}
	textarea {
	 width: 500px;  /* 幅を固定 */
  	height: 200px; /* 高さを固定 */
  	resize: none;  /* リサイズを無効にする */
  	font-size: 150%;
	}
	.d2{
    font-size: 100%;
    }
	 .d3{
    font-size: 150%;
    }
    .d4 form {
	
	display: inline-block;
	margin: 0 10px;	

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
    <h2>削除確認</h2>

    <%
    BoardBean board = (BoardBean) request.getAttribute("board");
    if (board != null) {
    %>
     <div class="d2">
    <p>以下の従業員情報を削除します。よろしいですか？</p>
    <p>No: <%= board.getBoard_id() %></p>
    <p>従業員ID: <%= board.getEmployee_id() %></p>
    <p>更新日時: <%= board.getUpdate_datetime() %></p></div>
     <div class="d3"><p>タイトル: <%= board.getTitle() %></p> </div>
    <div class="d3">内容</div>
	 <p>      
        <textarea readonly type="hidden" name="content"><%= board.getContent() %></textarea>
        </p>
   	<div class="d4">
    <form action="boarddeleteconf" method="post">
        <input type="hidden" name="board_id" value="<%= board.getBoard_id() %>">
        <input type="submit" value="削除"class="d5">
    </form>
    
    <form action="boardlist" method="post">
        <input type="submit" value="キャンセル"class="d5">
    </form></div>
    <%
    } else {
    %>
    <p>掲示板情報が見つかりません。</p>
    <form action="boardlist" method="post">
        <button type="submit">メニューに戻る</button>
    </form>
    <%
    }
    %>
</body>
</html>
