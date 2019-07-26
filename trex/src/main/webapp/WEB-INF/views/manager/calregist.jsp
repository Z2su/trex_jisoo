

<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html >
<html>
<head>

<meta charset="UTF-8">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/js/jquery-ui-1.12.1/jquery-ui.min.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script
	src="<%=request.getContextPath()%>/resources/js/jquery-ui-1.12.1/jquery-ui.min.js"></script>

<script
	src="<%=request.getContextPath()%>/resources/js/jquery-ui-1.12.1/datepicker-ko.js"></script>


<title></title>
</head>
<body>
	<!-- <form role="form"> -->
	<fieldset>

		<form name="inputForm" method="post" action="calregist">
			<ul class="board_writeInfo">

				<!--제목-->
				<li><label for="wrtTitle">제 목</label><input type="text"
					id="wrtTitle" name="title" value=""></li>

				<!--작성자 -->
				<li><label>기간 </label> <input id="starttime" name="starttime"
					type="date" />
					~ <input id="endtime" name="endtime" type="date" /></li>

				<!--내용입력-->
				<li><label>구분</label> <select name="code">
						<option>PFSH0004</option>
						<option>CRSH0002</option>
				</select></li>


			</ul>

			<!-- 게시판 버튼모음 -->
			<div class="board_butt">
				<input type="image"
					src="<%=request.getContextPath()%>/resources/imagesentry.gif"
					alt="등록">
			</div>



		</form>
		<!-- <input type="button" class="btn btn-lg btn-success btn-block" value="회원가입" onclick="DosignUp();" /> -->
	</fieldset>


</body>
</html>