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



				<h4>회원리스트</h4>
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tbody>
						<tr>
							<td>
								<table width="100%" cellpadding="0" cellspacing="0"
									class="table1 center" summary="지난 설문 보기.">
									<caption>지난설문보기</caption>
									<tbody>
										<tr>
											<th width="70" class="t_head" scope="col">회원코드</th>
											<th width="50" class="t_head" scope="col">아이디</th>
											<th width="80" class="t_head" scope="col">이름</th>
											<th class="t_head" scope="col">마일리지</th>
											<th width="70" class="t_head" scope="col">등급</th>
											<th width="70" class="t_head t_end" scope="col">편집</th>
										</tr>

										<c:if test="${!empty glist }" >
											<c:forEach items="${glist}" var="gmem" varStatus="status">
												<tr>
													<td>${gmem.gmem_code }</td>
													<td>${gmemlist[status.index].mem_id }</td>
													<td>${gmem.name }</td>
													<td>${gmem.mile }</td>
													<td>${gmem.gra_code }</td>
													<td class="t_end"><a href="#">버튼</a></td>
												</tr>
											</c:forEach>
										</c:if>

									</tbody>
								</table>
							</td>
						</tr>
					</tbody>
				</table>



			</div>


			<div id="txt">



				<h4> 공연단리스트</h4>
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tbody>
						<tr>
							<td>
								<table width="100%" cellpadding="0" cellspacing="0"
									class="table1 center" summary="지난 설문 보기.">
									<caption>지난설문보기</caption>
									<tbody>
										<tr>
											<th width="70" class="t_head" scope="col">회원코드</th>
											<th width="50" class="t_head" scope="col">아이디</th>
											<th class="t_head" scope="col">이메일</th>
											<th width="80" class="t_head" scope="col">이름</th>
											<th width="70" class="t_head" scope="col">사업자번호</th>
											<th width="70" class="t_head t_end" scope="col">편집</th>
										</tr>

										<c:if test="${!empty tlist }" >
											<c:forEach items="${tlist}" var="tmem" varStatus="status">
												<tr>
													<td>${tmem.tro_code }</td>
													<td>${tmemlist[status.index].mem_id }</td>
													<td>${tmemlist[status.index].mem_email }</td>
													<td>${tmem.name }</td>
													<td>${tmem.bupanum }</td>
													<td class="t_end"><a href="#">버튼</a></td>
												</tr>
											</c:forEach>
										</c:if>

									</tbody>
								</table>
							</td>
						</tr>
					</tbody>
				</table>



			</div>
				<div class="box-footer login-box" style="margin-top: 0; border-top: none;">
					<button type="button" id="modifyBtn" class="btn btn-warning col-sm-3">수정하기</button>
					<button type="button" id="cancelBtn" class="btn btn-default pull-right col-sm-3">취 소</button>
			    </div>
		</div>

		
		<!--quick  -->
		<!-- <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script> -->

	</div>
	<!-- //container -->
</div>
