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
	
	textarea {
	 width: 500px;  /* 幅を固定 */
  	height: 200px; /* 高さを固定 */
  	resize: none;  /* リサイズを無効にする */
  	font-size: 150%;
	}
	
</style>	

</head>
<body>

 <div class="s1">
  
  <h2>書き込み確認画面</h2>

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
            タイトル： <%= board.getTitle() %>
        <input type="hidden" name="title" value="<%= board.getTitle() %>">
        </p>
        
        <table 
        <p>
            内容： 
        <textarea readonly type="hidden" name="content"><%= board.getContent() %></textarea>
        </p>
       
         <input type="submit" value="確定">
       
	</form>
	

	<FORM>
	<INPUT type="button" value="キャンセル" onClick="history.back()">
	</FORM>


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