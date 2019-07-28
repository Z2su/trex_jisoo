<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>

/* 이벤트 본문 */
.event_list_wrap {
	width: 228px;
	height: 185px;
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



<div id="mainwrap">
	<!-- mvisual -->
	<div id="mvisual" style="height: 400px;">
		<div class="mv_pat">
			<h3 class="blind">공연목록</h3>
			<div class="control">
				<a href="#prev" rel="prev" class="prev"><span class="hide">공연목록
						이전</span></a> <a href="#next" rel="next" class="next"><span class="hide">공연목록
						다음</span></a>
			</div>
			<div class="mv_cnt">
				<div class="mask" style="left: 0px;">
					<ul class="obj">
						<c:forEach items="${adList}" var="ad">
							<li>
								<div style="background-position:center;
											background-size:cover;
											background-repeat:no-repeat;
											background-image:url('${ad.thumbimg }');
											width:200px;height:150px; margin:0 auto;
											"
									title="${ad.performVO.name}"></div>
								<p> 
									<span style="font-size:18px;font-weight:bold;color:white;">${ad.performVO.name}</span>								
									<span class="date">
									<fmt:formatDate value="${ad.startdate }" pattern="yyyy년 MM월 dd일"/>								
									 - 
									 <fmt:formatDate value="${ad.enddate }" pattern="yyyy년 MM월 dd일"/>									  
									 </span>
								</p> 
								<a href="#" class="view">View</a> 
								<a href="#total" onclick="" class="reser">예매</a>
							</li>
						</c:forEach>
					</ul>					
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>



	<script type="text/javascript">
		$(document).ready(
				function() {
					var param = "#mvisual";
					var obj = ".obj";
					var btn = param + " .control";
					var interval = 5000;
					var speed = 500;
					var viewSize = 1;
					var moreSize = 0;
					var dir = "x";
					var data = 0;
					var auto = true;
					var hover = false;
					var method = "easeInOutCubic";
					var op1 = false;

					stateScrollObj(param, obj, btn, interval, speed, viewSize,
							moreSize, dir, data, auto, hover, method, op1);
				});
	</script>
	<!-- //mvisual -->









	<!-- mshedule -->
	<div id="mshedule">
		<div class="msc_cnt">
			<h3 class="blind">공연일정</h3>
			<div id="calendar">
				<div class="date">
					<span class="cmonth_en">July</span> <span class="cyear">2019.</span>
					<span class="cmonth">07</span>
					<div class="control">
						<a href="#" rel="prev" class="prev"><span class="hide">공연일정
								이전</span></a> <a href="#next" rel="next" class="next"><span
							class="hide">공연일정 다음</span></a>
					</div>
				</div>
				<div class="msc_num">
					<div class="mask">
						<ul>
							<li class="M">M<span><a href="#1">1</a></span></li>
							<li class="T">T<span><a href="#2">2</a></span></li>
							<li class="W">W<span><a href="#3">3</a></span></li>
							<li class="T">T<span><a href="#4">4</a></span></li>
							<li class="F">F<span><a href="#5">5</a></span></li>
							<li class="S">S<span><a href="#6">6</a></span></li>
							<li class="S">S<span><a href="#7">7</a></span></li>
							<li class="M">M<span><a href="#8" class="">8</a></span></li>
							<li class="T">T<span><a href="#9" class="">9</a></span></li>
							<li class="W">W<span><a href="#10">10</a></span></li>
							<li class="T">T<span><a href="#11">11</a></span></li>
							<li class="F">F<span><a href="#12">12</a></span></li>
							<li class="S">S<span><a href="#13">13</a></span></li>
							<li class="S">S<span><a href="#14">14</a></span></li>
							<li class="M">M<span><a href="#15">15</a></span></li>
							<li class="T">T<span><a href="#16">16</a></span></li>
							<li class="W">W<span><a href="#17">17</a></span></li>
							<li class="T">T<span><a href="#18">18</a></span></li>
							<li class="F">F<span><a href="#19">19</a></span></li>
							<li class="S">S<span><a href="#20">20</a></span></li>
							<li class="S">S<span><a href="#21">21</a></span></li>
							<li class="M">M<span><a href="#22">22</a></span></li>
							<li class="T">T<span><a href="#23">23</a></span></li>
							<li class="W">W<span><a href="#24">24</a></span></li>
							<li class="T">T<span><a href="#25">25</a></span></li>
							<li class="F">F<span><a href="#26">26</a></span></li>
							<li class="S">S<span><a href="#27">27</a></span></li>
							<li class="S">S<span><a href="#28">28</a></span></li>
							<li class="M">M<span><a href="#29">29</a></span></li>
							<li class="T">T<span><a href="#30">30</a></span></li>
							<li class="W">W<span><a href="#31">31</a></span></li>
						</ul>
					</div>
				</div>

				<div class="clearfix"></div>
			</div>

			<div class="msc_list"
				style="left: 229.917px; bottom: 45px; display: none;">





				<h3>
					2019.07.09<a href="#close" rel="close"><span class="hide">일별공연목록
							닫기</span></a>
				</h3>
				<div class="scroll-wrapper scrollbar-outer"
					style="position: relative;">
					<div class="scrollbar-outer scroll-content"
						style="margin-bottom: 0px; margin-right: 0px;">
						<ul>

							<li><img
								src="/upload/performance/thm_performance_1_155262739629133_1981207274.jpg"
								alt="2019아침을 여는 클래식 7월"> <strong>2019아침을 여는 클래식
									7월</strong> <span>2019.07.09~07.09</span> <a class="view" href="#">상세보기</a>
								<a class="reser" href="#total"
								onclick="javascript:INTER_Login_check();">예매하기</a></li>
						</ul>
					</div>
					<div class="scroll-element scroll-x">
						<div class="scroll-element_outer">
							<div class="scroll-element_size"></div>
							<div class="scroll-element_track"></div>
							<div class="scroll-bar" style="width: 100px;"></div>
						</div>
					</div>
					<div class="scroll-element scroll-y">
						<div class="scroll-element_outer">
							<div class="scroll-element_size"></div>
							<div class="scroll-element_track"></div>
							<div class="scroll-bar" style="height: 100px;"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script src="/js/kr/jquery.scrollbar.min.js" type="text/javascript"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				kCalendar();
			});
		</script>
	</div>
	<div class="clearfix"></div>
