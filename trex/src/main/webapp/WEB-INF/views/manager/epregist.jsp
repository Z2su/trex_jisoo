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
			
					<div class="login-panel panel panel-default"
						style="margin-top: 10%; margin-bottom: 10%;">
						<div class="panel-heading">
							<h3 class="panel-title">공연단 회원가입</h3>
						</div>
						<div class="panel-body">
							<form role="form" action="epregist" method="post">
								<!-- <form role="form"> -->
								<fieldset>
									
									
									<div class="form-group">
										<label>이름</label> <input class="form-control" placeholder="이름"
											name="name" id="name" type="text" />
									</div>
									
									
									<div class="form-group">
										<label>직급</label> <select name="rank">
											<option>회장</option>
											<option>사장</option>
											<option>부장</option>
											<option>과장</option>
											<option>주임</option>
											<option>대리</option>
											<option>사원</option>
											<option>인턴</option>
															</select> 
									</div>
									
									<div class="form-group">
										<label>권한</label><select name="emp">
											<option>짱짱맨 </option>
											<option>짱맨</option>
											<option>잡일맨</option>
											<option>암것도 못함맨</option>
															</select> 
									</div>
										<button type="submit" class="btn btn-lg btn-success btn-block">회원가입</button>
										<!-- <input type="button" class="btn btn-lg btn-success btn-block" value="회원가입" onclick="DosignUp();" /> -->
								</fieldset>
							</form>
						</div>
					</div>


		</div>
		<!--quick  -->
		<%@ include file="/WEB-INF/views/board/commons/quick.jsp"%>
		<!-- <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script> -->

	</div>
	<!-- //container -->
</div>
