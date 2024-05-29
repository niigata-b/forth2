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
 	/*background-color: blue;
 	text-align: center;
	 padding: 4px;
 	color: white;*/
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

<h1>書き込み完了</h1>
<h2>書きこみが完了しました。</h2>

<form action="boardlist" method="post">
	<input type="submit" value="メニューへ戻る"class="d1">
</form>

</body>
</html>