</div>
<div id="mcontainer" style="">
	<!-- msection1-->
	<div id="msection1">
		<!-- 대관,시립예술단 리스트 -->
		<div class="marea1">
			<div id="showcnt_dg">
				<h3>
					<a href="#" class="ov">공연 정보</a><span class="bar">|</span>
				</h3>
				<div class="showcnt" style="display: block;">
					<!-- <div class="control">
						<span class="count"><em>1</em>/2</span> <a href="#prev" rel="prev"
							class="prev"><span class="hide">대관공연 이전</span></a> <a
							href="#next" rel="next" class="next"><span class="hide">대관공연
								다음</span></a>
					</div> -->
					<ul class="item" style="display: block;">
					
						<c:forEach var="pf" items="${pfList }" begin="0" end="2">
						<li>
							<p class="cnt">
								<strong><a href="#">${pf.name }</a></strong>

							</p>
							<div class="clearfix"></div></li>
						</c:forEach>
						
					</ul>

					<a href="#" class="more" title="대관공연 더보기"><span class="hide">대관공연
							더보기</span></a>
				</div>
			</div>

		</div>

		<!-- //대관,시립예술단 리스트 -->
		<!-- 팝업존,퀵메뉴 -->

		<div class="marea2">
			<div class="popupz">
				<div class="matit">
					<h3>
						<em>Event</em>
					</h3>
				</div>
				
					<ul style="margin-top: 10px; margin-left: 10px; height:620px;" >
						<c:forEach var="event" items="${eventList }" begin="0" end="1">
							<li>
								<div class="event_list_wrap"
									style="	width: 280px;height: 230px; margin: 3px auto;" >
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


		<script type="text/javascript">
			$(document).ready(function() {
				var param = ".popupz";
				var btn = ".control";
				var obj = ".item";
				var auto = true;
				var f = 300;
				var s = 7000;
				var p = {
					use : true,
					type : 1,
					path : btn + " .count"
				};
				var h = true;

				commonPopzone(param, btn, obj, auto, f, s, p, h);
			});
		</script>
		<!-- //팝업존,퀵메뉴 -->
	</div>
	<!-- //msection1-->
	<div class="clearfix"></div>

	<!-- msection2-->

	<!-- //msection2-->

	<!-- msection3-->
	<div id="msection3">
		<div class="marea1">
			<div class="matit">
				<h3>공지사항</h3>
			</div>
			<ul class="y_news">
			<c:forEach items="${noticeList}" var="notice"  begin="0" end="4">
				<li><a href="#">${notice.title }</a>
				<fmt:formatDate value="${notice.regdate}" pattern="yyyy-MM-dd" /></li>
			</c:forEach>
			</ul>
			<a href="#" class="more">더보기</a>
		</div>
		<div class="marea1">
			<div class="matit">
				<h3>자주 하는 질문</h3>
			</div>
			<ul class="a_news" >
				<c:forEach items="${faqList}" var="faq"  begin="0" end="5">
				<li style="width:280; hight:65px; overflow: hidden; 
  text-overflow: ellipsis;"><a href="#" >${faq.title }</a> 
				</li>
			</c:forEach>
			</ul>
			<a href="#" class="more">더보기</a>
		</div>
		<div class="marea1">
			<div class="matit">
				<h3>티렉스 공룡짱</h3>
			</div>
			<ul class="a_news">
				<li>
				<img src="<%=request.getContextPath()%>/resources/images/t-rex-logo.jpg" width=300>
				</li>
			</ul>
			<a href="#" class="more">팀원소개</a>
			
		</div>

	</div>
	<!-- //msection3-->
	<div class="clearfix"></div>

	<!-- msection4-->


	<!-- //msection4-->

	<!-- msection5-->






	<div class="clearfix"></div>
</div>
<script type="text/javascript">
	$(document).ready(
			function() {
				var param = ".ms_banner";
				var obj = ".banner ul li";
				var btn = param + " .control";
				var interval = 5000;
				var speed = 500;
				var viewSize = 1;
				var moreSize = 0;
				var dir = "x";
				var data = 0;
				var auto = true;
				var hover = true;
				var method = "easeInOutCubic";
				var op1 = false;
				var h = false;

				stateScrollObj(param, obj, btn, interval, speed, viewSize,
						moreSize, dir, data, auto, hover, method, op1, h);
			});
</script>
</div>
<!-- //msection5-->
</div>
