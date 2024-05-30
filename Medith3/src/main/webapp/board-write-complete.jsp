<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>書き込み完了画面</title>

<style>
	html {
	background-color: #f0f8ff;
	}
	body {
		text-align:center	
		
	}
	
	.d1{
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
     .d2 {
	font-size: 150%;
	border-bottom: 10px dashed #DEFFCA;
	}
     .d3 {
	font-size: 150%;
	
	}
    .s1{
    	width: 400px;
		height: 300px;
		border-style: solid;
		border-color:#DEFFCA;
    }
   
</style>

</head>
<body>

<h2><div class="d2">書き込み完了</div></h2>
<h3><div class="d3">書きこみが完了しました。</div></h3>

<form action="boardlist" method="post">
	<input type="submit" value="メニューへ戻る"class="d1">
</form>

</body>
</html>