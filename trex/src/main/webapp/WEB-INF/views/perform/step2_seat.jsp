<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head><body marginwidth="0" marginheight="0">
<form name="frmSeat">
	<input type="hidden" name="SessionId" value="0CB64C90DDFF49CC9CD0E3E0CB160008">
	<div class="wrap">
		<div class="contWrap">
			<div class="step2">
				<h3>연극 〈그게 아닌데〉<span>ㅣ대전예술의전당 앙상블홀</span></h3>
				<div class="select">
					<div class="fl_l">
						<em>다른 관람일자 선택 :</em> 
						<span>일자</span>
			            <select id="PlayDate" name="PlayDate" onchange="fnCallPlaySeqUpdate()">
						<option value="">선택하세요!</option><option value="20190823" selected="">2019년 08월 23일(금)</option><option value="20190824" class="sa">2019년 08월 24일(토)</option>
						</select>
						<span>시간</span>
						<select name="PlaySeq" id="PlaySeq" onchange="fnCallSeatPriceUpdate()">
						<option value="">선택하세요!</option><option value="001">15시 00분 </option><option value="002">19시 30분 </option></select>
					</div>
				</div>
				
				<div class="buy" id="divWaiting" style="display:none;"></div>
				<div class="buy" id="divWaitingNotStart" style="display:none;"></div>
				<div class="buy" id="divWaitingEnd" style="display:none;"></div>
								
			</div><!-- step //-->

			<div class="seatL">
                <iframe id="ifrmSeatDetail" name="ifrmSeatDetail" scrolling="auto" width="658px" height="619px" marginwidth="0" marginheight="0" frameborder="no" src="loading.html" title="좌석상세페이지"></iframe>
			</div><!-- seatL //-->

			<div class="seatR">
				<div class="inner">			
				
					<div class="miniMap">
						<span class="blind">원하시는 좌석을 선택하세요.</span>
						<iframe id="ifrmSeatView" name="ifrmSeatView" scrolling="no" width="100%" height="160" marginwidth="0" marginheight="0" frameborder="no" src="loading.html" title="좌석미니맵 페이지"></iframe>
						<!-- <img src="http://ticketimage.interpark.com/TicketImage/onestop/@212_160_miniMap.gif" alt="" /> -->
					</div>

					<div class="seat_level">
						<h3 class="title"><img src="//ticketimage.interpark.com/TicketImage/onestop/stit_seat_01.gif" alt="좌석등급 / 잔여석"></h3>
						<span class="btn"><a href="#;" onclick="fnSeatPrice();" title="가격 전체보기 창열기"><img src="//ticketimage.interpark.com/TicketImage/onestop/btn_price_all.gif" alt="가격 전체보기 버튼"></a></span>
						<div class="watch_info">
							<div class="scrollY">
								<div id="SeatGradeInfo" name="SeatGradeInfo"><div class="wrapList"><table> <caption>등급별 좌석정보 및 일반가격 정보</caption><colgroup><col width="65%"><col width="*"></colgroup><tbody><tr><td name="GradeDetail"><div><span class="lv" style="background:#7C68EE;"></span><strong>전석 <span>4석</span></strong></div></td><td class="taR">20,000원</td></tr></tbody></table></div></div>
							</div>
						</div>
					</div><!-- seat_level //-->

					<div class="seat_select">
						<h3 class="title"><img src="//ticketimage.interpark.com/TicketImage/onestop/stit_seat_02.gif" alt="선택좌석"></h3>
						<span class="ea">총&nbsp;<span id="SelectedSeatCount" name="SelectedSeatCount">0</span>석 선택되었습니다.</span>
						<div class="seat_choice">
							<table class="seat1">
								<caption>선택한 좌석정보</caption>
								<colgroup><col width="75px"><col width="*"></colgroup>
								<tbody>
									<tr>
										<th>좌석등급</th>
										<td>좌석번호</td>
									</tr>
								</tbody>
							</table>
							<div class="choice">
								<div class="scrollY">
									<div id="SelectedSeat" name="SelectedSeat"><table class="seat2"><caption>좌석상세정보</caption><colgroup><col width="75px"><col width="*"></colgroup><tbody></tbody></table></div>
								</div>
							</div>
						</div>
					</div><!-- seat_select //-->
				
					<div class="btnWrap">
						<a href="#;" onclick="fnSelect();" title="좌석선택완료 후 가격선택 페이지 이동"><img id="NextStepImage" src="//ticketimage.interpark.com/TicketImage/onestop/btn_seat_confirm.gif" alt="좌석선택완료 버튼"></a>
						<p class="fl_l"><a href="#;" onclick="fnCancel();" title="관람일/회차선택 단계페이지 이동"><img src="//ticketimage.interpark.com/TicketImage/onestop/btn_seat_prev.gif" alt="관람일/회차선택 단계가기 버튼"></a></p>
						<p class="fl_r"><a href="#;" onclick="fnRefresh();" title="좌석선택 페이지 이동"><img src="//ticketimage.interpark.com/TicketImage/onestop/btn_seat_again.gif" alt="좌석 다시 선택 버튼"></a></p>
						<p class="last" id="divWaiting1" style="display: none;">
						
						</p>
					</div>

					<!-- 2011-08-05 수정 -->
					<div class="matter" onmouseover="showlayernormalclick('lay_matter');" onmouseout="showlayernormalclick('lay_matter');">
						<img src="//ticketimage.interpark.com/TicketImage/onestop/icon_matter.gif" alt="좌석 선택시 유의사항">좌석 선택시 유의사항
					</div>
					<!-- 2011-08-05 수정 //-->
				</div>
			</div><!-- seatR //-->
		</div><!-- contWrap //-->

		<!-- 유의사항 Layer -->
		<div style="display: none;" id="lay_matter" class="layerWrap">
			선택하신 좌석이 동시에 다른<br>고객님으로 인해 선점 될 수 있습니다.<br>좌석선택완료이후 3분이내 결제가<br>이루어지지 않을 시 해당<br>좌석선점기회를 잃게됩니다.	
		</div>
		<!-- 유의사항 Layer //-->
		
		<div id="AllSeatPrice" style="display: none;">
			<div class="layerWrap" id="price">
				<div class="cost">
					<h4 class="title1">가격전체보기</h4>
					<span class="btn"><a href="#" onclick="$('AllSeatPrice').style.display='none';"><img src="//ticketimage.interpark.com/TicketImage/onestop/cost_close.gif" alt="가격전체보기 창닫기"></a></span>
					<p class="title2">연극 〈그게 아닌데〉</p>
					<div class="seat">
						<p class="title3">좌석별 할인은 다음단계에서 선택해주세요. <br>
							이 단계에서는 좌석위치만 선택합니다.</p>
						<div id="AllSeatPriceList"></div>
					</div>
				</div>
			</div>
		</div>
		<!-- 가격전체보기 //-->
	</div>
</form>
<iframe id="ifrmInfo" name="ifrmInfo" scrolling="no" width="0px" height="0px" marginwidth="0" marginheight="0" frameborder="no" src="null.html" title="좌석정보페이지"></iframe>
<form id="frmInfo" name="frmInfo" action="/Book/Lib/BookInfo.asp" method="post" target="ifrmInfo">
	<input type="hidden" name="Flag" value="">
	<input type="hidden" name="GoodsCode" value="19000479">
	<input type="hidden" name="PlaceCode" value="09000028">
	<input type="hidden" name="PlaySeq">
	<input type="hidden" name="SessionId" value="0CB64C90DDFF49CC9CD0E3E0CB160008">
	<input type="hidden" name="SeatCnt">
	<input type="hidden" name="SeatGrade">
	<input type="hidden" name="Floor">
	<input type="hidden" name="RowNo">
	<input type="hidden" name="SeatNo">
</form>


<script type="text/javascript">


	function fnAlertNotMatch(){
		alert("선택하신 공연일과 회차의 예매 가능시간이 종료되었습니다.\n공연일과 회차를 다시 선택해주세요.");
	}
</script>
<!-- HTTP 로깅코드 START -->
<!-- HTTP 로깅코드 END -->
</body>
</html>