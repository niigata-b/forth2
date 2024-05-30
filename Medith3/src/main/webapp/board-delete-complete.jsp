<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="model.entity.BoardBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>削除完了</title>
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
	.d3{
    font-size: 150%;
    }
	 .d5{
	width: 150px;
    padding: 10px;
    padding: 10px;
    font-size: 100%;
 	background-color: #4CAF50;
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
    
    <!--リクエストスコープのデータを持ってくる(nullは略)  -->
    <%
    BoardBean board = (BoardBean) request.getAttribute("board");
    if (board != null) {
    %>
    <h2><div class="font-f1">Medi<span class="c1">✙</span>h</div></h2>
    
    <h2><div class="d6">削除完了</div></h2>
    No: <%= board.getBoard_id() %><br>
    <p>従業員ID: <%= board.getEmployee_id() %></p>
    <p>更新日時: <%= board.getUpdate_datetime() %></p>
     <div class="d3"><p><span class="s2">タイトル: <%= board.getTitle() %></span></p></div>
    <div class="d3">内容</div>
        
        <textarea readonly type="hidden" name="content"><%= board.getContent() %></textarea>
        

    <form action="boardlist" method="post">
       <input type="submit" value="メニューに戻る"class="d5">
    </form>
    <%
    } else {
    %>
    <p>掲示板情報が見つかりませんでした。</p>
    <form action="boardlist" method="post">
        <input type="submit" value="メニューに戻る"class="d5">
    </form>
    <%
    }
    %>
</body>
</html>
