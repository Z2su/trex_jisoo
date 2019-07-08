<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/resources/css/Perform.css"
   type="text/css" media="all">
<div id="contentswrap">

	<!-- subvisual -->
	<div id="subvisual">
		<div class="subv_performance">
			<div class="subv_pat">
				<p>
					<strong><img
						src="/images/kr/common_2015/ma_service_type.png"
						alt="Daejeon Arts Center"></strong> 문화로 시민을 행복하게! 대전예술의전당
				</p>
			</div>
		</div>
	</div>
	<!-- //subvisual -->

	<!-- navigation -->
	<div id="navigation">
		<div class="naviwrap">
			<a href="/html/kr/" class="nv_home">HOME</a>&gt;
			<navi> <a href="/html/kr/performance/performance_010101.html">공연안내</a>&gt;<a
				href="/html/kr/performance/performance_010101.html">공연안내</a>&gt;<a
				href="/html/kr/performance/performance_010101.html" class="navi_ov">공연정보</a></navi>
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


		<!-- content-->
		<div id="content">
			<!-- 컨텐츠 타이틀 -->
			
			<h3 class="cnt_ti">공연정보</h3> 
			<input  onclick="window.open('regist','글등록','width=600,height=300,scrollbars=no');" type="button" id="regist" value="글등록"/>
			
			<div id="txt">
				<div id="scheDule">
					<strong></strong>
					<ul class="sche">
						<li><a href="?mode=L"><img
								src="/resources/images/perform/schedtab_01_ov.gif" alt="월간일정"></a></li>
						<li><a href="?mode=Y&amp;year=2019"><img
								src="/resources/images/perform/schedtab_02_out.gif" alt="년간일정"></a></li>
					</ul>
					<div id="month">
						<strong></strong>
						<div class="cal">

							<div class="Tripcalendar">
								<p class="month">
									2019. 07 <span class="prev"><a
										href="/html/kr/performance/performance_010101.html?year=2019&amp;mon=06&amp;linkid=&amp;site_dvs_cd=kr&amp;menu_dvs_cd=010101"><img
											src="/resources/images/perform/month_arrow1.gif" alt="이전달"></a></span>
									<span class="next"><a
										href="/html/kr/performance/performance_010101.html?year=2019&amp;mon=08&amp;linkid=&amp;site_dvs_cd=kr&amp;menu_dvs_cd=010101"><img
											src="/resources/images/perform/month_arrow2.gif" alt="다음달"></a></span>
								</p>
								<table cellpadding="0" cellspacing="0" border="0"
									summary="공연현황입니다.">
									<caption>공연현황</caption>
									<thead>
										<tr>
											<th scope="col"><img
												src="/resources/images/perform/w_sun.gif" alt="일"></th>
											<th scope="col"><img
												src="/resources/images/perform/w_mon.gif" alt="월"></th>
											<th scope="col"><img
												src="/resources/images/perform/w_tue.gif" alt="화"></th>
											<th scope="col"><img
												src="/resources/images/perform/w_wed.gif" alt="수"></th>
											<th scope="col"><img
												src="/resources/images/perform/w_thr.gif" alt="목"></th>
											<th scope="col"><img
												src="/resources/images/perform/w_fri.gif" alt="금"></th>
											<th scope="col"><img
												src="/resources/images/perform/w_sat.gif" alt="토"></th>
										</tr>
									</thead>


									<tbody>
										<tr>
											<td></td>
											<td class="mon"><a
												href="/html/kr/performance/performance_010101.html?year=2019&amp;mon=07&amp;day=1&amp;mchk=y&amp;site_dvs_cd=kr&amp;menu_dvs_cd=010101">1</a></td>
											<td class=""><a
												href="/html/kr/performance/performance_010101.html?year=2019&amp;mon=07&amp;day=2&amp;mchk=&amp;site_dvs_cd=kr&amp;menu_dvs_cd=010101">2</a></td>
											<td class=""><a
												href="/html/kr/performance/performance_010101.html?year=2019&amp;mon=07&amp;day=3&amp;mchk=&amp;site_dvs_cd=kr&amp;menu_dvs_cd=010101">3</a></td>
											<td class="bold"><a
												href="/html/kr/performance/performance_010101.html?year=2019&amp;mon=07&amp;day=4&amp;mchk=&amp;site_dvs_cd=kr&amp;menu_dvs_cd=010101">4</a></td>
											<td class=""><a
												href="/html/kr/performance/performance_010101.html?year=2019&amp;mon=07&amp;day=5&amp;mchk=&amp;site_dvs_cd=kr&amp;menu_dvs_cd=010101">5</a></td>
											<td class="sat"><a
												href="/html/kr/performance/performance_010101.html?year=2019&amp;mon=07&amp;day=6&amp;mchk=&amp;site_dvs_cd=kr&amp;menu_dvs_cd=010101">6</a></td>
										</tr>

										<tr>
											<td class="sun"><a
												href="/html/kr/performance/performance_010101.html?year=2019&amp;mon=07&amp;day=7&amp;mchk=&amp;site_dvs_cd=kr&amp;menu_dvs_cd=010101">7</a></td>
											<td class="mon"><a
												href="/html/kr/performance/performance_010101.html?year=2019&amp;mon=07&amp;day=8&amp;mchk=y&amp;site_dvs_cd=kr&amp;menu_dvs_cd=010101">8</a></td>
											<td class=""><a
												href="/html/kr/performance/performance_010101.html?year=2019&amp;mon=07&amp;day=9&amp;mchk=&amp;site_dvs_cd=kr&amp;menu_dvs_cd=010101">9</a></td>
											<td class=""><a
												href="/html/kr/performance/performance_010101.html?year=2019&amp;mon=07&amp;day=10&amp;mchk=&amp;site_dvs_cd=kr&amp;menu_dvs_cd=010101">10</a></td>
											<td class=""><a
												href="/html/kr/performance/performance_010101.html?year=2019&amp;mon=07&amp;day=11&amp;mchk=&amp;site_dvs_cd=kr&amp;menu_dvs_cd=010101">11</a></td>
											<td class=""><a
												href="/html/kr/performance/performance_010101.html?year=2019&amp;mon=07&amp;day=12&amp;mchk=&amp;site_dvs_cd=kr&amp;menu_dvs_cd=010101">12</a></td>
											<td class="sat"><a
												href="/html/kr/performance/performance_010101.html?year=2019&amp;mon=07&amp;day=13&amp;mchk=&amp;site_dvs_cd=kr&amp;menu_dvs_cd=010101">13</a></td>
										</tr>

										<tr>
											<td class="sun"><a
												href="/html/kr/performance/performance_010101.html?year=2019&amp;mon=07&amp;day=14&amp;mchk=&amp;site_dvs_cd=kr&amp;menu_dvs_cd=010101">14</a></td>
											<td class="mon"><a
												href="/html/kr/performance/performance_010101.html?year=2019&amp;mon=07&amp;day=15&amp;mchk=y&amp;site_dvs_cd=kr&amp;menu_dvs_cd=010101">15</a></td>
											<td class=""><a
												href="/html/kr/performance/performance_010101.html?year=2019&amp;mon=07&amp;day=16&amp;mchk=&amp;site_dvs_cd=kr&amp;menu_dvs_cd=010101">16</a></td>
											<td class=""><a
												href="/html/kr/performance/performance_010101.html?year=2019&amp;mon=07&amp;day=17&amp;mchk=&amp;site_dvs_cd=kr&amp;menu_dvs_cd=010101">17</a></td>
											<td class=""><a
												href="/html/kr/performance/performance_010101.html?year=2019&amp;mon=07&amp;day=18&amp;mchk=&amp;site_dvs_cd=kr&amp;menu_dvs_cd=010101">18</a></td>
											<td class=""><a
												href="/html/kr/performance/performance_010101.html?year=2019&amp;mon=07&amp;day=19&amp;mchk=&amp;site_dvs_cd=kr&amp;menu_dvs_cd=010101">19</a></td>
											<td class="sat"><a
												href="/html/kr/performance/performance_010101.html?year=2019&amp;mon=07&amp;day=20&amp;mchk=&amp;site_dvs_cd=kr&amp;menu_dvs_cd=010101">20</a></td>
										</tr>

										<tr>
											<td class="sun"><a
												href="/html/kr/performance/performance_010101.html?year=2019&amp;mon=07&amp;day=21&amp;mchk=&amp;site_dvs_cd=kr&amp;menu_dvs_cd=010101">21</a></td>
											<td class="mon"><a
												href="/html/kr/performance/performance_010101.html?year=2019&amp;mon=07&amp;day=22&amp;mchk=y&amp;site_dvs_cd=kr&amp;menu_dvs_cd=010101">22</a></td>
											<td class=""><a
												href="/html/kr/performance/performance_010101.html?year=2019&amp;mon=07&amp;day=23&amp;mchk=&amp;site_dvs_cd=kr&amp;menu_dvs_cd=010101">23</a></td>
											<td class=""><a
												href="/html/kr/performance/performance_010101.html?year=2019&amp;mon=07&amp;day=24&amp;mchk=&amp;site_dvs_cd=kr&amp;menu_dvs_cd=010101">24</a></td>
											<td class=""><a
												href="/html/kr/performance/performance_010101.html?year=2019&amp;mon=07&amp;day=25&amp;mchk=&amp;site_dvs_cd=kr&amp;menu_dvs_cd=010101">25</a></td>
											<td class=""><a
												href="/html/kr/performance/performance_010101.html?year=2019&amp;mon=07&amp;day=26&amp;mchk=&amp;site_dvs_cd=kr&amp;menu_dvs_cd=010101">26</a></td>
											<td class="sat"><a
												href="/html/kr/performance/performance_010101.html?year=2019&amp;mon=07&amp;day=27&amp;mchk=&amp;site_dvs_cd=kr&amp;menu_dvs_cd=010101">27</a></td>
										</tr>

										<tr>
											<td class="sun"><a
												href="/html/kr/performance/performance_010101.html?year=2019&amp;mon=07&amp;day=28&amp;mchk=&amp;site_dvs_cd=kr&amp;menu_dvs_cd=010101">28</a></td>
											<td class="mon"><a
												href="/html/kr/performance/performance_010101.html?year=2019&amp;mon=07&amp;day=29&amp;mchk=y&amp;site_dvs_cd=kr&amp;menu_dvs_cd=010101">29</a></td>
											<td class=""><a
												href="/html/kr/performance/performance_010101.html?year=2019&amp;mon=07&amp;day=30&amp;mchk=&amp;site_dvs_cd=kr&amp;menu_dvs_cd=010101">30</a></td>
											<td class=""><a
												href="/html/kr/performance/performance_010101.html?year=2019&amp;mon=07&amp;day=31&amp;mchk=&amp;site_dvs_cd=kr&amp;menu_dvs_cd=010101">31</a></td>
											<td class=""><a
												href="/html/kr/performance/performance_010101.html?year=2019&amp;mon=07&amp;day=&amp;mchk=&amp;site_dvs_cd=kr&amp;menu_dvs_cd=010101"></a></td>
											<td class=""><a
												href="/html/kr/performance/performance_010101.html?year=2019&amp;mon=07&amp;day=&amp;mchk=&amp;site_dvs_cd=kr&amp;menu_dvs_cd=010101"></a></td>
											<td class="sat"><a
												href="/html/kr/performance/performance_010101.html?year=2019&amp;mon=07&amp;day=&amp;mchk=&amp;site_dvs_cd=kr&amp;menu_dvs_cd=010101"></a></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="contTop">
								<h4>오늘의 일정</h4>
								<p class="dayText">2019년 07월 04일 공연일정입니다.</p>
								<ul>
									<li><a
										href="/html/kr/performance/performance_010101.html?mode=V&amp;code=3127">2019
											앙상블 소토보체 정기연주회 <gloria -="" vivaldi=""></gloria>
									</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
