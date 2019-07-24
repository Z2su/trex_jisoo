<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="CR_AppList" value="${dataMap.CR_AppList }" />
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/resources/css/Coronation.css"
   type="text/css" media="all">
   
<style>
.new_tab_wrap ul.style03 {
	width: 100%;
	float: left;
}

.new_tab_wrap ul.style03 li {
	position: relative;
	width: 316px;
	float: left;
	height: 48px;
	line-height: 47px;
	text-align: center;
	border-top: 1px solid #eaeaee;
	border-right: 1px solid #eaeaee;
	border-bottom: 1px solid #c8c8d5;
	background-color: #fafafc;
	color: #888888;
	font-size: 15px;
}

.new_tab_wrap ul.style03 li:first-child {
	border-left: 1px solid #eaeaee;
	width: 317px;
}

.new_tab_wrap ul.style03 li.active, .new_tab_wrap ul.style03 li.active:hover
	{
	border-bottom: 1px solid #fff;
	background-color: #fff;
	color: #315eb2;
}

.new_tab_wrap ul.style03 li:hover {
	border-bottom: 1px solid #c8c8d5;
	background-color: #f2f2f8;
	color: #315eb2;
}

.new_tab_wrap ul.style03 li a {
	color: #888888;
	width: 100%;
	height: 100%;
	float: left;
}

.new_tab_wrap ul.style03 li.active a {
	color: #315eb2;
}

.new_tab_wrap ul.style03 li .tab_line {
	width: 319px;
	height: 4px;
	background-color: #7192d0;
	position: absolute;
	left: -1px;
	top: -1px;
	display: none;
}

.new_tab_wrap ul.style03 li.active .tab_line {
	display: block;
}

.event_board {
	width: 100%;
	float: left;
}

.event_board ul {
	width: 637px;
	float: left;
	margin-top: 30px;
}

.event_board ul li {
	width: 292px;
	height: 237px;
	float: left;
	border: 1px solid #e3e3e3;
	margin-right: 24px;
	margin-bottom: 30px;
}

/* 이벤트 본문 */
.event_list_wrap {
	width: 285px;
	height: 231px;
	margin: 3px auto;
}

.event_list_wrap dl {
	width: 100%;
	float: left;
}

.event_list_wrap dl dt {
	width: 100%;
	float: left;
	height: 120px;
	position: relative;
	overflow: hidden;
}

.event_list_wrap dl dt img {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	-ms-transition: all 300ms linear;
	transition: all 300ms linear
}

.event_board ul li:hover img {
	width: 110%;
	top: -5%;
	left: -5%
}

.event_list_wrap dl dt span {
	position: absolute;
	right: 0;
	top: 0;
}

.event_list_wrap dl dd {
	width: 100%;
	float: left;
}

.event_list_wrap dl dd.data {
	width: 245px;
	height: 70px;
	text-align: center;
	vertical-align: middle;
	display: table;
	margin-left: 20px;
}

.event_list_wrap dl dd.data p {
	display: table-cell;
	vertical-align: middle;
	font-size: 16px;
	line-height: 23px;
}

.event_list_wrap dl dd.data p a {
	color: #333;
}

.event_list_wrap dl dd.date {
	width: 100%;
	float: left;
	border-top: 1px solid #e3e3e3;
}

.event_list_wrap dl dd.date p {
	width: 100%;
	float: left;
	margin-left: 70px;
	padding-left: 20px;
	background:
		url("https://ssl.nx.com/s2/game/maplestory/renewal/common/date_icon_new.png")
		left 1px no-repeat;
	color: #aaa;
	font-size: 12px;
	line-height: 16px;
	margin-top: 15px;
	font-family: "Tahoma";
}

.event_view_roll .event_list_wrap dl dd.date p {
	width: 100%;
	float: left;
	margin-left: 40px !important;
	padding-left: 20px;
	background:
		url("https://ssl.nx.com/s2/game/maplestory/renewal/common/date_icon_new.png")
		left 1px no-repeat;
	color: #aaa;
	font-size: 12px;
	line-height: 16px;
	margin-top: 15px;
	font-family: "Tahoma";
}

