<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko"><head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<meta name="Author" content="">
<meta name="Keywords" content="">
<meta name="Description" content="">
<link rel="stylesheet" type="text/css" href="//ticketimage.interpark.com/TicketImage/onestop/css/reset.css">
<link rel="stylesheet" type="text/css" href="//ticketimage.interpark.com/TicketImage/onestop/css/style.css">
<script type="text/javascript" src="/Lib/js/XmlRs.js"></script>
<script type="text/javascript" src="/Book/Inc/Js/common.js"></script>
<script type="text/javascript" src="/Book/Inc/Js/block.js"></script>
<script type="text/javascript" src="/Book/Inc/Js/prototype_1_7.js"></script>
<script type="text/javascript" src="/Book/Inc/Js/Ajax.js"></script>
<script type="text/javascript" src="/Book/Inc/Js/BookSeatConfig.js"></script>
<script type="text/javascript" src="//ticketimage.interpark.com/TicketImage/onestop/css/common.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<script type="text/javascript">



//<![CDATA[
	var nBookStep = 1;	//현재 예매 단계

	
	document.observe("dom:loaded", fnInit);


	var pfcode;
	//초기화
	function fnInit(){
		parent.fnSetNextImage("");
		
		//이전단계로 온 경우 초기화
		if (parent.nNowBookStep > nBookStep){
			parent.fnClearSeat();		
			parent.fnInitDiscount();		
			parent.fnInitDelivery();		
			parent.fnInitPayment();
			parent.fnSetNowBookStep(nBookStep);	//현재 예매 스텝 저장
			parent.fnUIRefresh();
		}else{
			parent.fnSetNowBookStep(nBookStep);	//현재 예매 스텝 저장
		}



	}

	//월선택
	function fnChangeMonth(ym){
		$("YM").value = ym;
		$("PlayDate").value = "";
		$("formCalendar").submit();

		//BookMain 관람일, 회차, 관람시간 초기화
		parent.fnSetBookDateTime("", "", "");	
	}

	//관람일 선택
	function fnSelectPlayDate(nIndex, sPlayDate){
		if (sPlayDate != $F("PlayDate")){
			// 선택한 일자 className 변경
			for(var i=0; i < $N("CellPlayDate").length; i++){
				$N("CellPlayDate")[i].className = "sel1";
			}		
			$N("CellPlayDate")[nIndex].className = "sel2";
			
			$("PlayDate").value = sPlayDate;
			
			//회차 리셋
			$("PlaySeq").value = "";

			parent.fnSetBookDateTime(sPlayDate, "", "");

			//회차 조회
			fnGetPlaySeq(sPlayDate);
		}
	}

	//회차 조회
	function fnGetPlaySeq(sPlayDate){
		var url = "/Book/Lib/BookInfoXml.asp?Flag=PlaySeq&GoodsCode=19000479&PlaceCode=09000028&OnlyDeliver=68004&DBDay=12&ExpressDelyDay=0&BizCode=08920&BizMemberCode=T22635961&PlayDate=" + sPlayDate;
		//document.write(url);
		//fnAjaxRequest(url, fnGetPlaySeqCallBack);
		XmlRequest(url, fnGetPlaySeqCallBack);
	}


	function fnGetPlaySeqCallBack(){	
		if(XmlHttp.readyState == 4){
			if(XmlHttp.status == 200){				
				var Rs = new XmlRs(XmlHttp.responseXML);
				var sTag = "";
				var i = 0;
				var sTagClass = "";
				var nRsCount = Rs.RecordCount();
				var bGetRemainSeat = false;	//잔여좌석 조회 여부
				var tIndex, tPlaySeq, tOnlineDate, tPlayTime, tBalanceSeatYN, tCancelableDate;

				if (nRsCount > 0){
					// 회차상시인 상품
					if (fnTrim(Rs.Get("PlayTime")) == "상시상품"){
						sTag = "<div class=\"none\">회차(시간)선택이<br/>없는<br/>상시상품입니다</div>";

						tIndex = i;
						tPlaySeq = Rs.Get("PlaySeq");
						tOnlineDate = Rs.Get("OnlineDate");
						tPlayTime = Rs.Get("PlayTime");
						tBalanceSeatYN = Rs.Get("BalanceSeatYN");
						tCancelableDate = Rs.Get("CancelableDate");
						bGetRemainSeat = true;

						// 회차 설정
						//fnSetPlaySeq(Rs.Get("PlaySeq"), Rs.Get("PlayTime"), Rs.Get("CancelableDate"));

						//BookMain 관람일, 회차, 관람시간 변경
						//parent.fnSetBookDateTime($F("PlayDate"), $F("PlaySeq"), $F("PlayTime"));
					}else{
						sTag += "<ul>";
						while (!Rs.Eof()){
							// 선택한 회차가 넘어온 경우, 선택할 회차가 1개밖에 없는 경우 class 설정(선택 표시)
							if ((fnTrim($F("PlaySeq")) != "" && ($F("PlaySeq") == Rs.Get("PlaySeq"))) || nRsCount == 1){
								sTagClass = "class=\"sel\"";
								$("PlaySeq").value = Rs.Get("PlaySeq");
								bGetRemainSeat = true;
								tIndex = i;
								tPlaySeq = Rs.Get("PlaySeq");
								tOnlineDate = Rs.Get("OnlineDate");
								tPlayTime = Rs.Get("PlayTime");
								tBalanceSeatYN = Rs.Get("BalanceSeatYN");
								tCancelableDate = Rs.Get("CancelableDate");
							}else{
								sTagClass = "";
							}

							sTag += "<li><a id=\"CellPlaySeq\" name=\"CellPlaySeq\" " + sTagClass + " href=\"#;\" onclick=\"fnSelectPlaySeq(" + i + ", '" + Rs.Get("PlaySeq") + "', '" + Rs.Get("OnlineDate") + "', '" + Rs.Get("PlayTime") + "', '" + Rs.Get("BalanceSeatYN") + "', '" + Rs.Get("CancelableDate") + "')\">" + Rs.Get("PlayTime") + "</a></li>";

							Rs.MoveNext();
							i++;
						}
						sTag += "</ul>";
					}
				}else{
					sTag = "<div class=\"none\">회차가<br/>없습니다.</div>";
				}
				$("TagPlaySeq").innerHTML = sTag;

				// 선택한 회차가 넘어온 경우, 선택할 회차가 1개밖에 없는 경우, 회차없는 경우 잔여좌석 조회
				if (bGetRemainSeat){
					fnSelectPlaySeq(tIndex, tPlaySeq, tOnlineDate, tPlayTime, tBalanceSeatYN, tCancelableDate);
				}else{
					$("TagRemainSeat").innerHTML = "<div class=\"none\">회차 선택 후<br/>확인 가능 합니다.</div>";	//잔여좌석 초기화
					parent.fnSetNextImage("N");	//다음단계버튼 변경
				}
			}
		}
	}

	//회차 선택
	function fnSelectPlaySeq(nIndex, sPlaySeq, sOnlineDate, sPlayTime, sBalanceSeatyn, sCancelableDate){
		// 선택한 회차 className 변경
		var objCellPlaySeq = $N("CellPlaySeq");
		if (objCellPlaySeq.length > 0){
			for(i=0; i < objCellPlaySeq.length; i++){
				objCellPlaySeq[i].className = "";
			}		
			objCellPlaySeq[nIndex].className = "sel";
		}

		// 회차 설정
		fnSetPlaySeq(sPlaySeq, sPlayTime, sCancelableDate);

		if (sBalanceSeatyn == 'Y' || "N" == "Y" || sPlayTime == "상시상품"){
		}else{
			if ("" == "Y"){
				$("RemainArea").innerHTML = "<div class=\"tip\"><strong>TIP</strong><p>관람일 전일 오후 5시이후<br />(토요일은 오전 11시) 또는 관람일  <br />당일예매입니다. <br />예매 후에는 취소/변경/환불이 <br />불가합니다. </p></div>";
			}else{
				fnGetRemainSeat(sPlaySeq);
			}
		}
		parent.fnSetNextImage("C");	//다음단계버튼 변경

		//BookMain 관람일, 회차, 관람시간 변경
		parent.fnSetBookDateTime($F("PlayDate"), sPlaySeq, sPlayTime);
	}

	//잔여좌석 조회
	function fnGetRemainSeat(sPlaySeq){

		var url = "/Book/Lib/BookInfoXml.asp?Flag=SeatGrade&GoodsCode=19000479&PlaceCode=09000028&BizCode=08920&PlaySeq=" + sPlaySeq;

		//fnAjaxRequest(url, fnGetRemainSeatCallBack);
		XmlRequest(url, fnGetRemainSeatCallBack);
	}

	//잔여좌석 조회 콜백
	function fnGetRemainSeatCallBack(){	
		if(XmlHttp.readyState == 4){
			if(XmlHttp.status == 200){
				var Rs = new XmlRs(XmlHttp.responseXML);
				var str = "";
				var nRemainCnt = 0;

				str += "<ul>";
				while (!Rs.Eof()){
					if(parseInt(Rs.Get("RemainCnt"), 10) < 0 ){
						nRemainCnt = 0
					}else{
						nRemainCnt = parseInt(Rs.Get("RemainCnt"), 10)
					}
					str += "<li><div class=\"lv\" style=\"background:" + fnSeat_Bg_Color(Rs.Get("SeatGrade")) + ";\"></div><div class=\"lv_det\">" + Rs.Get("SeatGradeName") + " | " + fnAddComma(nRemainCnt) + "석</div></li>";
					Rs.MoveNext();
				}
				str += "</ul>";
				
				$("TagRemainSeat").innerHTML = str;

				
			}
		}
	}

	// 캐스팅 조회
	function fnGetCastingInfo(sPlaySeq){
		var url = "/Book/Lib/BookInfoXml.asp?Flag=Casting&GoodsCode=19000479&PlaceCode=09000028&BizCode=08920&PlaySeq=" + sPlaySeq;

		XmlRequest(url, fnGetCastingInfoCallBack);
	}
	function fnGetCastingInfoCallBack(){	
		if(XmlHttp.readyState == 4){
			if(XmlHttp.status == 200){
				var Rs = new XmlRs(XmlHttp.responseXML);
				var castlist = "";
				var castinfo = "";

				while (!Rs.Eof()){
					castlist += "<li>" + Rs.Get("CharacterName") + " 역 : <strong>" + Rs.Get("ManName") + "</strong></li>";

					if (Rs.Get("ManNo") != "0"){
						castinfo += Rs.Get("ManName");
					}
					Rs.MoveNext();
					if (!Rs.Eof()){
						if (Rs.Get("ManNo") != "0"){
							castinfo += ", ";
						}
					}
				}

				if (castinfo.length > 0){
					$("CastingInfoName").innerHTML = "<strong>출연</strong> : " + castinfo;
					$("CastingInfoDiv").style.display = "";

					$("CastingList").innerHTML = castlist;
					$("CastingDateInfo").innerHTML = "<strong>" + fnDisplayDateString($F("PlayDate"), "3") + " " + $F("PlayTime") + " 공연</strong> 주요 출연진";
				}
			}
		}
	}
	
	// 회차 설정
	function fnSetPlaySeq(sPlaySeq, sPlayTime, sCancelableDate){
		$("PlaySeq").value = sPlaySeq;
		$("PlayTime").value = sPlayTime;
		$("CancelableDate").value = sCancelableDate;
	}

	//다음단계
	function fnSelect(){
		var sPlayDateValue = $("PlayDate").value;
		var sPlaySeqValue = $("PlaySeq").value;
		var sPlayTImeValue = $("PlayTime").value;

		if (sPlayDateValue.length < 1){
			alert("관람일을 선택하세요.");
			return 0;
		}
		
		if (sPlaySeqValue.length < 1){
			alert("회차를 선택하세요.");
			return 0;
		}

		if (fnChkTodate()){
			//BookMain 관람일, 회차, 관람시간 전달
			parent.fnSetBookDateTime(sPlayDateValue, sPlaySeqValue, sPlayTImeValue);
			return 1;
		}else{
			return 0;
		}
	}

	//	당일예매 알려주기 Alert
	function fnChkTodate(){
		//var strPlayDate = "";
		var strPlayDate = $("PlayDate").value;
		var strPlayCancel = $("CancelableDate").value;
		
		if(strPlayDate.length == 8 && "20190715" >= strPlayDate){
			if (strPlayCancel != "" && "20190715" == (strPlayCancel.toString()).substr(0,8)){
				strPlayCancel = strPlayCancel.toString();
				var msg = "해당 회차의 취소일시는 "+ fnDisplayDateString(strPlayCancel,2) +"까지 입니다. \n"
				msg += "이후에는 취소/변경/환불이 불가합니다.\n\n"
				msg += "예매를 진행하시겠습니까?"
			}else{
				var msg = "관람일 전일 오후 5시 이후(토요일은 오전 11시) 또는 관람일 당일 예매입니다.\n"
				msg += "이는 예매 후에 취소/변경/환불이 불가합니다.\n\n"
				msg += "예매를 진행하시겠습니까?"
			}
  			var ret = confirm(msg);
  			
  			return ret;
  		}else{
  			return true;
		}
	}

	//	현재시간 보여주기
	function fnDisplayDateString(strDate, Type){
		var ret;
		if(strDate.length == 8){
			if(Type == 1){
				ret = strDate.substring(0,4) + "." + strDate.substring(4,6) + "." + strDate.substring(6,8)
			}else if(Type == 2){
				ret = strDate.substring(2,4) + "." + strDate.substring(4,6) + "." + strDate.substring(6,8)
			}else{
				ret = strDate.substring(0,4) + "." + strDate.substring(4,6) + "." + strDate.substring(6,8)
			}
		}else if (strDate.length == 12){
			ret = strDate.substring(4,6) + "월 " + strDate.substring(6,8) + "일 " + strDate.substring(8,10) + ":" + strDate.substring(10,12);
		}
		return ret;
	}

	// 캐스팅
	function fnCastingShow(bShow){
		if (bShow){
			$("CastingListDiv").style.display = "";
		}else{
			$("CastingListDiv").style.display = "none";
		}
	}

	// 캐스팅 초기화
	function fnCastingReset(){
		$("CastingInfoName").innerHTML = "";
		$("CastingInfoDiv").style.display = "none";
		$("CastingListDiv").style.display = "none";
	}
