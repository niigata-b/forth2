<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.entity.BoardBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>本当に削除しますか？</title>
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
  	border: 2px solid #BE4CB5;  /* 枠線 */
  	 border-radius: 0.67em;   /* 角丸 */
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
 	background-color: #6666FF;
	color: white;
	border: none;
	text-align: center;
	margin: 5px;
    }
     .d6 {
	font-size: 150%;
	border-bottom: 10px dashed #DEFFCA;
	}
	.s2{
		border-bottom: 10px dashed #BE4CB5
	}
	.font-color{
		
		color: #FF0000;
	}
	.font-size{
		font-size: 120%;
		
	}
	.d7{
	width: 150px;
    padding: 10px;
    padding: 10px;
    font-size: 100%;
 	background-color: #f44336;
	color: white;
	border: none;
	text-align: center;
	margin: 5px;
    }
	
	</style>
</head>
<body>
    
	
	<!-- リクエストスコープに入れたデータを持ってくる(nullは略) -->
    <%
    BoardBean board = (BoardBean) request.getAttribute("board");
    if (board != null) {
    %>
    
    <h2><div class="d6"><span class="font-color">本当に削除しますか？</span></div></h2>
    <div class="d2">
    <p><span class="font-size">以下の掲示板情報を本当に削除してよろしいですか？</span></p>
     <p>No: <%= board.getBoard_id() %></p>
    <p>従業員ID: <%= board.getEmployee_id() %></p>
    <p>更新日時: <%= board.getUpdate_datetime() %></p></div>
     <div class="d3"><p><span class="s2">タイトル: <%= board.getTitle() %></span></p></div>
    <div class="d3">内容</div>
	 <p>      
        <textarea readonly type="hidden" name="content"><%= board.getContent() %></textarea>
        </p>
	
	<div class="d4">
	<!-- 削除したデータの情報を表示と削除のために、従業員IDをhiddenでこっそり持っていく -->
    <form action="boarddeletefinal" method="post">
        <input type="hidden" name="board_id" value="<%= board.getBoard_id() %>">
        <input type="submit" value="削除"class="d5">
    </form>
    <form action="boardlist" method="post">
       <input type="submit" value="キャンセル"class="d7">
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
