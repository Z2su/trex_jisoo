<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> --%>
<%-- 
<c:set var="NoticeList" value="${dataMap.NoticeList }" />
<c:set var="pageMaker" value="${dataMap.pageMaker }" /> --%>

	<div id="contentswrap">
		<!-- subvisual -->
		<div id="subvisual">
			<div class="subv_performance">
				<div class="subv_pat">
					<p>
						<strong></strong> 문화로 시민을 행복하게! 대전예술의전당
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
					href="<%=request.getContextPath()%>/board/center/notice/list">공지사항</a>&gt;
				</navi>
				<div class="nv_service">
					<a class="nvs_print" href="#total"
						onclick="printContent('/html/kr/performance/performance_010101.html?mode=V&amp;code=2946');return false"><span
						class="hide">Print</span></a> <a href="#"
						onclick="twitterOpen('http://www.djac.or.kr/html/kr/performance/performance_010101.html?mode=V&amp;code=2946', '대전예술의전당 | 공연정보'); return false;"
						class="nvs_twt twitter" target="_blank" title="대전예술의전당 트위터(새창)"><span
						class="hide">트위터</span></a> <a href="#"
						onclick="facebookOpen('http://www.djac.or.kr/html/kr/performance/performance_010101.html?mode=V&amp;code=2946'); return false;"
						class="nvs_face facebook" target="_blank" title="대전예술의전당 페이스북(새창)"><span
						class="hide">페이스북</span></a>
				</div>
			</div>
		</div>
		<!-- //navigation -->

		<!-- container -->
		<div id="container">
			<%@ include file="/WEB-INF/views/board/center/submenu.jsp"%>

			<!-- content-->
			<div id="content">
				<!-- 컨텐츠 타이틀 -->
				<h3 class="cnt_ti">공지사항</h3>

				<!-- 게시판 리스트 -->
				<div class="board_listWrap">
					<div class="board_listBox">
						<div class="board_list">
							<form method="post" name="chkForm"
								action="/_prog/_board/index.php?code=customer&amp;site_dvs_cd=kr&amp;menu_dvs_cd=040202&amp;skey=&amp;sval=&amp;GotoPage=&amp;mode=RC">
								<input type="hidden" name="submod" value="">
								<table
									summary="공지사항 게시판입니다. 총 4224개의 글이 있으며 제목링크를 통해서 상세내용으로 이동합니다.">
									<caption>공지사항</caption>
									<thead>
										<tr>
											<th scope="col" class="head_first" width="8%">번호</th>
											<th scope="col" width="45%">제목</th>
											<th scope="col" width="10%">작성자</th>
											<th scope="col" width="18%">작성일</th>
											<th scope="col" width="8%">조회수</th>
										</tr>
									</thead>

									<tbody>
										<c:forEach var="NoticeList" items="${NoticeList}">
											<tr role="row" class="jqgrow ui-row-ltr ui-widget-content">
												<td role="gridcell" style="text-align: center;">${NoticeList.notice_num}</td>
												<td role="gridcell">
												<a href="<%=request.getContextPath()%>/board/center/notice/detail?notice_num=${NoticeList.notice_num}" onclick="OpenWindow('detail?notice_num=${NoticeList.notice_num}','','850','620')"
													style='<c:if test="${NoticeList.viewcnt >= 5}" >font-weight:bold;color:blue;</c:if>'>${NoticeList.title}</a></td>
												<td role="gridcell" style="text-align: center;">
												<a class="maninfo" rel="${NoticeList.writer}" href="#"
													data-hasqtip="21"> <i class="pink2 ace-icon fa fa-user" title="작성자"></i> ${NoticeList.writer}
												</a>
											    </td>
												<td role="gridcell" style="text-align: center;">
													<fmt:formatDate value="${NoticeList.regdate}" pattern="yyyy-MM-dd" />
												</td>
											</tr>
										</c:forEach>
										</tbody>
								</table>
							</form>
						</div>
					</div>
				</div>

				<div class="board_butt">
					<button type="button" id="listBtn">목록</button>
					<button type="button" id="registBtn">쓰기</button>
				</div>
				<script>
					$('#listBtn').on('click', function(e) {
						location="<%=request.getContextPath()%>/board/center/notice/list"
					});

					$('#registBtn').on('click', function(e) {
						location="<%=request.getContextPath()%>/board/center/notice/regist"
					});
				</script>
			</div>
		</div>
		<!-- //container -->
	</div>
	<link rel="stylesheet"
   href="<%=request.getContextPath()%>/resources/css/board.css"
   type="text/css" media="all">