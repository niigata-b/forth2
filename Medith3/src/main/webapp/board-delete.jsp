<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="model.entity.BoardBean" %>

<!DOCTYPE html>
<html>
<head>
<title>削除確認</title>
</head>
<body>
    <h2>削除確認</h2>

    <%
    BoardBean board = (BoardBean) request.getAttribute("board");
    if (board != null) {
    %>
    <p>以下の従業員情報を削除します。よろしいですか？</p>
    <p>No: <%= board.getBoard_id() %></p>
    <p>従業員ID: <%= board.getEmployee_id() %></p>
    <p>更新日時: <%= board.getUpdate_datetime() %></p>
    <p>タイトル: <%= board.getTitle() %></p>
    <p>内容: <%= board.getContent() %></p>
   	
    <form action="boarddeleteconf" method="post">
        <input type="hidden" name="board_id" value="<%= board.getBoard_id() %>">
        <input type="submit" value="削除">
    </form>
    
    <form action="boardlist" method="post">
        <button type="submit">キャンセル</button>
    </form>
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