.button{
	board :1px solid #ff0008;
	background-color : #ffe6f2;
	font : 12px 굴림;
	fount-weight : bold;
	color : #ff0008;
	width:100%;
}
</style>   
   
   
<body>
 
   <div id="contentswrap">

			<!-- subvisual -->
			<div id="subvisual">
								<div class="subv_together">
					<div class="subv_pat">
						<p>
							<strong><img src="/resources/images/ma_service_type.png" alt="Daejeon Arts Center"></strong>
							문화로 시민을 행복하게! 대전예술의전당
						</p>
					</div>
				</div>
							</div>
			<!-- //subvisual -->

			<!-- navigation -->
			<div id="navigation">
				<div class="naviwrap">
				 	<a href="/html/kr/" class="nv_home">HOME</a>&gt;<navi><a href="/html/kr/together/together_0301.html">대관 안내</a>
												<a class="nvs_print" href="#total" onclick="printContent('/_prog/audition/?site_dvs_cd=kr&amp;menu_dvs_cd=030301');return false"><span class="hide">Print</span></a>

					</div>
				</div>
			</div>
			<!-- //navigation -->

			<!-- container -->
			<div id="container">
				 <%@ include file="/WEB-INF/views/board/Coronation/submenu.jsp"%>

<!-- 탭메뉴 및 좌측메뉴 펼침기능 시작 부분 -->
<script type="text/javascript">menuclick('submenu3');</script>

	
	<!-- 리스트 넣는 곳 -->
	
	<div id="content">
			<!-- 컨텐츠 타이틀 -->
			<h3 class="cnt_ti">대관 신청 리스트</h3>
			<div class="new_tab_wrap">
					<ul class="style03">
						<li class="active"><a
							href="<%=request.getContextPath()%>/board/Coronation/app/list">대관신청
								리스트</a> <span class="tab_line"></span></li>
						<li><a
							href="<%=request.getContextPath()%>/board/Coronation/app/conflist">대관승인
								리스트</a> <span class="tab_line"></span></li>
					</ul>
				</div>
			<table width="100%" class="table1 center" border="0" cellspacing="0" cellpadding="0">
				<colgroup>
					<col style="width: 45px;">
					<col style="width: 280px;">
					<col style="width: 90px;">
					<col style="width: 145px;">
					

				</colgroup>
				<thead>
					<tr>
						<th scope="col" class="t_head">번호</th>
						<th scope="col" class="t_head">제목</th>
						<th scope="col" class="t_head">작성일</th>
						<th scope="col" class="t_head">작성자</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="CR_AppList" items="${CRAppBoardList }">
						<tr role="row" class="jqgrow ui-row-ltr ui-widget-content">
						<td role="gridcell" style="text-align:center;" >${CR_AppList.cr_app_num }</td>
						<td role="gridcell" >
							<a href="/board/Coronation/app/detail/${CR_AppList.cr_app_code }" onclick="OpenWindow('detail?cr_app_code=${CR_AppList.cr_app_code }','','850','620')"
									 style='<c:if test="" >font-weight:bold;color:blue;</c:if>'>${CR_AppList.title }
							</a>
											   
						</td>
						<td role="gridcell" style="text-align:center;" >
							<fmt:formatDate value="${CR_AppList.regdate }" pattern="yyyy-MM-dd" />
						</td>
							<td role="gridcell" style="text-align:center;" >
							<a class="maninfo" rel="${CR_AppList.writer }" href="#" data-hasqtip="21">
								<i class="pink2 ace-icon fa fa-user" title="작성자"></i>															
								${CR_AppList.writer }
							</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>

			</table>
			<div class="board_butt" style="margin: 10px 0;padding: 0 10px; text-align: right">

					<a href="/board/Coronation/app/list">
					<img src="/resources/images/list.gif" alt="목록"></a> 
					<a href="/board/Coronation/app/regist">
					<img src="/resources/images/write.gif" alt="쓰기"></a>
			</div>

			<div class="pageNum">
				<div class="pageNum">
					<span class="page">1</span><a href="?&amp;GotoPage=2" class="page_ov">2</a>
				</div>
			</div>

		</div>
	
	<!--  -->
      



			</div>
			