<!-- 
				<div id="performanceTab">
					<a
						href="/html/kr/performance/performance_010101.html?yearMonth=2019-07"
						rel="ov"><img
						src="/resources/images/perform/perfortab_01_out.gif" alt="전체공연"></a>
					<a
						href="/html/kr/performance/performance_010101.html?yearMonth=2019-07&amp;genrecode=1"
						rel="ov"><img
						src="http://www.djac.or.kr/resources/images/perform/perfortab_02_out.gif"
						alt="음악"></a> <a
						href="/html/kr/performance/performance_010101.html?yearMonth=2019-07&amp;genrecode=2"
						rel="ov"><img
						src="/resources/images/perform/perfortab_03_out.gif" alt="연극"></a>
					<a
						href="/html/kr/performance/performance_010101.html?yearMonth=2019-07&amp;genrecode=3"
						rel="ov"><img
						src="/resources/images/perform/perfortab_04_out.gif" alt="뮤지컬"></a>
					<a
						href="/html/kr/performance/performance_010101.html?yearMonth=2019-07&amp;genrecode=4"
						rel="ov"><img
						src="/resources/images/perform/perfortab_05_out.gif" alt="오페라"></a>
					<a
						href="/html/kr/performance/performance_010101.html?yearMonth=2019-07&amp;genrecode=5"
						rel="ov"><img
						src="/resources/images/perform/perfortab_06_out.gif" alt="무용"></a><br>
					<a
						href="/html/kr/performance/performance_010101.html?yearMonth=2019-07&amp;genrecode=6"
						rel="ov"><img
						src="http://www.djac.or.kr/resources/images/perform/perfortab_07_out.gif"
						alt="기획공연"></a> <a
						href="/html/kr/performance/performance_010101.html?yearMonth=2019-07&amp;genrecode=7"
						rel="ov"><img
						src="/resources/images/perform/perfortab_08_out.gif" alt="공동기획"></a>
					<a
						href="/html/kr/performance/performance_010101.html?yearMonth=2019-07&amp;genrecode=8"
						rel="ov"><img
						src="/resources/images/perform/perfortab_09_out.gif" alt="대관공연"></a>
					<a
						href="/html/kr/performance/performance_010101.html?yearMonth=2019-07&amp;genrecode=9"
						rel="ov"><img
						src="/resources/images/perform/perfortab_10_out.gif" alt="시립예술단공연"></a>
				</div>
				 -->
				<h4>07월공연</h4>

				<ul id="schedulePerformance">
				<c:forEach items="${PFGBoardList }" var="PFGBoard">
					<li><span><img
							src="/resources/images/perform/performimg.jpg"
							style="width: 123px" alt="${PFGBoard.title }"></span>
						<dl>
							<dt>
								${PFGBoard.title }
								<gloria -="" vivaldi=""></gloria>
							</dt>
							<dd>
								<strong>공연구분 및 장소 : </strong>${PFGBoard.divi } / 대전예술의전당 아트홀
							</dd>
							<dd>
								<strong>공연일시 : </strong>${PFGBoard.rundate }/1일 1회
							</dd>
							<dd>
								<strong>공연시간 : </strong>${PFGBoard.starttime }
							</dd>
							<dd>
								<strong>티켓정보 : </strong>R석 3만원, S석 2만원, A석 만원
							</dd>
							<dd>
								<strong>할인정보 : </strong>예당 유료회원 예매 시 10%할인(법인 50매, 골드 4매, 블루2매)
							</dd>
							<dd>
								<strong>관람등급 : </strong>8세 이상 입장 가능합니다.
							</dd>
						</dl>
						<div class="clear"></div>
						<p class="more">
							<a href="#total"
								onclick="javascript:INTER_Login_check('L2h0bWwva3IvcGVyZm9ybWFuY2UvcGVyZm9ybWFuY2VfMDEwMTAxLmh0bWw/bW9kZT1WJmNvZGU9MzEyNw==');"><img
								src="/resources/images/perform/more.gif"
								alt="${PFGBoard.title } 공연예매"></a>
						</p>
						<p class="reser">
							<a
								href="detail/${PFGBoard.pfg_code }"><img
								src="/resources/images/perform/reser.gif"
								alt="${PFGBoard.title } 상세보기"></a>

						</p></li>
					</c:forEach>
				</ul>


				<div class="pageNum">
					<div class="tblPage">
						<span>[1]</span><a
							href="?year=2019&amp;mon=07&amp;genrecode=&amp;site_dvs_cd=kr&amp;menu_dvs_cd=010101&amp;skey=&amp;sval=&amp;GotoPage=2">2</a>
						<a
							href="?year=2019&amp;mon=07&amp;genrecode=&amp;site_dvs_cd=kr&amp;menu_dvs_cd=010101&amp;skey=&amp;sval=&amp;GotoPage=3">3</a>
					</div>
				</div>

				<h4>지난 공연</h4>
				<ul id="schedulePerformance">

					<li><span><img
							src="/upload/performance/performance_1_155859349768625_2079534649.jpg"
							style="width: 123px" alt="한현진 바이올린 독주회"></span>
						<dl>
							<dt>한현진 바이올린 독주회</dt>
							<dd>
								<strong>공연구분 및 장소 : </strong> 대관공연 / 대전예술의전당 앙상블홀
							</dd>
							<dd>
								<strong>공연일시 : </strong>2019년 7월 3일, 수요일 1회
							</dd>
							<dd>
								<strong>공연시간 : </strong>19:30
							</dd>
							<dd>
								<strong>티켓정보 : </strong>전석 1만원
							</dd>
							<dd>
								<strong>할인정보 : </strong>예매시 10%(※당일할인없음) 장애인 및 국가유공자 본인 50%할인
								(신...
							</dd>
							<dd>
								<strong>관람등급 : </strong>초등학생 이상
							</dd>
						</dl>
						<div class="clear"></div>
						<p class="reser">
							<a
								href="/html/kr/performance/performance_010101.html?mode=V&amp;code=3138&amp;year=2019&amp;mon=07&amp;genrecode=&amp;site_dvs_cd=kr&amp;menu_dvs_cd=010101&amp;skey=&amp;sval=&amp;GotoPage="><img
								src="/resources/images/perform/reser.gif" alt="한현진 바이올린 독주회 상세보기"></a>

						</p></li>
				</ul>

			</div>

		</div>
		<!--quick  -->
		<%@ include file="/WEB-INF/views/board//commons/quick.jsp"%>
		<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

	</div>
	<!-- //container -->
</div>

<script>
	$("input#regist").on('click',function(e){
		
		
	});

</script>