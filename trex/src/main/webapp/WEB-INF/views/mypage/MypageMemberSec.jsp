<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/Perform.css"
	type="text/css" media="all">
<div id="contentswrap">

	<!-- subvisual -->
	<div id="subvisual">
		<div class="subv_performance">
			<div class="subv_pat">
				<p>문화로 시민을 행복하게! 대전예술의전당</p>
			</div>
		</div>
	</div>
	<!-- //subvisual -->

	<!-- navigation -->
	<div id="navigation">
		<div class="naviwrap">
			<a href="<%=request.getContextPath()%>/">HOME</a>&gt;
			<navi> <a
				href="<%=request.getContextPath()%>/mypage/MypageMemberList">마이페이지</a>&gt;
			<a href="<%=request.getContextPath()%>/mypage/MypageMemberSec">회원탈퇴</a>
			</navi>
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
			<h3 class="cnt_ti">회원탈퇴<h3>

			<div id="txt">
				<div class="dot_line bott_mar_15"></div>
				<table cellpadding="0" cellspacing="0" width="100%" border="0"
					class="table1">
					<tbody>
						<tr>
							<td>회원코드</td>
							<td><input type="mem_code" value="${loginUser.mem_code}"
								readonly="readonly"></td>
						</tr>
						
						<tr>
							<td>* 아이디</td>
							<td><input type="id" value="${loginUser.mem_id}"
								readonly="readonly"></td>
						</tr>
						
						<tr>
							<td>* 패스워드</td>
							<td><input type="pwd" value="${loginUser.mem_pwd}"
								readonly="readonly"></td>
						</tr>
						
						<tr>
							<td>* 이메일</td>
							<td><input type="email" value="${loginUser.mem_email}"
								readonly="readonly"></td>
						</tr>
					</tbody>
				</table>
				
				<div id="txt">
					<table cellpadding="0" cellspacing="0" width="100%" border="0" class="table1">

						<tbody class="text-center">
							<tr>
								<td>* 이름</td>
							<td>
								<input type="name" value="${gmem.name}"readonly="readonly">
							</td>
							</tr>
							<tr>
								<td>* 나이</td>
								<td><input type="birth" value="${gmem.birth}"
									readonly="readonly"></td>
							</tr>
							<tr>
								<td>* 주소</td>
								<td><input type="address" value="${gmem.address}"
									readonly="readonly"></td>
							</tr>
							<tr>
								<td>* 성별</td>
								<td><input type="gender" value="${gmem.gender}"
									readonly="readonly"></td>
							</tr>
							<tr>
								<td>* 휴대전화</td>
								<td><input type="tell" value="${gmem.tell}"
									readonly="readonly"></td>
							</tr>
							<tr>
								<td>마일리지</td>
								<td><input type="mile" value="${gmem.mile}"
									readonly="readonly"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

			<div class="board_butt">
				<button type="button" id="removeBtn">탈퇴</button>
				<button type="button" id="listBtn">취소</button>
			</div>
			<script>
				$('#removeBtn').on('click', function(e) {
					location="<%=request.getContextPath()%>/logout"
				});
				$('#listBtn').on('click', function(e) {
					location="<%=request.getContextPath()%>/mypage/MypageMemberList"
				});
			</script>
		</div>

		<!-- //container -->
	</div>