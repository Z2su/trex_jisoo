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
			<h1 class="title">
				<img
					src="//ticketimage.interpark.com/TicketImage/onestop/dj_title.gif"
					alt="대전예술의전당 티켓">
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
					<li class="s3"><a style="cursor: default;" id="NaviLink"
						name="NaviLink" href="#" bookstep="3" onfocus="this.blur();"
						title="가격/할인선택 페이지이동"><img id="NaviImg" name="NaviImg"
							src="//ticketimage.interpark.com/TicketImage/onestop/05_step_03_off.gif"
							alt="가격/할인선택"></a></li>
					<li class="s4"><a style="cursor: default;" id="NaviLink"
						name="NaviLink" href="#" bookstep="4" onfocus="this.blur();"
						title="배송선택/주문자확인 페이지이동"><img id="NaviImg" name="NaviImg"
							src="//ticketimage.interpark.com/TicketImage/onestop/05_step_04_off.gif"
							alt="배송선택/주문자확인"></a></li>
					<li class="s5"><a style="cursor: default;" id="NaviLink"
						name="NaviLink" href="#" bookstep="5" onfocus="this.blur();"
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
					
<form name="formDelivery">
<input type="hidden" id="ExpressYN" name="ExpressYN" value="N">
	<div class="contFrame frameBg1">
		<div class="deliveryL">
			<div class="delivery_select">
				<h3 class="title"><img src="//ticketimage.interpark.com/TicketImage/onestop/stit_delivery_01.gif" alt="배송방법선택"></h3>
				<table>
					<caption>배송종류</caption>
					<tbody>
						<tr id="Delivery_24000" name="Delivery_24000" class="selected">
							<td><input type="radio" class="chk" id="Delivery" name="Delivery" value="24000" onclick="fnChange()"><label for="Delivery_24000" onclick="fnSetDelivery('24000')">현장수령</label></td>
						</tr>
						<tr id="Delivery_24001" name="Delivery_24001" class="">
							<td><input type="radio" class="chk" id="Delivery" name="Delivery" value="24001" onclick="fnChange()"><label for="Delivery_24001" onclick="fnSetDelivery('24001')">배송 (2,800원)</label></td>
						</tr>
						<tr id="Delivery_24004" name="Delivery_24004" style="display:none;" class="">
							<td><input type="radio" class="chk" id="Delivery" name="Delivery" value="24004" onclick="fnChange()"><label for="Delivery_24004" onclick="fnSetDelivery('24004')">특급배송 (0원)</label></td>
						</tr>
						<tr id="Delivery_24012" name="Delivery_24012" style="display:none;" class="">
							<td><input type="radio" class="chk" id="Delivery" name="Delivery" value="24012" onclick="fnChange()"><label for="Delivery_24012" onclick="fnSetDelivery('24012')">홈티켓</label></td>
						</tr>
						<tr id="Delivery_24011" name="Delivery_24011" style="display:none;" class="">
							<td><input type="radio" class="chk" id="Delivery" name="Delivery" value="24011" onclick="fnChange()"><label for="Delivery_24011" onclick="fnSetDelivery('24011')">모바일티켓</label></td>
						</tr>
					</tbody>
				</table>
				<div class="info">
					<div id="DeliveryInfo_24000" class="inner" style="">
						<p class="sel">티켓현장수령은 예매시 부여되는 <em>"예약번호"로 <br>관람일 당일 티켓을 수령하여 입장합니다.</em><img src="//ticketimage.interpark.com/TicketImage/onestop/icon_delivery.gif" alt="현장수령시 유의사항 더보기" class="que" onmouseover="showlayernormalclick('lay_sel1');" onmouseout="showlayernormalclick('lay_sel1');"></p>
					</div>
					<!-- 현장수령 //-->
					<div id="DeliveryInfo_24001" class="inner" style="display:none;">
					
						<p class="sel"><em>예매완료(결제익일) 기준 4~5일 이내에 <br>배송</em>됩니다. (주말/공휴일 제외한 영업일기준)<img src="//ticketimage.interpark.com/TicketImage/onestop/icon_delivery.gif" alt="배송시 유의사항 더보기" onmouseover="showlayernormalclick('lay_sel2');" onmouseout="showlayernormalclick('lay_sel2');"><br>*티켓은 묶음배송이 불가합니다.<br>*배송받으신 티켓 분실 시 입장 불가합니다.</p>
					
					</div>
					<!-- 일반배송 //-->
					<div id="DeliveryInfo_24004" class="inner" style="display:none;">
						<p class="sel"><em>예매완료(결제익일) 후 2일 이내에 배송</em>됩니다.<br>특급배송의 경우 지역 사정상 배송이 불가할 수 <br>있습니다.<img src="//ticketimage.interpark.com/TicketImage/onestop/icon_delivery.gif" alt="특급배송시 유의사항 더보기" onmouseover="showlayernormalclick('lay_sel3');" onmouseout="showlayernormalclick('lay_sel3');"><br>*티켓은 묶음배송이 불가합니다.</p>
					</div>
					<!-- 특급배송 //-->
					<div id="DeliveryInfo_24012" class="inner" style="display:none;">
						<p class="sel"><em>홈티켓을 출력하여 현장입구에 설치된 <br>전용단말기에 체크하고 입장</em>하시면 됩니다.<img src="//ticketimage.interpark.com/TicketImage/onestop/icon_delivery.gif" alt="홈티켓 유의사항 더보기" onmouseover="showlayernormalclick('lay_sel4');" onmouseout="showlayernormalclick('lay_sel4');"></p>
					</div>
					<!-- 홈티켓 //-->
					<div id="DeliveryInfo_24011" class="inner" style="display:none;">	
						<p class="sel"><em>본인의 휴대폰으로 전송받은 모바일티켓을 <br>현장입구에설치된 전용 게이트에 체크하고 <br>입장</em>하시면 됩니다.<img src="//ticketimage.interpark.com/TicketImage/onestop/icon_delivery.gif" alt="모바일티켓 유의사항 더보기" onmouseover="showlayernormalclick('lay_sel5');" onmouseout="showlayernormalclick('lay_sel5');"></p>
					</div>
					<!-- 모바일티켓 //-->
				</div>
			</div><!-- delivery_select //-->
			
			<div id="Gift_All" name="Gift_All" class="premium" style="display:none">
				<h3 class="title"><img src="//ticketimage.interpark.com/TicketImage/onestop/stit_delivery_02.gif" alt="티켓프리미엄서비스"></h3>
				<div class="cont">
					<table>
						<caption>티켓포장서비스 선택</caption>
						<tbody>
							<tr>
								<td><input type="radio" class="chk" name="rdoGift" id="rdoGift" value="I7002" disabled="" onclick="javascript:fnChange();"><label for="">기본포장 (500원)</label></td>
							</tr>
							<tr>
								<td><input type="radio" class="chk" name="rdoGift" id="rdoGift" value="I7007" disabled="" onclick="javascript:fnChange();"><label for="">스페셜포장-아이보리 (1,000원)</label></td>
							</tr>
							<tr>
								<td><input type="radio" class="chk" name="rdoGift" id="rdoGift" value="I7006" disabled="" onclick="javascript:fnChange();"><label for="">스페셜포장-퍼플 (1,000원)</label></td>
							</tr>
							<tr>
								<td><input type="radio" class="chk" name="rdoGift" id="rdoGift" value="I7008" disabled="" onclick="javascript:fnChange();"><label for="">기본포장 (TiKi회원무료)</label></td>
							</tr>
							<tr>
								<td><input type="radio" class="chk" name="rdoGift" id="rdoGift" value="" disabled="" onclick="javascript:fnChange();"><label for="">선택안함</label></td>
							</tr>
						</tbody>
					</table>
				</div>
				<span class="btn"><img src="//ticketimage.interpark.com/TicketImage/onestop/btn_preview.gif" alt="티켓포장 미리보기" onclick="showPop('lay_premium');"></span>
			</div><!-- premium //-->		
		</div><!-- deliveryL //-->

		<div class="deliveryR">
			<div class="scrollY">
				<div class="orderer">
					<h3 class="title"><img src="//ticketimage.interpark.com/TicketImage/onestop/stit_delivery_03.gif" alt="주문자확인"></h3>
					<table>
						<caption>주문자정보 입력</caption>
						<colgroup><col width="80px"><col width="*"></colgroup>
						<tbody>
							<tr class="fir">
								<th><label for="MemberName">이름</label></th>
								
								<td>김지수<input type="hidden" id="MemberName" value="김지수"></td>
							
							</tr>
							
							<tr>
								<th><label for="SSN1">생년월일</label></th>
								<td class="form">
									<input id="SSN1" name="SSN1" type="text" style="width:45px;" class="txt1" maxlength="6">  <span style="font-size:11px;">예) 850101 (YYMMDD)</span>
									<input id="SSN2" name="SSN2" type="hidden" value="0000000">
								</td>
							</tr>
							<tr>
								<td colspan="2"><em>현장수령 및 고객문의시 본인확인을 위해 정확한 정보를 입력해주세요.</em></td>
							</tr>							
														
							<tr>
								<th><label for="PhoneNo1">전화번호</label></th>
								<td class="form"><input type="text" id="PhoneNo1" value="02" style="width:36px;" class="txt1" maxlength="3" onkeyup="fnMoveFocus(3, 'PhoneNo1', 'PhoneNo2');">&nbsp;-&nbsp;<input type="text" id="PhoneNo2" value="0000" style="width:41px;" class="txt1" maxlength="4" onkeyup="fnMoveFocus(4, 'PhoneNo2', 'PhoneNo3');">&nbsp;-&nbsp;<input type="text" id="PhoneNo3" value="0000" style="width:41px;" class="txt1" maxlength="4" onkeyup="fnMoveFocus(4, 'PhoneNo3', 'HpNo1');"></td>
							</tr>
							<tr>
								<th><label for="HpNo1">휴대폰</label></th>
								<td class="form"><input type="text" id="HpNo1" value="010" style="width:36px;" class="txt1" maxlength="3" onkeyup="fnMoveFocus(3, 'HpNo1', 'HpNo2');"> - <input type="text" id="HpNo2" value="2343" style="width:41px;" class="txt1" maxlength="4" onkeyup="fnMoveFocus(4, 'HpNo2', 'HpNo3');"> - <input type="text" id="HpNo3" value="5331" style="width:41px;" class="txt1" maxlength="4" onkeyup="fnMoveFocus(4, 'HpNo3', 'Email');"></td>
							</tr>
							<!--<tr>
								<td colspan="2" class="fs">휴대폰 번호로 예매정보를 받으시겠습니까?<span class="select"><input type="radio" class="chk" id="SmsOrNotY" value="Y" checked/><label>예</label><input type="radio" class="chk" id="SmsOrNotN" value="N" disabled/><label>아니오</label></span></td>
							</tr>-->
							<tr>
								<th><label for="Email">이메일</label></th>
								<td class="form"><input type="text" id="Email" value="wltn656@naver.com" style="width:170px;" class="txt1"></td>
								<input type="hidden" id="Zipcode" value="34417">
								<input type="hidden" id="Addr" value="대전광역시 대덕구 비래서로25번길 18">
								<input type="hidden" id="SubAddr" value="1동 302호 (비래동, 영흥빌라)">
							</tr>
							<tr>
								<td colspan="2" class="fs">SMS 문자와 이메일로 예매 정보를 보내드립니다.<span class="select">
								<!--<input type="radio" class="chk" id="EmailOrNotY" value="Y" checked/><label>예</label><input type="radio" class="chk" id="EmailOrNotN" value="N" disabled/><label>아니오</label>--></span></td>
							</tr>							
						</tbody>
					</table>
				</div><!-- orderer //-->
				<div class="deliver" id="DeliveryRow" name="DeliveryRow" style="display:none">
					<h3 class="title"><img src="//ticketimage.interpark.com/TicketImage/onestop/stit_delivery_04.gif" alt="배송자정보"></h3>
					<table>
						<caption>배송자정보 입력</caption>
						<colgroup><col width="80px"><col width="*"></colgroup>
						<tbody>
							<tr class="fir">
								<td colspan="2"><em>배송 받으시는 분의 휴대폰으로 배송정보(등기번호)가 전송되오니<br>정확한 정보를 입력해 주세요.</em></td>
							</tr>
							<tr>
								<th>받으시는 분</th>
								<td><input type="text" id="RName" value="" style="width:50px;" class="txt1"> <input type="checkbox" id="chkSyncAddress" onclick="javascript:fnSyncAddress()">주문자와 동일 <a href="javascript:fnAddress();" title="이전배송지 창열기"><img src="//ticketimage.interpark.com/TicketImage/onestop/btn_delivery_01.gif" alt="이전배송지 선택버튼"></a></td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td class="form"><input type="text" id="RPhoneNo1" value="" style="width:36px;" class="txt1" maxlength="3" onkeyup="fnMoveFocus(3, 'RPhoneNo1', 'RPhoneNo2');"> - <input type="text" id="RPhoneNo2" value="" style="width:41px;" class="txt1" maxlength="4" onkeyup="fnMoveFocus(4, 'RPhoneNo2', 'RPhoneNo3');"> - <input type="text" id="RPhoneNo3" value="" style="width:41px;" class="txt1" maxlength="4" onkeyup="fnMoveFocus(4, 'RPhoneNo3', 'RHpNo1');"></td>
							</tr>
							<tr>
								<th>휴대폰</th>
								<td class="form"><input type="text" id="RHpNo1" value="" style="width:36px;" class="txt1" maxlength="3" onkeyup="fnMoveFocus(3, 'RHpNo1', 'RHpNo2');"> - <input type="text" id="RHpNo2" value="" style="width:41px;" class="txt1" maxlength="4" onkeyup="fnMoveFocus(4, 'RHpNo2', 'RHpNo3');"> - <input type="text" id="RHpNo3" value="" style="width:41px;" class="txt1" maxlength="4"></td>
							</tr>
							<tr>
								<th>주소</th>
								<td class="form">
									<p><input type="text" id="RZipcode" value="" style="width:72px;" class="txt1" disabled="">&nbsp;<span id="spanAddrFindDely"><a href="javascript:fnZipcode('N');" title="우편번호 찾기 창열기"><img src="//ticketimage.interpark.com/TicketImage/onestop/btn_post.gif" alt="우편번호 찾기버튼"></a></span>
									</p>
									<p><input type="text" id="RAddr" class="txt" value="" style="width:200px;" readonly=""></p>
									<p><input type="text" id="RSubAddr" class="txt" value="" style="width:200px;"></p>
									
								</td>
							</tr>
						</tbody>
					</table>
				</div><!-- deliver //-->
			</div>
			
		</div><!-- deliveryR //-->

		<div class="layerWrap" id="lay_sel1" style="display:none;">
			<div class="delivery_layer">
				<h4 class="title1">티켓 현장수령시 유의사항</h4>
				<div class="cont"><em>티켓현장수령은 예매시 부여되는<br> "예약번호(티켓번호)"로 당일 티켓을 수령,<br>입장하는 것입니다. </em><br>1시간 전 현장에 도착하셔서 티켓을 수령하시면 이용에 불편함이 없으십니다. <br>티켓 수령 시 예매확인서(또는 예약번호)와 <br>신분증을 지참하셔야 합니다. </div>
			</div>
		</div><!-- 현장수령 레이어 //-->

		<div class="layerWrap" id="lay_sel2" style="display:none;">
			<div class="delivery_layer">
				<h4 class="title1">배송 유의사항</h4>
				<div class="cont">
					<em>예매완료(결제익일) 기준 4~5일 이내에 배송</em>됩니다.<br>(주말/공휴일 제외한 영업일기준)
					<p class="pt"><strong>배송료 2,800원</strong></p>
					결제 시 공연일 12일 전 예매분에 한해 배송<br>선택이 가능합니다.  <span class="ul">티켓 배송이 시작된 이후에 취소시<br>에는 배송료가 환불되지 않습니다. </span><br>금주 주말 (토/일)공연 취소를 원할 경우 내사수령 바랍니다. <br>우편으로 보낼 시 우체국이 토요일 근무를<br> 안하는 관계로 수취인(인터파크)수령이 불가능하여 취소처리가 되지 않을 수 있습니다.<br>*티켓은 묶음배송이 불가합니다.</div>
			</div>
		</div><!-- 일반배송 (2,000원) //-->

		<div class="layerWrap" id="lay_sel3" style="display:none;">
			<div class="delivery_layer">
				<h4 class="title1">특급배송 유의사항</h4>
				<div class="cont">
					<em>예매완료(결제익일) 후 2일 이내에 배송</em>됩니다.<br>(주말/공휴일 제외한 영업일기준)<br>지역사정상 배송이 불가할 수 있습니다.<br>전국 33개 주요 도시 특급우편 가능)
					<p class="pt"><strong>배송료 0원</strong></p>
					결제 시 공연일 0일 전 예매분에 한해 특급배송<br>선택이 가능합니다. <span class="ul">티켓 배송이 시작된 이후에 <br>취소시에는 배송료가 환불되지 않습니다.</span><br>*티켓은 묶음배송이 불가합니다.
				</div>
			</div>
		</div><!-- 특급배송 (3,000원) //-->

		<div class="layerWrap" id="lay_sel4" style="display:none;">
			<div class="delivery_layer">
				<h4 class="title1">홈티켓 유의사항</h4>
				<div class="cont">
					<em>홈티켓을 출력하여  현장입구에 설치된 <br>전용단말기에  체크하고 입장</em>하시면 됩니다.<br><span id="HomeTicketNotice"></span>
					<p class="pt"><strong>홈티켓 사용방법</strong></p>
					<ul class="num">
						<li class="num1">배송방법을 홈티켓으로 선택한다. </li>
						<li class="num2">예매완료 후 홈티켓을 출력한다. </li>
						<li class="num3">현장에서 전용단말기에 서 체크 후 입장한다. </li>
					</ul>
				</div>
			</div>
		</div><!-- 홈티켓 //-->

		<div class="layerWrap" id="lay_sel5" style="display:none;">
			<div class="delivery_layer">
				<h4 class="title1">모바일티켓 유의사항</h4>
				<div class="cont">
					<em>본인의 휴대폰으로 전송받은 모바일티켓을<br>현장입구에 설치된 전용 게이트에 체크하고<br>입장</em>하시면 됩니다.<br>모바일티켓 서비스는 고객님의 휴대폰<br>무선인터넷 사용료가 부과됩니다.  
					<p class="pt"><strong>모바일티켓 사용방법</strong></p>
					<ul class="num">
						<li class="num1">배송방법을 모바일티켓으로 선택한다.  </li>
						<li class="num2">예매완료 후 모바일 티켓 받기!</li>
						<li class="num3">현장에서 전용단말기에 서 체크 후 입장한다. </li>
					</ul>
				</div>
			</div>
		</div><!-- 모바일티켓 //-->

		<div class="layerWrap" id="lay_premium" style="display:none;">
			<div class="premium_layer">
				<h4 class="title1">포장미리보기</h4>
				<div class="cont">
					<div class=""><img src="//ticketimage.interpark.com/TicketImage/onestop/@wrap.gif" alt="티켓포장 미리보기 이미지"></div>
				</div>
				<div class="btn"><img src="//ticketimage.interpark.com/TicketImage/onestop/btn_lay_close.gif" alt="티켓포장 미리보기 닫기" onclick="closePop('lay_premium');"></div>
			</div>
		</div><!-- 포장 미리보기 레이어 //-->
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
								<td><span id="MyPlayDate" name="MyPlayDate" title=""></span></td>
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
							src="//ticketimage.interpark.com/TicketImage/onestop/btn_buy.gif"
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
				<script>
					$('#LargeNextBtnLink').on(
							'click',
							function(e) {
								e.preventDefault();
								/* alert($(this).attr('data-url')); */
								$('#ifrmBookStep').attr('src',
										$(this).attr('data-url'));

							});
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
	<%@ include file="./step1_js.jsp"%>
</div>
