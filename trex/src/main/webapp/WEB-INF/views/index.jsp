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
	<form action="credit/form" method="post">
		상품명 : <input type='text' name='sndGoodname' value='당근10kg' size='30'> </br>
		가격  : <input type='text' name='sndAmount' value='1004' size='15' maxlength='9'> </br>
		구매자 : <input type='text' name='sndOrdername' value='김토끼' size='30'> </br>
		Email : <input type='text' name='sndEmail' value='kspay@carrot.co.kr' size='30'> </br>
		전화번호 : <input type='text' name='sndMoblie' value='01112341234' size='12' maxlength='12'> </br>
		배송지 : <input type='text' name='sndAddress' value='대전시 서구 둔산동' /></br>
		<input type='submit' value="전송" />
	</form>

</body>
</html>