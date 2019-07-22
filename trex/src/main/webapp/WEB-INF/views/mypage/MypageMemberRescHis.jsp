<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="contentswrap">

	<div id="subvisual">
		<div class="subv_mypage">
			<div class="subv_pat">
				<p>
					<strong></strong> 문화로 시민을 행복하게! 대전예술의전당
				</p>
			</div>
		</div>
	</div>

	<div id="navigation">
		<div class="naviwrap">
			<a href="<%=request.getContextPath()%>/">HOME</a>&gt;
			<navi>
				<a href="<%=request.getContextPath()%>/mypage/MypageMemberList">마이페이지</a>&gt;
				<a href="<%=request.getContextPath()%>/mypage/MypageMemberRescHis">예매확인 및 취소</a> </navi>
		</div>
	</div>

	<div id="container">
		<%@ include file="/WEB-INF/views/board/commons/submenu.jsp"%>

		<div id="content">
			<h3 class="cnt_ti">예매확인 및 취소</h3>

			<div id="txt">
				<div class="Contents">
					<!-- 리스트상단 -->
					<div class="Tit2_bgB">
						<p class="tit">
							<b>${loginUser.mem_id}</b> <span class="fc_impact" id="TotalCnt">총
								0건</span>의 예매내역이 있습니다.
						</p>
					</div>
					<!-- //리스트상단 -->
					<!-- b + 조회기간 선택 -->
					<div class="pru_search">
						<p class="tit">조회기간을 선택해 주세요.</p>
						<form name="TopOption" id="TopOption" method="post"
							action="TPTotalBooked.asp">
							<input type="hidden" name="KindOfGoods" id="KindOfGoods" value="">
							<input type="hidden" name="PeriodSearch" id="PeriodSearch"
								value=""> <input type="hidden" name="BizCode"
								id="BizCode" value="08920"> <input type="hidden"
								name="MemberID" id="MemberID" value="jkdd123"> <input
								type="hidden" name="OtherMemberCode" id="OtherMemberCode"
								value=""> <input type="hidden" name="encname"
								id="encname" value=""> <input type="hidden"
								name="encbirthday" id="encbirthday" value=""> <input
								type="hidden" name="enchpno" id="enchpno" value=""> <input
								type="hidden" name="encrypt" id="encrypt" value=""> <input
								type="hidden" name="CookYN" id="CookYN" value="Y">

							<table cellpadding="0" cellspacing="0" border="0">
								<caption>조회기간 선택</caption>
								<colgroup>
									<col style="width: 18%">
									<col style="width: 82%">
								</colgroup>
								<tbody>
									<tr>
										<th>기간별 조회</th>
										<td><a title="15일간 예매내역 검색 이동"
											href="javascript:CancelInfo.PeriodSearch('15','');"> <img
												src="http://ticketimage.interpark.com/TicketImage/partner/partner/btn_day_15.gif"
												alt="15일 선택버튼" class="hand">
										</a> <a title="1개월 예매내역 검색 이동"
											href="javascript:CancelInfo.PeriodSearch('01','');"> <img
												src="http://ticketimage.interpark.com/TicketImage/partner/partner/btn_month_1.gif"
												alt="1개월 선택버튼" class="hand">
										</a> <a title="2개월 예매내역 검색 이동"
											href="javascript:CancelInfo.PeriodSearch('02','');"> <img
												src="http://ticketimage.interpark.com/TicketImage/partner/partner/btn_month_2.gif"
												alt="2개월 선택버튼" class="hand">
										</a> <a title="3개월 예매내역 검색 이동"
											href="javascript:CancelInfo.PeriodSearch('03','');"> <img
												src="http://ticketimage.interpark.com/TicketImage/partner/partner/btn_month_3.gif"
												alt="3개월 선택버튼" class="hand">
										</a></td>
									</tr>
									<tr>
										<th>주문일자별 조회</th>
										<td><label for="Option" class="option_select">기준일
												선택</label> <select name="Option" id="Option" title="기준선택">
												<option selected="" value="">기준일</option>
												<option value="B" selected="">예매일</option>
												<option value="P">공연일</option>
										</select> <select name="BYear" id="BYear" title="년도 선택">
												<option value="2020">2020</option>
												<option value="2019">2019</option>
												<option value="2018">2018</option>
												<option value="2017">2017</option>
												<option value="2016">2016</option>
										</select> <label for="BYear">년</label> <select name="BMonth"
											id="BMonth" title="월 선택">
												<option value="01">1</option>
												<option value="02">2</option>
												<option value="03">3</option>
												<option value="04">4</option>
												<option value="05">5</option>
												<option value="06">6</option>
												<option value="07">7</option>
												<option value="08">8</option>
												<option value="09">9</option>
												<option value="10">10</option>
												<option value="11">11</option>
												<option value="12">12</option>
										</select> <label for="BMonth">월</label> <a
											href="javascript:CancelInfo.GetBookedList('','','Y');"
											title="주문일자별 예매내역 검색 이동"> <img
												src="http://ticketimage.interpark.com/TicketImage/partner/partner/btn_search.gif"
												alt="주문일자별 검색 버튼">
										</a></td>
									</tr>
								</tbody>
							</table>
						</form>
					</div>
					<!-- b + 조회기간 선택 // -->
					<!-- c + 예약정보 -->

					<div class="Punotice" align="center">
						<p>예매내역이 존재하지 않습니다.</p>
					</div>

					<!-- c + 예약정보 // -->
					<div class="board_butt">
						<button type="button" id="listBtn">취소</button>
					</div>
				<script>
				$('#listBtn').on('click', function(e) {
					location="<%=request.getContextPath()%> /mypage/MypageMemberList"
				});
				</script>
			</div>
		</div>

	<!-- //container -->
	</div>
</div>