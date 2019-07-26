<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" type="text/css"
	href="//ticketimage.interpark.com/TicketImage/onestop/css/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>


<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<meta name="Author" content="">
<meta name="Keywords" content="">
<meta name="Description" content="">
<link rel="stylesheet" type="text/css"
	href="//ticketimage.interpark.com/TicketImage/onestop/css/reset.css">
<link rel="stylesheet" type="text/css"
	href="//ticketimage.interpark.com/TicketImage/onestop/css/style.css">
<script type="text/javascript" src="/Lib/js/XmlRs.js"></script>
<script type="text/javascript" src="/Book/Inc/Js/common.js"></script>
<script type="text/javascript" src="/Book/Inc/Js/block.js"></script>
<script type="text/javascript" src="/Book/Inc/Js/prototype_1_7.js"></script>
<script type="text/javascript" src="/Book/Inc/Js/Ajax.js"></script>
<script type="text/javascript" src="/Book/Inc/Js/BookSeatConfig.js"></script>
<script type="text/javascript"
	src="//ticketimage.interpark.com/TicketImage/onestop/css/common.js"></script>
	
<div id="contentswrap">
	<!-- 내용채우기 -->
	
	
	<form id="trexinfo" name = "trexinfo" action="step1" method="get">
		<input type ="hidden" name ="mem_id" value="${loginUser.mem_id }"/>
		<input type="hidden" name="pf_code" value="${pf_code }" id="pf_code" />
		<a href="#" value="${pf.name }" /></a>
	</form>
	
</div>
