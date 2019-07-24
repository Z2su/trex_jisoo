<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<form action="./form" method="post">
		상품명 : <input type='text' name='sndGoodname' value='바로셀로나' size='30'> </br>
		가격  : <input type='text' name='sndAmount' value='100' size='15' maxlength='9'> </br>
		구매자 : <input type='text' name='sndOrdername' value='김지수' size='30'> </br>
		Email : <input type='text' name='sndEmail' value='wltn656@naver.com' size='30'> </br>
		전화번호 : <input type='text' name='sndMoblie' value='01022223333' size='12' maxlength='12'> </br>
		<input type='submit' value="전송" />
	</form>

</body>
</html>