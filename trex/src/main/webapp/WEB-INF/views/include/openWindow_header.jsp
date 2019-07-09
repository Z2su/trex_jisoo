<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<meta name="robots" content="noindex,nofollow">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
<title><decorator:title /></title>


<style type="text/css" id="fontFamilyStyleSheet">
body { 
	font-family: 'Malgun Gothic', sans-serif !important; 
}
.fileDrop{
	width:90%;
	height:120px;
	border:1px dotted gray;
	margin:auto;
}

</style>

<!-- bootstrap & fontawesome -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/common/libs/garam-admin-template/1.3.5/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/common/libs/garam-admin-template/1.3.5/dist/css/font-awesome.min.css" />
		
<!-- page specific plugin styles start -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/common/libs/dhtmlwindow/1.1/dhtmlwindow.css" type="text/css" />	<!-- DHTML Window Widget v1.1 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/common/libs/dhtmlmodal/1.1/modal.css" type="text/css" />			<!-- DHTML Modal window v1.1 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/common/libs/garam-admin-template/1.3.5/dist/css/jquery-ui.min.css" />		<!-- jQuery UI v1.11.4 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/common/libs/jquery-qtip2/2.2.1/jquery.qtip.min.css">				<!-- jQuery qTip2 v2.2.1 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/common/libs/garam-admin-template/1.3.5/dist/css/bootstrap-datepicker3.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/common/libs/garam-admin-template/1.3.5/dist/css/ui.jqgrid.min.css" />		<!-- jQuery jqGrid -->

<!-- page specific plugin styles end -->

<!-- text fonts -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/common/libs/garam-admin-template/1.3.5/dist/css/garam-fonts.min.css" />

<!-- ace styles -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/common/libs/garam-admin-template/1.3.5/dist/css/garam.min.css" class="ace-main-stylesheet" id="main-ace-style" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/common/css/adminLTE.css" />

<!--[if lte IE 9]>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/common/libs/garam-admin-template/1.3.5/dist/css/garam-part2.min.css" class="ace-main-stylesheet" />
<![endif]-->

<!--[if lte IE 9]>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/common/libs/garam-admin-template/1.3.5/dist/css/garam-ie.min.css" />
<![endif]-->

<!-- inline styles related to this page start -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/common/css/garam.garam.css" />

<!-- inline styles related to this page end -->

<!-- ace settings handler -->
<script src="<%=request.getContextPath()%>/resources/common/libs/garam-admin-template/1.3.5/dist/js/garam-extra.min.js"></script>

<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

<!--[if lte IE 8]>
<script src="<%=request.getContextPath()%>/resources/common/libs/garam-admin-template/1.3.5/dist/js/html5shiv.js"></script>
<script src="<%=request.getContextPath()%>/resources/common/libs/garam-admin-template/1.3.5/dist/js/respond.js"></script>
<![endif]-->


<!-- basic scripts -->

<!--[if !IE]> -->
<script src="<%=request.getContextPath()%>/resources/common/libs/garam-admin-template/1.3.5/dist/js/jquery.min.js"></script>
<!-- <![endif]-->

