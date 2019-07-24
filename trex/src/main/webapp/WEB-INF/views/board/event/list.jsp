<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
			<a href="<%=request.getContextPath()%>" class="nv_home">HOME</a>&gt;
			<navi> <a href="<%=request.getContextPath()%>/board/pr/prlist">홍보게시판</a>&gt;
			<a href="<%=request.getContextPath()%>/board/event/list"
				class="navi_ov">이벤트</a>&gt; </navi>
			<div class="nv_service">
				<a class="nvs_print" href="#total"
					onclick="printContent('/html/kr/performance/performance_010101.html?mode=V&amp;code=2946');return false"><span
					class="hide">Print</span></a>
			</div>
		</div>
	</div>
	<!-- //navigation -->

	<!-- container -->
	<div id="container">
		<%@ include file="/WEB-INF/views/board/commons/submenu.jsp"%>
		<div id="main-context">

			<!-- content-->
			<div id="content">
				<!-- 컨텐츠 타이틀 -->
				<h3 class="cnt_ti">이벤트</h3>
				<div class="new_tab_wrap">
					<ul class="style03">
						<li class="active"><a
							href="<%=request.getContextPath()%>/board/event/list">진행중인
								이벤트</a> <span class="tab_line"></span></li>
						<li><a
							href="<%=request.getContextPath()%>/board/event/endlist">종료된
								이벤트</a> <span class="tab_line"></span></li>
					</ul>
				</div>


				<!--  본문 내용    -->
				<c:if test="${fn:substring(loginUser.mem_code,0,2) eq 'EP' }" >	
				<div class="wizard-actions-L">
					<input type="button" value="이벤트 등록" class="button"
						onClick="location.href='<%=request.getContextPath()%>/board/event/regist'">
				</div>
				</c:if>

				<div class="event_board">
					<ul style="margin-top: 10px; margin-left: 10px;">
						<c:forEach var="event" items="${eventList }">
							<li>
								<div class="event_list_wrap">
									<dl>
										<dt>
											<a
												href="<%=request.getContextPath()%>/board/event/detail?event_num=${event.event_num}">
												<img src="<%=request.getContextPath() %>/resources/event/imageUpload/${event.event_code}.jpg"
												alt="이벤트 섬네일"></a>
										</dt>
										<dd class="data">
											<p>
												<a href="<%=request.getContextPath()%>/board/event/detail?event_num=${event.event_num}">${event.title }</a>
											</p>
										</dd>
										<dd class="date">
											<p>${event.startdate }~${event.enddate }</p>
										</dd>
									</dl>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>

		<!--quick  -->
		<%@ include file="/WEB-INF/views/board/commons/quick.jsp"%>
	</div>

	<script>
		$('.style03 li').on('click', function() {
			$('.style03 li').removeClass('active');
			$(this).addCalss('active');

		})
	</script>
	<!-- //container -->
</div>