//]]>

</script>
</head>
			
<body>
	<div class="contFrame frameBg6">
		<!-- //관람일 선택 -->
		<div class="watch_select">
			<h3 class="title2"><img src="//ticketimage.interpark.com/TicketImage/onestop/stit_date.gif" alt="관람일선택"></h3>

			<div class="calHead">
				<div class="month">
					<span class="prev"></span>
					<span><em>2019</em>년 <em>8</em>월</span>
					<span class="next"><a href="javascript:fnChangeMonth('201909');"><img src="//ticketimage.interpark.com/TicketImage/onestop/arrow_gr_next.gif" alt="다음달로 이동"></a></span>
				</div>
			</div>
			<div class="calCont">
				<table>
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
						<tr>
<td></td>
<td></td>
<td></td>
<td></td>
<td>1<span class="blind">일 예매 불가능</span></td>
<td>2<span class="blind">일 예매 불가능</span></td>
<td>3<span class="blind">일 예매 불가능</span></td>
</tr>
<tr>
<td class="sun">4<span class="blind">일 예매 불가능</span></td>
<td>5<span class="blind">일 예매 불가능</span></td>
<td>6<span class="blind">일 예매 불가능</span></td>
<td>7<span class="blind">일 예매 불가능</span></td>
<td>8<span class="blind">일 예매 불가능</span></td>
<td>9<span class="blind">일 예매 불가능</span></td>
<td>10<span class="blind">일 예매 불가능</span></td>
</tr>
<tr>
<td class="sun">11<span class="blind">일 예매 불가능</span></td>
<td>12<span class="blind">일 예매 불가능</span></td>
<td>13<span class="blind">일 예매 불가능</span></td>
<td>14<span class="blind">일 예매 불가능</span></td>
<td>15<span class="blind">일 예매 불가능</span></td>
<td>16<span class="blind">일 예매 불가능</span></td>
<td>17<span class="blind">일 예매 불가능</span></td>
</tr>
<tr>
<td class="sun">18<span class="blind">일 예매 불가능</span></td>
<td>19<span class="blind">일 예매 불가능</span></td>
<td>20<span class="blind">일 예매 불가능</span></td>
<td>21<span class="blind">일 예매 불가능</span></td>
<td>22<span class="blind">일 예매 불가능</span></td>
<td><a id="CellPlayDate" name="CellPlayDate" class="sel1" href="#;" onclick="fnSelectPlayDate(0, '20190823')">23<span class="blind">일 예매 가능</span></a></td>
<td><a id="CellPlayDate" name="CellPlayDate" class="sel1" href="#;" onclick="fnSelectPlayDate(1, '20190824')">24<span class="blind">일 예매 가능</span></a></td>
</tr>
<tr>
<td class="sun">25<span class="blind">일 예매 불가능</span></td>
<td>26<span class="blind">일 예매 불가능</span></td>
<td>27<span class="blind">일 예매 불가능</span></td>
<td>28<span class="blind">일 예매 불가능</span></td>
<td>29<span class="blind">일 예매 불가능</span></td>
<td>30<span class="blind">일 예매 불가능</span></td>
<td>31<span class="blind">일 예매 불가능</span></td>
</tr>

					</tbody>
				</table>
			</div>
			<div class="calBtm">
				<p>
					<span class="info1"><span class="blind">링크 표시 날짜는 </span>예매 가능일</span>
					<span class="info2"><span class="blind">굵은 표시 날짜는 </span>선택한 관람일</span>
				</p>
				<p><span class="info3">예매가능시간 : 관람 3시간전</span></p>
			</div>

		</div><!-- watch_select //-->
		<!-- 관람일 선택 //-->

		<div class="arrow"></div><!-- arrow //-->
		<!-- ver 1 -->
		<div class="ver1">
			<div class="watch_time">
				<h3 class="title2"><img src="//ticketimage.interpark.com/TicketImage/onestop/stit_watch.gif" alt="관람시간"></h3>
				<div class="scrollY">
					<span id="TagPlaySeq" name="TagPlaySeq"><div class="none">먼저 관람일을<br>선택해 주세요.</div></span>
				</div>
			</div>
			
			<div id="RemainArea">
				<div class="watch_info">
					<h3 class="stit"><img src="//ticketimage.interpark.com/TicketImage/onestop/stit_seat.gif" alt="좌석등급과 잔여석"></h3>
					<div class="scrollY">
						<span id="TagRemainSeat" name="TagRemainSeat"><div class="none">회차 선택 후<br>확인 가능 합니다.</div></span>
					</div>
				</div>
			</div>
		</div>
		<!-- ver 1 //-->
		<!-- //유의사항 -->
		<div class="watch_note">
			<h3 class="stit"><img src="//ticketimage.interpark.com/TicketImage/onestop/stit_note.gif" alt="예매시 유의사항"></h3>
			<ul>
									
	<li>장애인, 국가유공자 할인등급의 경우 현장수령만 가능합니다.<br>장애인등록증이나 복지카드 확인 후 티켓을 배부합니다. 미지참시 할인혜택을 받으실 수 없습니다.</li>
	<li>관람일 전일 아래시간까지만 취소 가능합니다.<br>
	 - 공연전일 평일/일요일/공휴일 오후 5시, 토요일 오전 11시 (단,토요일이 공휴일인 경우는 오전 11시)<br>
	 - 취소수수료와 취소가능일자는 상품별로 다르니, 오른쪽 하단 My예매정보를 확인해주시기 바랍니다.</li>
	<li>ATM기기로는 가상계좌입금이 안 되는 경우가 있으니 무통장 입금 고객님들은 인터넷 뱅킹, 폰뱅킹이 어려우시면 다른 결제수단을 선택해 주시기 바랍니다.</li>

			</ul>
		</div><!-- watch_note //-->
		<!-- 유의사항 //-->
		<!-- //출연진 -->
		<div class="CastingInfo" id="CastingInfoDiv" style="display:none;">
			<span id="CastingInfoName"></span>
			<a href="javascript:;" class="btnMore" onclick="fnCastingShow(true)"><span>더보기</span></a>
		</div>
		<!-- 출연진 //-->
		<!-- //캐스팅 레이어 -->
		<div class="CastingLayer" style="display:none;" id="CastingListDiv">
			<div class="ctTitle">
				<a href="javascript:;" class="btn_close" onclick="fnCastingShow(false)"><span>레이어닫기</span></a>
				<span id="CastingDateInfo"></span>
				<a href="/Ticket/Goods/CastingBridge.asp?GoodsCode=19000479" class="btn_more" target="_blank"><span>모든 출연진 보기</span></a>
			</div>
			<ul class="ctList">
				<span id="CastingList"></span>
			</ul>
			<p class="ctNotice">* 캐스팅 일정은 배우 및 제작사의 사정에 따라 사전공지 없이 변경될 수 있습니다.</p>
		</div>
		<!-- 캐스팅 레이어 //-->
	</div>
	<form id="formCalendar" name="formCalendar" method="get" action="BookDateTime.asp">
		<input type="hidden" id="GoodsCode" name="GoodsCode" value="19000479">
		<input type="hidden" id="PlaceCode" name="PlaceCode" value="09000028">
		<input type="hidden" id="OnlyDeliver" name="OnlyDeliver" value="68004">
		<input type="hidden" id="DBDay" name="DBDay" value="12">
		<input type="hidden" id="ExpressDelyDay" name="ExpressDelyDay" value="0">
		<input type="hidden" id="YM" name="YM" value="201908">
		<input type="hidden" id="PlayDate" name="PlayDate" value="">
		<input type="hidden" id="KindOfGoods" name="KindOfGoods" value="01009">
		<input type="hidden" id="BizCode" name="BizCode" value="08920">
		<input type="hidden" id="Tiki" name="Tiki" value="">
		<input type="hidden" id="Always" name="Always" value="N">
		<input type="hidden" id="HotSaleOrNot" name="HotSaleOrNot" value="">
		<input type="hidden" id="PlaySeq" name="PlaySeq" value="">
		<input type="hidden" id="PlayTime" name="PlayTime" value="">
		<input type="hidden" id="CancelableDate" name="CancelableDate" value="">
	</form>
 
 <script>
 
 var pfcode = $('#pf_code',parent.document).val();

 var input = $('<input type="hidden" value="'+pfcode+'" name="pf_code"/>');
 $('#formCalendar').prepend(input);
 
 </script>
</body></html>