<!--[if IE]>
<script src="<%=request.getContextPath()%>/resources/common/libs/garam-admin-template/1.3.5/dist/js/jquery1x.min.js"></script>
<![endif]-->
<script type="text/javascript">
	var _console = window.console;
	if('ontouchstart' in document.documentElement) document.write("<script src='<%=request.getContextPath()%>/resources/common/libs/garam-admin-template/1.3.5/dist/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
</script>
<script src="<%=request.getContextPath()%>/resources/common/libs/garam-admin-template/1.3.5/dist/js/bootstrap.min.js"></script>

<!-- page specific plugin scripts start -->
<script src="<%=request.getContextPath()%>/resources/common/libs/dhtmlwindow/1.1/dhtmlwindow.js"></script>								<!-- DHTML Window Widget v1.1 -->
<script src="<%=request.getContextPath()%>/resources/common/libs/dhtmlmodal/1.1/modal.js"></script>									<!-- DHTML Modal window v1.1  -->
<script src="<%=request.getContextPath()%>/resources/common/libs/garam-admin-template/1.3.5/dist/js/jquery-ui.min.js"></script>					<!-- jQuery UI v1.11.4 -->
<script src="<%=request.getContextPath()%>/resources/common/libs/garam-admin-template/1.3.5/dist/js/jquery.ui.touch-punch.min.js"></script>		<!-- jQuery UI Touch Punch v0.2.3 -->
<script src="<%=request.getContextPath()%>/resources/common/libs/garam-admin-template/1.3.5/dist/js/bootbox.min.js"></script>						<!-- bootbox.js v4.3.0 -->
<script src="<%=request.getContextPath()%>/resources/common/libs/jquery-cookie/jquery.cookie.js"></script>				<!-- jQuery Cookie Pligin -->
<!-- <script src="<%=request.getContextPath()%>/resources/common/jquery/plugins/jquery.validate.js"></script>								jQuery Validation v1.8.1 -->
<!-- <script src="<%=request.getContextPath()%>/resources/common/libs/jquery-validation/jquery.validate.defaults.js"></script>				jQuery Validation defaults -->
<script src="<%=request.getContextPath()%>/resources/common/libs/jquery-validation/1.15.0/jquery.validate.js"></script>				<!-- jQuery Validation defaults --> 
<script src="<%=request.getContextPath()%>/resources/common/libs/jquery-validation/jquery.validate.defaults.js"></script>				
<script src="<%=request.getContextPath()%>/resources/common/libs/jquery-qtip2/2.2.1/jquery.qtip.min.js"></script>						<!-- jQuery qTip2 v2.2.1 -->
<script src="<%=request.getContextPath()%>/resources/common/jquery/plugins/BlockUI/jquery.blockUI.js"></script>						<!-- jQuery blockUI v2.63 -->
<script src="<%=request.getContextPath()%>/resources/common/libs/garam-admin-template/1.3.5/dist/js/date-time/bootstrap-datepicker.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/common/libs/garam-admin-template/1.3.5/dist/js/date-time/locales/bootstrap-datepicker.kr.js"></script>
<script src="<%=request.getContextPath()%>/resources/common/libs/garam-admin-template/1.3.5/dist/js/jqGrid/jquery.jqGrid.min.js"></script>		<!-- jQuery jqGrid JS v5.0.1 -->
<script src="<%=request.getContextPath()%>/resources/common/libs/garam-admin-template/1.3.5/dist/js/jqGrid/i18n/grid.locale-en.js"></script>	<!-- jQuery jqGrid English Translation -->

<!-- page specific plugin scripts end -->

<!-- ace scripts -->
<script src="<%=request.getContextPath()%>/resources/common/libs/garam-admin-template/1.3.5/dist/js/garam-elements.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/common/libs/garam-admin-template/1.3.5/dist/js/garam.min.js"></script>

<!-- inline scripts related to this page start -->
<script src="<%=request.getContextPath()%>/resources/common/scripts/common.js"></script>
<script src="<%=request.getContextPath()%>/resources/common/scripts/organization_selector.js"></script>
<script src="<%=request.getContextPath()%>/resources/common/scripts/garam.garam.js"></script>
<script src="<%=request.getContextPath()%>/resources/common/scripts/parent.reload.js"></script>

<decorator:head />

<script type="text/javascript">
	var popupWinCnt = 0;	
	function goSubmit(cmd, isNewWin ,docId)
	{
		var frm = document.getElementById("search");
		frm.method = "GET";
		switch(cmd){
			case "view":
				frm.docId.value = docId;
				frm.action = "read.htm";
				break;
			case "edit":
				frm.action = "form.htm";
				frm.pDocId.value = "";
				break;
			case "delete":
				if(!confirm("삭제 하시겠습니까?")) return;
				frm.action = "delete.htm";
				break;
			
			default:
				return;
				break;
		}
		
			
				frm.useNewWin.value = false;
				frm.useLayerPopup.value = true;
			
			
		
		frm.submit();
	}

	var popupHistory,x,y;
	function ViewHistory(historyType ) {
		var url = "";
		x = 17;
		y = 80;
		switch(historyType)
		{
			case "edit":
				url = "./edit_history.htm?bbsId=bbs00000000000000&docId=2018051611134119";
				break;
			case "read":
				x = 90;
				url = "./read_history.htm?bbsId=bbs00000000000000&docId=2018051611134119";
				break;
			case "down":
				x = 163;
				url = "./down_history.htm?bbsId=bbs00000000000000&docId=2018051611134119";
				break;
			default :
				return;
				break;
		}
		ajaxRequest("GET", "", url, viewHistoryCompleted);
	}

	function hideHistory(){
		if (window.createPopup){
			popupHistory.hide()
		} else popupHistory.close();
	}

	function viewHistoryCompleted(data, textStatus, jqXHR) {
		wid = 500 ;
		hei = 194;
		
		ModalDialog({'t':'History', 'w':480, 'h':250, 'm':'html', 'c':data, 'modal':false, 'd':true, 'r':true });
		/*
		if(window.createPopup){
			popupHistory = window.createPopup();
			popupHistory.document.body.innerHTML = data ;
			popupHistory.show(x, y, wid, hei , document.body);
		} else {
			var features = "height=" + hei + ",width=" + wid + ",left=" + x + ",top=" + y + 
				",titlebar=no,menubar=no,scrollbars=no,status=no,location=no"
			popupHistory = window.open("about:blank", "popupHistory", features);
			popupHistory.document.body.innerHTML = data;
		}
		*/
	}
	

	function ShowUserInfoSetss() {
	     // Make sure to only match links to wikipedia with a rel tag
	     var strUrl = "/common/userinfo.htm?userId=" ;

	   	$('.maninfo').each(function()
	    {
	   		// We make use of the .each() loop to gain access to each element via the "this" keyword...
	   		$(this).qtip(
	   		{
	   			content: {
	   				// Set the text to an image HTML string with the correct src URL to the loading image you want to use
	   				//text: '<img class="throbber" src="/projects/qtip/images/throbber.gif" alt="Loading..." />',
	   				text: 'loading...',
	   				ajax: {
	   					//url: $(this).attr('rel') // Use the rel attribute of each element for the url to load
	   					//url: strUrl // Use the rel attribute of each element for the url to load
	   					url: strUrl + $(this).attr('rel') // Use the rel attribute of each element for the url to load
	   				},
	   				title: {
	   					text: 'Man Information - ' + $(this).text(), // Give the tooltip a title using each elements text
	   					//text: 'Man Infomation', // Give the tooltip a title using each elements text
	   					button: true
	   				}
	   			},
	   			position: {
	   				at: 'left center', // Position the tooltip above the link
	   				my: 'right center',
	   				viewport: $(window), // Keep the tooltip on-screen at all times
	   				effect: false // Disable positioning animation
	   			},
	   			show: { 
	   				event: 'click',
	   				solo: true // Only show one tooltip at a time
	   			},
	   			hide: 'unfocus',
	   			style: {
	   				//classes: 'qtip-wiki qtip-light qtip-shadow'
	   				classes: 'ui-tooltip-bootstrap ui-tooltip-shadow ui-tooltip-rounded',
					width:350
	   			}
	   		})
	   	})
    
	   	// Make sure it doesn't follow the link when we click it
		.click(function(event) { event.preventDefault(); });
	}
	
	$(document).ready(function(){
		
		var isNoticePopup = $.urlParam('isNoticePopup');
		if ( isNoticePopup == "true" ) {
			// 메인화면 새창 공지사항 일 경우 : 1.수행버튼 숨김, 2. 24시간 사용않음 버튼 하단에 추가
			$(".wizard-actions").hide();
			$("#close24").show();
		}
		
		//$(".wizard-actions").hide();
		//$("#close24").show();
		
//	 	if (navigator.userAgent.match(/iPad/) == null && navigator.userAgent.match(/Mobile|Windows CE|Windows Phone|Opera Mini|POLARIS/) != null){
//	 		var head = document.getElementsByTagName("head")[0];
//	 		var s = document.createElement("meta");
//	 		s.name = "viewport";
//	 		s.content = "width=device-width, minimum-scale=0.4, maximum-scale=1, initial-scale=0.4, user-scalable=yes";
//	 		head.appendChild(s);
//	 		s = null;
//	 	}
		
		ShowUserInfoSet();
		ViewHistorySet();
		
		pageScroll();	// page Scroll을 위해 사용. 2013-08-31
		
		setTimeout( "popupAutoResize2();", "500");		//팝업창 resize
		
	});

</script>
</head>

<body class="no-skin formBody">