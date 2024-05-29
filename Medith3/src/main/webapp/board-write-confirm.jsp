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
	
	html {
	background-color: #f0f8ff;
	}
	
	textarea {
	 width: 500px;  /* 幅を固定 */
  	height: 200px; /* 高さを固定 */
  	resize: none;  /* リサイズを無効にする */
  	font-size: 150%;
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
 	/*background-color: blue;
 	text-align: center;
	 padding: 4px;
 	color: white;*/
    }
    .d5 {
	font-size: 300%;
	border-bottom: 10px dashed #DEFFCA;
	}
</style>	

</head>
<body>

 <div class="s1">
  
  <h3><div class="d5">書き込み確認画面</div></h3>

 <%
    BoardBean board = (BoardBean) request.getAttribute("board");
 	if (board != null) {
  %>
  
  
    <form action="boardwriteconf" method="post">
        <p>
            従業員ID: <%= board.getEmployee_id() %>
        <input type="hidden" name="employee_id" value="<%= board.getEmployee_id() %>">
        </p>
        <p>
         <div class="d2">タイトル：<%= board.getTitle() %>
        <input type="hidden" name="title" value="<%= board.getTitle() %>"></div>
        </p>
        
       <div class="d2">内容</div>
        <p>
        <textarea readonly type="hidden" name="content"><%= board.getContent() %></textarea>
        </p>
       
       <div class="d3">
         <input type="submit" value="確定"class="d4">
       
	</form>
	

	<FORM>
	<INPUT type="button" value="キャンセル" onClick="history.back()"class="d4">
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