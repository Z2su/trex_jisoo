<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>공지사항 ${notice.notice_num }번 편집하기</title>

<body>
	<!-- Page Path Begins -->
	<div class="breadcrumbs" id="breadcrumbs">
		<ul class="breadcrumb">
			<li>
				<i class="ace-icon fa fa-comments-o home-icon bigger-150"></i>
					공지사항
			</li>
			<li>
					편집
			</li>
			<li class="active">
					${notice.notice_num }
			</li>
		</ul>
	</div>
	
	<div class="page-content" style="padding-bottoms:8px;">
		<div class="row">
			<div class="wizard-actions">						
				<button type="button" class="btn btn-sm btn-white btn-bold" onclick="modify_go();">
					<i class="red ace-icon fa fa-check bigger-120"></i><b>저장</b>
				</button>
				<button type="button" class="btn btn-sm btn-white btn-bold" onclick="cancel_go();">
					<i class="grey ace-icon fa fa-times bigger-120"></i><b>취소</b>
				</button>
			</div>
		</div>
		
<form role="form" id="modifyForm" class="form-horizontal" action="modify" method="post">
	 <input type='hidden' name='notice_num' value ="${notice.notice_num}"> 
	
	<div class="hr_line">&nbsp;</div>
	<div class="form-group">
		<label for="writer" class="col-xs-4 col-sm-2 control-label no-padding-right bolder g_label required">
		작성자</label>
		<div class="col-xs-8 col-sm-4 g_value">			
			<input id="writer" name="writer" style="width:70%;" class="form-control required" 
				   type="text" readonly value="${notice.writer }"
				   style="background:#aaa;"/>			
		</div>		
	</div>
	
	<div class="form-group" style="display:none;">
		<label for="dms.hotFlag" class="col-xs-4 col-sm-2 control-label no-padding-right bolder g_label"></label> 
			<div class="col-xs-8 col-sm-10 g_value"></div>
	</div>
	
	<div class="form-group">
		<label for="title" class="col-xs-4 col-sm-2 control-label no-padding-right bolder g_label required">
		제&nbsp;&nbsp;&nbsp;목</label>
		<div class="col-xs-8 col-sm-10 g_value">
			<input   id="title" name="title" onkeydown="CheckTextCount(this, 100);" class="form-control required" required="required " type="text" value="${notice.title }"/>
		</div>
	</div>  
	<div class="form-group">
		<label for="cont" class="col-xs-4 col-sm-2 control-label no-padding-right bolder g_label required">
		내 용</label>
		<div class="col-xs-8 col-sm-10 g_value">
			<textarea  rows="10" cols="" id="cont" name="cont" onkeydown="CheckTextCount(this, 1000);" class="form-control required" >${notice.cont }</textarea>			
		</div>
	</div>  
	<br/>
<br/>
	
</form>
</div>
	
</body>