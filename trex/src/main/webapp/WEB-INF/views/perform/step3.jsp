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
	<input type="hidden" name="pf_code" value="${pf_code }" id="pf_code" />
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
							src="//ticketimage.interpark.com/TicketImage/onestop/05_step_01_off.gif"
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
							src="//ticketimage.interpark.com/TicketImage/onestop/05_step_04_on.gif"
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
				<div class="iframe"
					style="width: 637; height: 493; background: white;">

					<form name="formDelivery" action="./form" method="post" id="payform">
						<input type ="hidden" value="${loginUser.mem_id }"/>
						<input type="hidden" name="pf_code" value="${pf_code }" id="pf_code" />
						<input type="hidden" name="pfsh_code" value="${PfRese.pfsh_code }" id="pfsh_code" />
						
						<input type="hidden" id="ExpressYN" name="ExpressYN" value="N">
						<div class="contFrame frameBg1">
							<div class="deliveryL">
								<div class="delivery_select">
									<h3 class="title">
										<img
											src="//ticketimage.interpark.com/TicketImage/onestop/stit_delivery_01.gif"
											alt="배송방법선택">
									</h3>
									<table>
										<caption>배송종류</caption>
										<tbody>
											<tr id="Delivery_24000" name="Delivery_24000"
												class="selected">
												<td><input type="radio" class="chk" id="Delivery"
													name="Delivery" value="24000" onclick="fnChange()"><label
													for="Delivery_24000" onclick="fnSetDelivery('24000')">현장수령</label></td>
											</tr>
										</tbody>
									</table>
									<div class="info">
										<div id="DeliveryInfo_24000" class="inner" style="">
											<p class="sel">
												티켓현장수령은 예매시 부여되는 <em>"예약번호"로 <br>관람일 당일 티켓을 수령하여
													입장합니다.
												</em><img
													src="//ticketimage.interpark.com/TicketImage/onestop/icon_delivery.gif"
													alt="현장수령시 유의사항 더보기" class="que"
													onmouseover="showlayernormalclick('lay_sel1');"
													onmouseout="showlayernormalclick('lay_sel1');">
											</p>
										</div>
									</div>
								</div>
								<!-- delivery_select //-->
							</div>
							<!-- deliveryL //-->

							<div class="deliveryR">
								<div class="scrollY">
									<div class="orderer">
										<h3 class="title">
											<img
												src="//ticketimage.interpark.com/TicketImage/onestop/stit_delivery_03.gif"
												alt="주문자확인">
										</h3>
										<table>
											<caption>주문자정보 입력</caption>
											<colgroup>
												<col width="80px">
												<col width="*">
											</colgroup>
											<tbody>
												<tr class="fir">
													<th><label for="userid">아이디</label></th>

													<td>${loginUser.mem_id }
													<input name='userid' type="hidden" id="userid" value="${loginUser.mem_id }"></td>

												</tr>
													<input name='sndAmount' type="hidden" id="sndAmount" value="${price }"></td>
												<tr>
													<th><label for="sndOrdername">구매자</label></th>
													<td>${gmem.name }
													<input name='sndOrdername' type="hidden" id="sndOrdername" value="${gmem.name }"></td>
													
												</tr>
												<tr>
													<th><label for="sndEmail">Email</label></th>
													<td>${loginUser.mem_email }
													<input name='sndEmail' type="hidden" id="sndEmail" value="${loginUser.mem_email }"></td>
													
												</tr>
												<tr>
													<th><label for="sndMoblie">연락처</label></th>
													<td>${gmem.tell }
													<input name=sndMobile type="hidden" id="sndMobile" value="${gmem.tell }"></td>
													
												</tr>
												<tr>
													<input type="hidden" name="setSndOrderNumber" value="${pay_code }" />
													<input type="hidden" name="sndGoodname" value="${pf_name }" />
													<td colspan="2" class="fs">SMS 문자와 이메일로 예매 정보를 보내드립니다.<span
														class="select"> <!--<input type="radio" class="chk" id="EmailOrNotY" value="Y" checked/><label>예</label><input type="radio" class="chk" id="EmailOrNotN" value="N" disabled/><label>아니오</label>--></span></td>
												</tr>
											</tbody>
										</table>
									</div>
									<!-- orderer //-->
								</div>
												<!-- <form action="credit/form" method="post">
													상품명 : <input type='text' name='sndGoodname' value='당근10kg'
														size='30'> </br> 가격 : <input type='text'
														name='sndAmount' value='1004' size='15' maxlength='9'>
													</br> 구매자 : <input type='text' name='sndOrdername' value='김토끼'
														size='30'> </br> Email : <input type='text'
														name='sndEmail' value='kspay@carrot.co.kr' size='30'>
													</br> 전화번호 : <input type='text' name='sndMoblie'
														value='01112341234' size='12' maxlength='12'> </br> 배송지
													: <input type='text' name='sndAddress' value='대전시 서구 둔산동' /></br>
													<input type='submit' value="전송" />
												</form> -->
							</div>
							<!-- deliveryR //-->
						</div>
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
							src="//ticketimage.interpark.com/Play/image/large/19/19010428_p.gif"
							width="87" height="106" alt="제19회 대전국제음악제〈IMK 트리오，비엔나〉 포스터"
							onerror="this.src='http://ticketimage.interpark.com/TicketImage/onestop/no_image.gif'"></a>
					</div>
					<div class="exp">
						<em><span title="제19회 대전국제음악제〈IMK 트리오，비엔나〉"><a
								href="#19010428" target="_blank">제19회 대전국제음악제〈IMK 트리오，비엔나〉</a></span></em>
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
								${rdate }
								</span></td>
							</tr>
							<tr id="MyRow2">
								<th>선택좌석<br>(<span id="MySelectedSeatCnt"
									name="MySelectedSeatCnt">0</span>석)
								</th>
								<td class="seat">
									<div class="scrollY">
										<ul>
											<span id="MySelectedSeat" name="MySelectedSeat">
											<c:forEach items="${seat }" var="seat">
												<li>${seat}</li>
											</c:forEach>
											</span>
										</ul>
									</div>
								</td>
							</tr>
							<tr id="MyRow3">
								<th>티켓금액</th>
								<td><span id="MyTicketAmt" name="MyTicketAmt" title="">${price }</span></td>
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
								<td><span id="sndAmount" name="sndAmount"><strong>${price }
									</strong> 원</span></td>
							</tr>
						</tbody>
					</table>
					<p class="btn" id="LargeNextBtn" style="display:;">
						<a href="javascript:fnNextStep('P');" onClick="goPay()" id="LargeNextBtnLink"
							title="다음단계 페이지 이동" data-url="sample2"><img
							src="//ticketimage.interpark.com/TicketImage/onestop/btn_buy.gif"
							alt="다음단계" id="LargeNextBtnImage"> </a>
					</p>

					<p class="btn" id="LargeProcBtn" style="display: none;">
						<img
							src="//ticketimage.interpark.com/TicketImage/onestop/loading_2.gif"
							alt="잠시만 기다려주세요">
					</p>
					<!-- <p class="btn" id="SmallNextBtn" style="display: none;">
						<a href="javascript:fnPrevStep();" id="SmallPrevBtnLink"
							title="이전단계 페이지 이동"><img
							src="//ticketimage.interpark.com/TicketImage/onestop/btn_pre.gif"
							alt="이전단계" id="SmallPrevBtnImage"></a><a
							href="javascript:fnNextStep('P');" id="SmallNextBtnLink"
							title="다음단계 페이지 이동"><img
							src="//ticketimage.interpark.com/TicketImage/onestop/btn_next_02.gif"
							alt="다음단계" id="SmallNextBtnImage"></a>
					</p> -->
				</div>

				<input type="hidden" id="sndOrderNumber" value="주문번호" /> 
				<input type="hidden" id="sndGoodname" value="상품명" /> 
				<input type="hidden" id="sndOrdername" value="주문자명" /> 
				<input type="hidden" id="sndAmount" value="가격" /> 
				<input type="hidden" id="sndEmail" value="이메일" /> 
				<input type="hidden" id="sndMobile" value="전화번호" />
				
				<script>
					/* $('#LargeNextBtnLink').on(
							'click',
							function(e) {
								e.preventDefault();
								alert($(this).attr('data-url'));
								$('#ifrmBookStep').attr('src',
										$(this).attr('data-url'));

							}); */
							/* $('#LargeNextBtnLink').on('click',function(){
							alert("아이디 : ${gmem.name}");
							
								}); */ 
							
							function goPay(){
								var gsWin = window.open('about:blank','payview','width=560px,height=629px;')
								var form = document.formDelivery;
								form.action = "/credit/form";
								form.target ="payview";
								form.method ="post";
								form.submit();
								
							}
							
				</script>
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
</div>
