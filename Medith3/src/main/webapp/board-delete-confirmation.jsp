<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.entity.BoardBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>本当に削除しますか？</title>
</head>
<body>
    
	
	<!-- リクエストスコープに入れたデータを持ってくる(nullは略) -->
    <%
    BoardBean board = (BoardBean) request.getAttribute("board");
    if (board != null) {
    %>
    <h2>本当に削除しますか？</h2>
    <p>以下の掲示板情報を本当に削除してよろしいですか？</p>
    <p>No: <%= board.getBoard_id() %></p>
    <p>従業員ID: <%= board.getEmployee_id() %></p>
    <p>更新日時: <%= board.getUpdate_datetime() %></p>
    <p>タイトル: <%= board.getTitle() %></p>
    <p>内容: <%= board.getContent() %></p>

	<!-- 削除したデータの情報を表示と削除のために、従業員IDをhiddenでこっそり持っていく -->
    <form action="boarddeletefinal" method="post">
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
