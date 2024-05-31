<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>エラーです</title>
<style>
html{
	background-color: #f0f8ff;
}
body {
	text-align: center;
}
.d1{
	width: 150px;
    	padding: 10px;
    	padding: 10px;
    	font-size: 100%;
    	
    	box-shadow: 3px 3px 3px gray;
    }
.font-color{
	font-size:150%;
	color:#FF0000;
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
<h2><div class="font-f1">Medi<span class="c1">✙</span>h</div></h2>

	<h1><span class="font-color">エラーです</span></h1>
	
	<form action="boardlist" method="post">
	<input type="submit" value="メニューへ戻る"class="d1">
</form>
</body>
</html>