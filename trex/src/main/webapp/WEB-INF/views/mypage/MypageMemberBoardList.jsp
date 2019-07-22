<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="contentswrap">

	<!-- subvisual -->
	<div id="subvisual">
		<div class="subv_performance">
			<div class="subv_pat">
				<p>
					<strong><img
						src="<%=request.getContextPath()%>/resources/images/ma_service_type.png"
						alt="Daejeon Arts Center"></strong> 문화로 시민을 행복하게! 대전예술의전당
				</p>
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
			<a href="<%=request.getContextPath()%>/mypage/MypageMemberBoardList">게시글조회</a>&gt;
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
			<h3 class="cnt_ti">게시글 조회</h3>

			<div id="txt">

				<!-- 게시판 상단 전체글수와 검색 -->
				<form action="search" id="boardFind" name="boardFind" method="post">

					<div class="board_list_info">
						<p class="page_num">총 4224 건 / 금일 : 0건</p>
						<fieldset class="board_find">
							<legend>게시물검색</legend>
							<label for="findItem" class="hidden">검색조건</label> <select
								name="skey" id="ID_skey" class="selectType03" title=""><option
									value="title">제목</option>
								<option value="ntt_cntn">내용</option>
								<option value="wrt">작성자</option>
								<option value="reg_date">년도</option></select> <label for="findWrite"
								class="hidden">검색어입력</label> <input type="text" name="sval"
								title="검색어를 입력하세요" value=""> <input type="image"
								src="<%=request.getContextPath()%>/resources/images/board_find.gif"
								alt="검색">
						</fieldset>
					</div>
				</form>
				<!-- 게시판 리스트 -->
				<div class="board_listWrap">
					<div class="board_listBox">
						<div class="board_list">
							<form method="post" name="chkForm"
								action="/_prog/_board/index.php?code=customer&amp;site_dvs_cd=kr&amp;menu_dvs_cd=040202&amp;skey=&amp;sval=&amp;GotoPage=&amp;mode=RC">
								<input type="hidden" name="submod" value="">
								<table cellspacing="0" cellpadding="0" border="0">
									<caption>게시글 조회</caption>
									<thead>
										<tr>
											<th scope="col" class="head_first" width="8%">번호</th>
											<th scope="col" width="45%">제목</th>
											<th scope="col" width="15%">작성자</th>
											<th scope="col" width="16%">작성일</th>
											<th scope="col" width="10%">조회수</th>
											<th scope="col" width="10%">파일</th>
										</tr>
									</thead>
									<tbody>

										<c:if test="${!empty list }">
											<c:forEach items="${list}" var="qnaboardVO">

												<tr>
													<td>${qnaboardVO.qna_num}</td>
													<td class="left"><a
														href='detail${pageMaker.makeSearch(pageMaker.cri.page) }&qna_num=${qnaboardVO.qna_num}'>
															${qnaboardVO.title}</a></td>
													<td>${qnaboardVO.writer}</td>
													<td><fmt:formatDate pattern="yyyy-MM-dd"
															value="${qnaboardVO.regdate}" /></td>
													<td><span class="badge bg-red">${qnaboardVO.viewcnt }</span></td>
												</tr>

												<c:forEach items="${replist}" var="qnareplyVO">
													<c:if test="${qnaboardVO.qna_code eq qnareplyVO.qna_code }">

														<tr>
															<td></td>
															<td class="left">ㄴ 답글: <a
																href='replydetail?rep_num=${qnareplyVO.rep_num }'>
																	${qnareplyVO.title}</a></td>
															<td>${qnareplyVO.writer}</td>
															<td><fmt:formatDate pattern="yyyy-MM-dd"
																	value="${qnareplyVO.regdate}" /></td>
															<td><span class="badge bg-red">${qnareplyVO.viewcnt }</span></td>
														</tr>

													</c:if>
												</c:forEach>
											</c:forEach>
										</c:if>
										<c:if test="${empty list }">
											<tr>
												<td style="text-align: center;" colspan="5">내용이 없습니다.</td>
											</tr>
										</c:if>

									</tbody>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	<!-- //container -->
</div>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/board.css"
	type="text/css" media="all">