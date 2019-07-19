<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css" href="//ticketimage.interpark.com/TicketImage/onestop/css/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<div id="contentswrap">
<!-- 내용채우기 -->
				
				<div id="divBookMain" name="divBookMain" class="wrap">
		<!-- //Header -->
		<div class="headWrap">
			<h1 class="title"><img src="//ticketimage.interpark.com/TicketImage/onestop/dj_title.gif" alt="대전예술의전당 티켓"></h1>
			
			<span class="ad03" style="display:none" id="OtherPlaySeq">
				<em>다른 관람일자 선택 </em>
				<div class="selectLtBg">
					<select style="width:150px;" id="SelPlayDate" name="SelPlayDate" onchange="fnOtherPlaySeqSelect()">
						<option value="20190819">2019년 08월 19일(월)</option>
					</select>
				</div>
			</span>
			
		</div><!-- headWrap //-->
		<!-- Header //-->
		<div class="contWrap">
			<!-- //Navigation -->	
						<!-- //5step -->
			<div class="step">
				<ul>
					<li class="fir s1"><a style="cursor:default;" id="NaviLink" name="NaviLink" href="#" bookstep="1" onfocus="this.blur();" title="관람일/회차선택 페이지이동"><img id="NaviImg" name="NaviImg" src="//ticketimage.interpark.com/TicketImage/onestop/05_step_01_on.gif" alt="관람일/회차선택"></a></li>
					<li class="s2"><a style="cursor:default" id="NaviLink" name="NaviLink" href="#" bookstep="2" onfocus="this.blur();" title="좌석선택 페이지이동"><img id="NaviImg" name="NaviImg" src="//ticketimage.interpark.com/TicketImage/onestop/05_step_02_off.gif" alt="좌석 선택"></a></li>
					<li class="s3"><a style="cursor:default;" id="NaviLink" name="NaviLink" href="#" bookstep="3" onfocus="this.blur();" title="가격/할인선택 페이지이동"><img id="NaviImg" name="NaviImg" src="//ticketimage.interpark.com/TicketImage/onestop/05_step_03_off.gif" alt="가격/할인선택"></a></li>
					<li class="s4"><a style="cursor:default;" id="NaviLink" name="NaviLink" href="#" bookstep="4" onfocus="this.blur();" title="배송선택/주문자확인 페이지이동"><img id="NaviImg" name="NaviImg" src="//ticketimage.interpark.com/TicketImage/onestop/05_step_04_off.gif" alt="배송선택/주문자확인"></a></li>
					<li class="s5"><a style="cursor:default;" id="NaviLink" name="NaviLink" href="#" bookstep="5" onfocus="this.blur();" title="결제하기 페이지이동"><img id="NaviImg" name="NaviImg" src="//ticketimage.interpark.com/TicketImage/onestop/05_step_05_off.gif" alt="결제하기"></a></li>
				</ul>
			</div>
			<!-- 5step //-->

			<!-- Navigation //-->	

			<!-- //Process 영역 -->	
			<div class="contL">
				<iframe id="ifrmBookStep" name="ifrmBookStep" src="sample2" width="637" height="493" frameborder="0" scrolling="no" title="예매정보 선택 페이지" pfcode="${pf_code }"></iframe>
			</div><!-- contL //-->
			<!-- Process 영역 //-->	
			<div class="contR">
				<!-- //상품 정보 -->	
				<div class="show_info">
					<div class="image"><a href="#19010428" target="_blank"><img src="//ticketimage.interpark.com/Play/image/large/19/19010428_p.gif" width="87" height="106" alt="제19회 대전국제음악제〈IMK 트리오，비엔나〉 포스터" onerror="this.src='http://ticketimage.interpark.com/TicketImage/onestop/no_image.gif'"></a></div>
					<div class="exp">
						<em><span title="제19회 대전국제음악제〈IMK 트리오，비엔나〉"><a href="#19010428" target="_blank">제19회 대전국제음악제〈IMK 트리오，비엔나〉</a></span></em>
						<ul>
							<li>2019.08.19 ~ 2019.08.19</li>
							<li><span title="대전예술의전당 앙상블홀">대전예술의전당 앙상...</span></li>
							<li>초등학생이상 관람가</li>
							<li>관람시간 : 90분${pf_code }</li>
						</ul>
					</div>
				</div>
				<!-- 상품 정보 //-->	
				<!-- 예매 정보 //-->	
				<div class="buy_info">
					<h3 class="title"><img src="//ticketimage.interpark.com/TicketImage/onestop/tit_buy.gif" alt="나의 예매정보 선택현황"></h3>
					<table>
						<caption>나의 예매선택현황</caption>
						<colgroup><col width="32%"><col width="68%"></colgroup>
						<tbody>
							<tr class="fir" id="MyRow1">
								<th>일시</th>
								<td><span id="MyPlayDate" name="MyPlayDate" title=""></span></td>
							</tr>
							<tr id="MyRow2">
								<th>선택좌석<br>(<span id="MySelectedSeatCnt" name="MySelectedSeatCnt">0</span>석)</th>
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
								<td><div class="skip"><span id="MyDeliveryAmt" name="MyDeliveryAmt" title=""></span></div></td>
							</tr>
							<tr id="MyRow6">
								<th>할인</th>
								<td><div class="skip"><span id="MyDiscount" name="MyDiscount" title=""></span></div></td>
							</tr>
							<tr class="line1" style="display:none;" id="MyRow7">
								<th>할인쿠폰</th>
								<td><div class="skip"><span id="MyCoupon" name="MyCoupon" title=""></span></div></td>
							</tr>
							<tr id="MyRow8">
								<th>취소기한 </th>
								<td class="txt1"><span id="MyCancelableDate" name="MyCancelableDate">관람일시 선택 후 확인가능</span></td>
							</tr>
							<tr class="line2" id="MyRow9">
								<th>취소수수료 </th>
								<td class="txt1"> <span id="MyCancelPenalty" name="MyCancelPenalty">관람일시 선택 후 확인가능</span></td>
							</tr>
							<tr class="total">
								<th>총 결제금액</th>
								<td><span id="MyTotalAmt" name="MyTotalAmt"><strong>0</strong> 원</span></td>
							</tr>
						</tbody>
					</table>
					<p class="btn" id="LargeNextBtn" style="display:;"><a href="javascript:fnNextStep('P');" id="LargeNextBtnLink" title="다음단계 페이지 이동" data-url="sample2"><img src="//ticketimage.interpark.com/TicketImage/onestop/btn_next.gif" alt="다음단계" id="LargeNextBtnImage"> </a></p>
				
					<p class="btn" id="LargeProcBtn" style="display:none;"><img src="//ticketimage.interpark.com/TicketImage/onestop/loading_2.gif" alt="잠시만 기다려주세요"></p>
 					<p class="btn" id="SmallNextBtn" style="display:none;"><a href="javascript:fnPrevStep();" id="SmallPrevBtnLink" title="이전단계 페이지 이동"><img src="//ticketimage.interpark.com/TicketImage/onestop/btn_pre.gif" alt="이전단계" id="SmallPrevBtnImage"></a><a href="javascript:fnNextStep('P');" id="SmallNextBtnLink" title="다음단계 페이지 이동"><img src="//ticketimage.interpark.com/TicketImage/onestop/btn_next_02.gif" alt="다음단계" id="SmallNextBtnImage"></a></p>
				</div>
				<script>
					$('#LargeNextBtnLink').on('click',function(e){
						e.preventDefault();
						/* alert($(this).attr('data-url')); */
						$('#ifrmBookStep').attr('src',$(this).attr('data-url'));


					});
				
				</script>
				<!-- 예매 정보 //-->	
			</div><!-- contR //-->
		</div><!-- contWrap //-->
		<!-- //취소수수료 레이어 -->
		<div class="layerWrap" id="buy_cancel" style="display:none;"><span id="cancelNotice"></span></div>
		<!-- 취소수수료 레이어 //-->	
		<!-- //검색 결과 레이어 --> 
		<div class="search_layer" id="divOtherSearch" style="display:none;">
			<div class="layHead">
				<h2 class="title">검색</h2>
			</div>
			<div class="layCont">
				<div class="scrollY">
					<div class="cont" id="divOtherSearchList"></div>
				</div>
			</div>
			<span class="close"><img src="//ticketimage.interpark.com/TicketImage/onestop/btn_lay_close1.gif" alt="검색창 닫기" onclick="SearchAC.close_layer();"></span>
		</div>
		<!-- 검색 결과 레이어 //--> 
	</div>

		<!-- //container -->
</div>