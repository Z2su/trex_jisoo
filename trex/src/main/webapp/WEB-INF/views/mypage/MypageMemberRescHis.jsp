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
			<!-- 컨텐츠 타이틀 -->
			<h3 class="cnt_ti">예매확인 및 취소</h3>

			<div id="txt">
				<div class="dot_line bott_mar_15"></div>
				<table cellpadding="0" cellspacing="0" width="100%" border="0"
					class="table1">
					<tbody>
						<tr>
							<td>예매 코드</td>
							<td><input type="rh_code" value="${rh.rh_code}"
								readonly="readonly"></td>
						</tr>
						
						<tr>
							<td>예매 번호</td>
							<td><input type="rh_num" value="${rh.rh_num}"
								readonly="readonly"></td>
						</tr>
						
						<tr>
							<td>사용 마일리지</td>
							<td><input type="use_mile" value="${rh.use_mile}"
								readonly="readonly"></td>
						</tr>
						
						<tr>
							<td>총 금액</td>
							<td><input type="tot_price" value="${rh.tot_price}"
								readonly="readonly"></td>
						</tr>
						
					</tbody>
				</table>
				</div>
			</div>
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