<script type="text/javascript">
var  menu_list=jQuery("#divMenu >ul > li.image_rot");
var img_rot=jQuery("#divMenu >ul > li").eq(1);
menu_list.bind("mouseover",qm_rot);	

function qm_rot(){
	var img_idx=menu_list.index(jQuery(this));
	img_rot.find(">a>img").attr("src","/images/kr/common/qm_rot0"+(img_idx+1)+".gif");	
}


var slidemenu_X = 0; //상단 제한 값
var slidemenu_Y = 500; //하단 제한 값
</script>
<script type="text/javascript">
// slide menu  2006-06-14
var isDOM = (document.getElementById ? true : false);
var isIE4 = ((document.all && !isDOM) ? true : false);
var isNS4 = (document.layers ? true : false);
var isNS = navigator.appName == "Netscape";


function getRef(id) {
    if (isDOM) return document.getElementById(id);
    if (isIE4) return document.all[id];
    if (isNS4) return document.layers[id];
}

function getSty(id) {
    x = getRef(id);
    return (isNS4 ? getRef(id) : getRef(id).style);
}

function moveRightEdge() {
    var yMenuFrom, yMenuTo, yOffset, timeoutNextCheck;

    if (isNS4) {
        yMenuFrom   = document.getElementById('divMenu').style.top;
        yMenuTo     = windows.pageYOffset + slidemenu_X;   // 위쪽 위치
    } else if (isDOM) {
        yMenuFrom   = parseInt (document.getElementById('divMenu').style.top, 10);
        yMenuTo     = (isNS ? window.pageYOffset : document.documentElement.scrollTop) + slidemenu_X; // 위쪽 위치
    }
    timeoutNextCheck = 30;
    
    divMenu_H = document.getElementById('divMenu');
    limit_H = (parseInt(document.documentElement.scrollHeight)-slidemenu_Y)-parseInt(divMenu_H.offsetHeight);
    divMenu_t = parseInt(document.getElementById('divMenu').style.top) ;
    if (yMenuFrom != yMenuTo) {
        yOffset = Math.ceil(Math.abs(yMenuTo - yMenuFrom) / 20);
        if (yMenuTo < yMenuFrom){
            yOffset = -yOffset;
        }
        if (isNS4){
            if(yOffset > 0){
                if ( divMenu_t < limit_H) {
                    document.getElementById('divMenu').style.top += yOffset+"px";
                }
            }else{
                document.getElementById('divMenu').style.top += yOffset+"px";
            }
            
        }else if (isDOM){
            if(yOffset > 0){
                if ( divMenu_t < limit_H) {
                    document.getElementById('divMenu').style.top = parseInt (document.getElementById('divMenu').style.top) + yOffset+"px";
                }
            }else{
                document.getElementById('divMenu').style.top = parseInt (document.getElementById('divMenu').style.top) + yOffset+"px";
            }
        }
        timeoutNextCheck = 10;
    }

    setTimeout ("moveRightEdge()", timeoutNextCheck);
}


if (isNS4) {    
    var divMenu = document["divMenu"];
    document.getElementById('divMenu').style.top = slidemenu_X+"px";
    document.getElementById('divMenu').style.visibility = "visible";
    moveRightEdge();
} else if (isDOM) {
    var divMenu = getRef('divMenu');    
    document.getElementById('divMenu').style.top = slidemenu_X+"px";    
    document.getElementById('divMenu').style.visibility = "visible";    
    moveRightEdge();
}
</script>		</div>
		<!-- //container -->
	</div>
</body>



