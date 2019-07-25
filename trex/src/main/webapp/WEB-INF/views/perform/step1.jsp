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
	
	
	<form id="trexinfo" name = "trexinfo" action="step2" method="get">
		<input type ="hidden" name ="mem_id" value="${loginUser.mem_id }"/>
		<input type="hidden" name="pf_code" value="${pf_code }" id="pf_code" />
	
					
	</form>
	<div id="divBookMain" name="divBookMain" class="wrap">
		<!-- //Header -->
		<div class="headWrap">
			<h1 class="title" style="color:white; font-size: 20px;">
			T-rex 티켓
				<!-- <img
					src="//ticketimage.interpark.com/TicketImage/onestop/dj_title.gif"
					alt="대전예술의전당 티켓"> -->
			</h1>

			<span class="ad03" style="display: none" id="OtherPlaySeq"> <em>다른
					관람일자 선택 </em>
				<div class="selectLtBg">
					<select style="width: 150px;" id="SelPlayDate" name="SelPlayDate"
						onchange="fnOtherPlaySeqSelect()">
						<option value="20190819">2019년 08월 19일(월)</option>
					</select>
				</div>
			</span>

		</div>
		<!-- headWrap //-->
		<!-- Header //-->
		<div class="contWrap">
			<!-- //Navigation -->
			<!-- //5step -->
			<div class="step">
				<ul>
					<li class="fir s1"><a style="cursor: default;" id="NaviLink"
						name="NaviLink" href="#" bookstep="1" onfocus="this.blur();"
						title="관람일/회차선택 페이지이동"><img id="NaviImg" name="NaviImg"
							src="//ticketimage.interpark.com/TicketImage/onestop/05_step_01_on.gif"
							alt="관람일/회차선택"></a></li>
					<li class="s2"><a style="cursor: default" id="NaviLink"
						name="NaviLink" href="#" bookstep="2" onfocus="this.blur();"
						title="좌석선택 페이지이동"><img id="NaviImg" name="NaviImg"
							src="//ticketimage.interpark.com/TicketImage/onestop/05_step_02_off.gif"
							alt="좌석 선택"></a></li>
					<!-- <li class="s3"><a style="cursor: default;" id="NaviLink"
						name="NaviLink" href="#" bookstep="3" onfocus="this.blur();"
						title="가격/할인선택 페이지이동"><img id="NaviImg" name="NaviImg"
							src="//ticketimage.interpark.com/TicketImage/onestop/05_step_03_off.gif"
							alt="가격/할인선택"></a></li> -->
					<li class="s3"><a style="cursor: default;" id="NaviLink"
						name="NaviLink" href="#" bookstep="3" onfocus="this.blur();"
						title="배송선택/주문자확인 페이지이동"><img id="NaviImg" name="NaviImg"
							src="//ticketimage.interpark.com/TicketImage/onestop/05_step_04_off.gif"
							alt="배송선택/주문자확인"></a></li>
					<li class="s4"><a style="cursor: default;" id="NaviLink"
						name="NaviLink" href="#" bookstep="4" onfocus="this.blur();"
						title="결제하기 페이지이동"><img id="NaviImg" name="NaviImg"
							src="//ticketimage.interpark.com/TicketImage/onestop/05_step_05_off.gif"
							alt="결제하기"></a></li>
				</ul>
			</div>
			<!-- 5step //-->

			<!-- Navigation //-->

			<!-- //Process 영역 -->
			<div class="contL">
				<div class="iframe" style="width: 637; height: 493; background: white;">
					<c:forEach items="${PFSHViewList }" var="PFSHView">

						<input type="hidden" id="rundate" pfsh_code="${PFSHView.pfsh_code }" value='<fmt:formatDate value="${PFSHView.rundate }" pattern="yyyyMMdd"/>' />

					</c:forEach>
					
					<div class="contFrame frameBg6">
						<!-- //관람일 선택 -->
						<div class="watch_select">
							<h3 class="title2">
								<img
									src="//ticketimage.interpark.com/TicketImage/onestop/stit_date.gif"
									alt="관람일선택">
							</h3>

							<div class="calHead">
								<div class="month">
									<span class="prev"> <img style="display: none;"
										src="//ticketimage.interpark.com/TicketImage/onestop/arrow_gr_prev.gif"
										alt="이전달로 이동" onclick='prev();'>


									</span> <span id="calendarYM"><em></em>년 <em></em>월</span> <span
										class="next"> <!-- <a
						href="javascript:fnChangeMonth('201909');"> --> <img
										src="//ticketimage.interpark.com/TicketImage/onestop/arrow_gr_next.gif"
										alt="다음달로 이동" onclick='next();'> <!-- </a> -->
									</span>
								</div>
							</div>


							<div class="calCont">
								<table id="calendar">
									<caption>관람일 선택 달력</caption>
									<thead>
										<tr>

											<th class="sun">일</th>
											<th>월</th>
											<th>화</th>
											<th>수</th>
											<th>목</th>
											<th>금</th>
											<th>토</th>
										</tr>
									</thead>
									<tbody>


									</tbody>
								</table>
							</div>
							<div class="calBtm">
								<p>
									<span class="info1"><span class="blind">링크 표시 날짜는
									</span>예매 가능일</span> <span class="info2"><span class="blind">굵은
											표시 날짜는 </span>선택한 관람일</span>
								</p>
								<p>
									<span class="info3">예매가능시간 : 관람 3시간전</span>
								</p>
							</div>

						</div>
						<!-- watch_select //-->
						<!-- 관람일 선택 //-->

						<div class="arrow"></div>
						<!-- arrow //-->
						<!-- ver 1 -->
						<div class="ver1">
							<div class="watch_time">
								<h3 class="title2">
									<img
										src="//ticketimage.interpark.com/TicketImage/onestop/stit_watch.gif"
										alt="관람시간">
								</h3>
								<div class="scrollY">
									<span id="TagPlaySeq" name="TagPlaySeq">
										<div class="none">
											먼저 관람일을<br>선택해 주세요.
										</div>
									</span>
								</div>
							</div>

							<div id="RemainArea">
								<div class="watch_info">
									<h3 class="stit">
										<img
											src="//ticketimage.interpark.com/TicketImage/onestop/stit_seat.gif"
											alt="좌석등급과 잔여석">
									</h3>
									<div class="scrollY">
										<span id="TagRemainSeat" name="TagRemainSeat"><div class="none">
												회차 선택 후<br>확인 가능 합니다.
											</div></span>
									</div>
								</div>
							</div>
						</div>
						<!-- ver 1 //-->
						<!-- //유의사항 -->
						<div class="watch_note">
							<h3 class="stit">
								<img
									src="//ticketimage.interpark.com/TicketImage/onestop/stit_note.gif"
									alt="예매시 유의사항">
							</h3>
							<ul>

								<li>장애인, 국가유공자 할인등급의 경우 현장수령만 가능합니다.<br>장애인등록증이나 복지카드
									확인 후 티켓을 배부합니다. 미지참시 할인혜택을 받으실 수 없습니다.
								</li>
								<li>관람일 전일 아래시간까지만 취소 가능합니다.<br> - 공연전일 평일/일요일/공휴일 오후
									5시, 토요일 오전 11시 (단,토요일이 공휴일인 경우는 오전 11시)<br> - 취소수수료와
									취소가능일자는 상품별로 다르니, 오른쪽 하단 My예매정보를 확인해주시기 바랍니다.
								</li>
								<li>ATM기기로는 가상계좌입금이 안 되는 경우가 있으니 무통장 입금 고객님들은 인터넷 뱅킹, 폰뱅킹이
									어려우시면 다른 결제수단을 선택해 주시기 바랍니다.</li>


							</ul>
						</div>
						<!-- watch_note //-->
						<!-- 유의사항 //-->
						<!-- //출연진 -->
						<div class="CastingInfo" id="CastingInfoDiv"
							style="display: none;">
							<span id="CastingInfoName"></span> <a href="javascript:;"
								class="btnMore" onclick="fnCastingShow(true)"><span>더보기</span></a>
						</div>
						<!-- 출연진 //-->
						<!-- //캐스팅 레이어 -->
						<div class="CastingLayer" style="display: none;"
							id="CastingListDiv">
							<div class="ctTitle">
								<a href="javascript:;" class="btn_close"
									onclick="fnCastingShow(false)"><span>레이어닫기</span></a> <span
									id="CastingDateInfo"></span> <a
									href="/Ticket/Goods/CastingBridge.asp?GoodsCode=19000479"
									class="btn_more" target="_blank"><span>모든 출연진 보기</span></a>
							</div>
							<ul class="ctList">
								<span id="CastingList"></span>
							</ul>
							<p class="ctNotice">* 캐스팅 일정은 배우 및 제작사의 사정에 따라 사전공지 없이 변경될 수
								있습니다.</p>
						</div>
						<!-- 캐스팅 레이어 //-->
					</div>
					
					
					 	<form id="formCalendar" name="formCalendar" method="get"
		action="BookDateTime.asp">
		<input type="hidden" id="GoodsCode" name="GoodsCode" value="19000479">
		<input type="hidden" id="PlaceCode" name="PlaceCode" value="09000028">
		<input type="hidden" id="OnlyDeliver" name="OnlyDeliver" value="68004">
		<input type="hidden" id="DBDay" name="DBDay" value="12"> <input
			type="hidden" id="ExpressDelyDay" name="ExpressDelyDay" value="0">
		<input type="hidden" id="YM" name="YM" value="201908"> <input
			type="hidden" id="PlayDate" name="PlayDate" value=""> <input
			type="hidden" id="KindOfGoods" name="KindOfGoods" value="01009">
		<input type="hidden" id="BizCode" name="BizCode" value="08920">
		<input type="hidden" id="Tiki" name="Tiki" value=""> <input
			type="hidden" id="Always" name="Always" value="N"> <input
			type="hidden" id="HotSaleOrNot" name="HotSaleOrNot" value="">
		<input type="hidden" id="PlaySeq" name="PlaySeq" value=""> <input
			type="hidden" id="PlayTime" name="PlayTime" value=""> <input
			type="hidden" id="CancelableDate" name="CancelableDate" value="">
	</form> 


				</div>
			</div>
			<!-- contL //-->
			<!-- Process 영역 //-->
			
			<div class="contR">
				<!-- //상품 정보 -->
				<div class="show_info">
					<div class="image">
						<a href="#19010428" target="_blank"><img
							src="/resources/images/perform/${pf_code }.jpg"
							width="87" height="106" alt="제19회 대전국제음악제〈IMK 트리오，비엔나〉 포스터"
							onerror="this.src='http://ticketimage.interpark.com/TicketImage/onestop/no_image.gif'"></a>
					</div>
					<div class="exp">
						<em><span title="${pf.name }"><a
								href="#" target="_blank">${pf.name }</a></span></em>
						<ul>
							<li>관람시간 : ${pf.runtime }분</li>
						</ul>
					</div>
				</div>
				<!-- 상품 정보 //-->
				<!-- 예매 정보 //-->
				<div class="buy_info">
					<h3 class="title">
						<img
							src="//ticketimage.interpark.com/TicketImage/onestop/tit_buy.gif"
							alt="나의 예매정보 선택현황">
					</h3>
					<table>
						<caption>나의 예매선택현황</caption>
						<colgroup>
							<col width="32%">
							<col width="68%">
						</colgroup>
						<tbody>
							<tr class="fir" id="MyRow1">
								<th>일시</th>
								<td><span id="MyPlayDate" name="MyPlayDate" title="">
									
								</span></td>
							</tr>
							<tr id="MyRow2">
								<th>선택좌석<br>(<span id="MySelectedSeatCnt"
									name="MySelectedSeatCnt">0</span>석)
								</th>
								<td class="seat">
									<div class="scrollY">
										<ul>
											<span id="MySelectedSeat" name="MySelectedSeat"></span>
										</ul>
									</div>
								</td>
							</tr>
							<tr id="MyRow3">
								<th>티켓금액</th>
								<td><span id="MyTicketAmt" name="MyTicketAmt" title=""></span></td>
							</tr>
							<tr id="MyRow4">
								<th>수수료</th>
								<td><span id="MyUseAmt" name="MyUseAmt" title=""></span></td>
							</tr>
							<tr id="MyRow5">
								<th>배송료</th>
								<td><div class="skip">
										<span id="MyDeliveryAmt" name="MyDeliveryAmt" title=""></span>
									</div></td>
							</tr>
							<tr id="MyRow6">
								<th>할인</th>
								<td><div class="skip">
										<span id="MyDiscount" name="MyDiscount" title=""></span>
									</div></td>
							</tr>
							<tr class="line1" style="display: none;" id="MyRow7">
								<th>할인쿠폰</th>
								<td><div class="skip">
										<span id="MyCoupon" name="MyCoupon" title=""></span>
									</div></td>
							</tr>
							<tr id="MyRow8">
								<th>취소기한</th>
								<td class="txt1"><span id="MyCancelableDate"
									name="MyCancelableDate">관람일시 선택 후 확인가능</span></td>
							</tr>
							<tr class="line2" id="MyRow9">
								<th>취소수수료</th>
								<td class="txt1"><span id="MyCancelPenalty"
									name="MyCancelPenalty">관람일시 선택 후 확인가능</span></td>
							</tr>
							<tr class="total">
								<th>총 결제금액</th>
								<td><span id="MyTotalAmt" name="MyTotalAmt"><strong>0</strong>
										원</span></td>
							</tr>
						</tbody>
					</table>
					<p class="btn" id="LargeNextBtn" style="display:;">
						<a href="javascript:fnNextStep('P');" id="LargeNextBtnLink"
							title="다음단계 페이지 이동" data-url="sample2"><img
							src="//ticketimage.interpark.com/TicketImage/onestop/btn_next.gif"
							alt="다음단계" id="LargeNextBtnImage"> </a>
					</p>

					<p class="btn" id="LargeProcBtn" style="display: none;">
						<img
							src="//ticketimage.interpark.com/TicketImage/onestop/loading_2.gif"
							alt="잠시만 기다려주세요">
					</p>
					<p class="btn" id="SmallNextBtn" style="display: none;">
						<a href="javascript:fnPrevStep();" id="SmallPrevBtnLink"
							title="이전단계 페이지 이동"><img
							src="//ticketimage.interpark.com/TicketImage/onestop/btn_pre.gif"
							alt="이전단계" id="SmallPrevBtnImage"></a><a
							href="javascript:fnNextStep('P');" id="SmallNextBtnLink"
							title="다음단계 페이지 이동"><img
							src="//ticketimage.interpark.com/TicketImage/onestop/btn_next_02.gif"
							alt="다음단계" id="SmallNextBtnImage"></a>
					</p>
				</div>
				<!-- <script>
					$('#LargeNextBtnLink').on(
							'click',
							function(e) {
								e.preventDefault();
								/* alert($(this).attr('data-url')); */
								$('#ifrmBookStep').attr('src',
										$(this).attr('data-url'));

							});
				</script> -->
				<!-- 예매 정보 //-->
			</div>
			<!-- contR //-->
		
		</div>
		<!-- contWrap //-->
		<!-- //취소수수료 레이어 -->
		<div class="layerWrap" id="buy_cancel" style="display: none;">
			<span id="cancelNotice"></span>
		</div>
		<!-- 취소수수료 레이어 //-->
		<!-- //검색 결과 레이어 -->
		<div class="search_layer" id="divOtherSearch" style="display: none;">
			<div class="layHead">
				<h2 class="title">검색</h2>
			</div>
			<div class="layCont">
				<div class="scrollY">
					<div class="cont" id="divOtherSearchList"></div>
				</div>
			</div>
			<span class="close"><img
				src="//ticketimage.interpark.com/TicketImage/onestop/btn_lay_close1.gif"
				alt="검색창 닫기" onclick="SearchAC.close_layer();"></span>
		</div>
		<!-- 검색 결과 레이어 //-->
	</div>

	<!-- //container -->
	<%@ include file="./step1_js.jsp"%>
</div>
