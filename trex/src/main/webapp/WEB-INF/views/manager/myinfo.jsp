<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Perform.css" type="text/css" media="all">
<div id="contentswrap">

	<!-- subvisual -->
	<div id="subvisual">
		<div class="subv_performance">
			<div class="subv_pat">
				<p>
					<strong>
					<img
						src="/resources/images/ma_service_type.png"
						alt="Daejeon Arts Center">
						</strong> 문화로 시민을 행복하게! 대전예술의전당
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
			<h3 class="cnt_ti">관리자 페이지</h3>

			<div id="txt">
				<div class="dot_line bott_mar_15"></div>

				<h4 class="top_mar_100">직원 정보</h4>
				<table cellpadding="0" cellspacing="0" width="100%" border="0"
					class="table1">
					<tbody class="text-center">
						
							<tr>
								<th class="t_body" scope="row" width="150">* 사번</th>
								<td class="td_top t_end">${employee.ep_code }</td>
							</tr>
						
							<tr>
								<th class="t_body" scope="row" width="150">* 회원코드</th>
								<td class="td_top t_end">${loginUser.mem_code}</td>
							</tr>

							<tr>
								<th class="t_body" scope="row" width="150">* 이름</th>
								<td class="td_top t_end">${employee.name}</td>
							</tr>
							<tr>
								<th class="t_body" scope="row" width="150">* 이메일</th>
								<td class="td_top t_end">${loginUser.mem_email}</td>
							</tr>
							<tr>
								<th class="t_body" scope="row">* 아이디</th>
								<td class="t_end">${loginUser.mem_id}</td>
							</tr>
							<tr>
								<th class="t_body" scope="row">* 패스워드</th>
								<td class="t_end"  >${loginUser.mem_pwd}</td>
							</tr>
							<tr>
								<th class="t_body" scope="row">* 직급 </th>
								<td class="t_end">${employee.rank}</td>
							</tr>
							<tr>
								<th class="t_body" scope="row">* 권한</th>
								<td class="t_end">${employee.emp}</td>
							</tr>

					</tbody>
							
				</table>
			</div>

				<div class="box-footer login-box" style="margin-top: 0; border-top: none;">
					<button type="button" id="modifyBtn" class="btn btn-warning col-sm-3">수정하기</button>
					<button type="button" id="cancelBtn" class="btn btn-default pull-right col-sm-3">취 소</button>
			    </div>
		</div>

		<script>
			${'#modifyBtn'}.on('click',function(e){
				"location.href='/mypage/MypageMemberModify"
			});
			${'#cancelBtn'}.on('click',function(e){
				"location.href='/"
			});
		</script>
		<!--quick  -->
		<%@ include file="/WEB-INF/views/board/commons/quick.jsp"%>
		<!-- <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script> -->

	</div>
	<!-- //container -->
</div>
