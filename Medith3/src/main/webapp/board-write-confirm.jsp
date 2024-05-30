<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="model.entity.BoardBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>書き込み確認画面</title>
<style>
.s1{
    text-align: center;  
	}
	.s2{
		
	border-bottom: 10px dashed #BE4CB5
	}
	
	html {
	background-color: #f0f8ff;
	}
	
	textarea {
	 width: 500px;  /* 幅を固定 */
  	height: 200px; /* 高さを固定 */
  	resize: none;  /* リサイズを無効にする */
  	font-size: 150%;
  	
  	 border-radius: 0.67em;   /* 角丸 */
	}
	
	.d2{
	
    font-size: 150%;
 	/*background-color: blue;
 	text-align: center;
	 padding: 4px;
 	color: white;*/
    }
	.d3 form {
	
	display: inline-block;
	margin: 0 10px;	
	}
	.d4{
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
    .d5 {
	font-size: 200%;
	border-bottom: 10px dashed #DEFFCA;
	}
	.d6{
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

 <div class="s1">
  <h2><div class="font-f1">Medi<span class="c1">✙</span>h</div></h2>
  
  <h2><div class="d5">書き込み確認画面</div></h2>

 <%
    BoardBean board = (BoardBean) request.getAttribute("board");
 	if (board != null) {
  %>
  
  
    <form action="boardwriteconf" method="post">
        <p>
            従業員ID: <%= board.getEmployee_id() %>
        <input type="hidden" name="employee_id" value="<%= board.getEmployee_id() %>">
        </p>
        <div class="d2"><p>
         <span class="s2">タイトル：<%= board.getTitle() %></span>
        <input type="hidden" name="title" value="<%= board.getTitle() %>">
        </p></div>
        
       <div class="d2">内容</div>
        <p>
        <textarea readonly type="hidden" name="content"><%= board.getContent() %></textarea>
        </p>
       
       <div class="d3">
         <input type="submit" value="確定"class="d4">
       
	</form>
	

	<FORM>
	<INPUT type="button" value="キャンセル" onClick="history.back()"class="d6">
	</FORM>
	</div>

	<%
    } else {
    %>
	<p>従業員情報が見つかりません。</p>
	<%
    }
    %>
	
	</div>
	
</body>
</html>