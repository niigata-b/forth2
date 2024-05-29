<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="model.entity.BoardBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>従業員登録確認画面</h2>

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
        <p>
            内容： <%= board.getContent() %>
        <input type="hidden" name="content" value="<%= board.getContent() %>">
        </p>
       
         <input type="submit" value="確定">
       
	</form>
	

<input type="submit" value="戻る" onClick="history.back()">


	<%
    } else {
    %>
	<p>従業員情報が見つかりません。</p>
	<%
    }
    %>

</body>
</html>