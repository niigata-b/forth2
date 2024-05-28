<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>削除完了</title>
</head>
<body>
    <h2>削除完了</h2>

	<!--リクエストスコープのデータを持ってくる(nullは略)  -->
    <%
    BoardBean board = (BoardBean) request.getAttribute("board");
    if (board != null) {
    %>
    <p>以下の従業員情報を本当に削除してよろしいですか？</p>
    <p>No: <%= board.getBoard_id() %></p>
    <p>従業員ID: <%= board.getEmployee_id() %></p>
    <p>更新日時: <%= board.getUpdate_datetime() %></p>
    <p>タイトル: <%= board.getTitle() %></p>
    <p>内容: <%= board.getContent() %></p>

    <form action="boardlist" method="post">
        <button type="submit">メニューに戻る</button>
    </form>
    <%
    } else {
    %>
    <p>従業員情報が見つかりませんでした。</p>
    <form action="boardlist" method="post">
        <button type="submit">メニューに戻る</button>
    </form>
    <%
    }
    %>
</body>
</html>