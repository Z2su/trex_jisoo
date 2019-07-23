<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	width: 308px;
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
	width: 310px;
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
	width: 310px;
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
	width: 955px;
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
</style>

<div id="contentswrap">

	<!-- subvisual -->
	<div id="subvisual">
		<div class="subv_performance">
			<div class="subv_pat">
				<p>
					<strong><img src="/resources/images/ma_service_type.png"
						alt="Daejeon Arts Center"></strong> 문화로 시민을 행복하게! 대전예술의전당
				</p>
			</div>
		</div>
	</div>
	<!-- //subvisual -->

	<!-- navigation -->
	<div id="navigation">
		<div class="naviwrap">
				<a href="<%=request.getContextPath()%>/">HOME</a>&gt;
			<navi> 
				<a href="<%=request.getContextPath()%>/mypage/MypageTroupeList">마이페이지</a>&gt;
				<a href="<%=request.getContextPath()%>/mypage/MypageTroupeCrAppList">대관신청조회</a>
			<div class="nv_service">
				<a class="nvs_print" href="#total"
					onclick="printContent('/html/kr/performance/performance_010101.html?mode=V&amp;code=2946');return false"><span
					class="hide">Print</span></a> <a href="#"
					onclick="twitterOpen('http://www.djac.or.kr/html/kr/performance/performance_010101.html?mode=V&amp;code=2946', '대전예술의전당 | 공연정보'); return false;"
					class="nvs_twt twitter" target="_blank" title="대전예술의전당 트위터(새창)"><span
					class="hide">트위터</span></a> <a href="#"
					onclick="facebookOpen('http://www.djac.or.kr/html/kr/performance/performance_010101.html?mode=V&amp;code=2946'); return false;"
					class="nvs_face facebook" target="_blank" title="대전예술의전당 페이스북(새창)"><span
					class="hide">페이스북</span></a>
			</div>
		</div>
	</div>
	<!-- //navigation -->

	<!-- container -->
	 <div id="container">
    <%@ include file="/WEB-INF/views/board/commons/submenu.jsp"%>

			<!-- content-->
			<div id="content">
				<!-- 컨텐츠 타이틀 -->
				<h3 class="cnt_ti">대관신청조회</h3>
				<div class="new_tab_wrap">
					<ul class="style03">
					</ul>
				</div>

				<div class="row">
					<div class="wizard-actions">
						<div style="float: left;">
							<!-- 문서 편집 이력 && 익명사용 -->
						</div>

						<div>
						<c:if test="${loginUser.mem_code eq CRAppBoard.writer }" >
						
						</c:if>
							<a href="/mypage/MypageTroupeCrAppList"> <img
								src="<%=request.getContextPath()%>/resources/images/list.gif"
								alt="목록"></a>
						</div>
					</div>
				</div>

				<form id="search" class="form-horizontal"
					action="/bbs/read.htm?docId=2018042316273647&amp;bbsId=bbs00000000000004&amp;workType=1&amp;moduleId=00000000000000&amp;categoryId=&amp;searchRange=0&amp;listType=L&amp;searchKey=subject&amp;searchValue="
					method="post">

					<div class="hr_line">&nbsp;</div>
					<div class="form-group">
						<!-- label의 for명은 input 개체명과 연관을 가지도록 기술 -->
						<label for=""
							class="col-xs-4  col-sm-2 control-label no-padding-right bolder g_label">제목</label>
						<div class="col-xs-8  col-sm-10 g_value" style="padding-top: 8px;">${CRAppBoard.title }</div>
					</div>

					<!--  본문 영역 -->
					<div class="form-group">
						<div class="col-xs-12  g_value"
							style="min-height: 250px; padding: 8px 3px 3px; margin: 0px; overflow: auto;">
							내용
							<p>${CRAppBoard.cont}<br>
							</p>
						</div>
					</div>

					<table id="btntbl">
						<tr>
							<td class="tblspace09"></td>
						</tr>
					</table>

					<input type="hidden" name="attachobj" value="">
					<!-- 조회시 파일 첨부 컨트롤 삽입 -->
				</form>
			</div>
			<!-- 상단 우측버튼 -->
		</div>
	</div>
	
	<script>
		$('.style03 li').on('click', function() {
			$('.style03 li').removeClass('active');
			$(this).addCalss('active');
		})

		function remove_go() {
			var cr_app_num;
			cr_app_num = $
			{
				cr_app.cr_app_num
			};
			location.href = "MypageTroupeCrAppDetail?cr_app_num=${event.cr_app_num}";
		}
	</script>
	<!-- //container -->
</div>