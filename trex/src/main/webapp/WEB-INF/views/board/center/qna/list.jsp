<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div id="contentswrap">
 
			<!-- subvisual -->
			<div id="subvisual">
								<div class="subv_performance">
					<div class="subv_pat">
						<p>
							<strong><img src="<%=request.getContextPath()%>/resources/images/ma_service_type.png" alt="Daejeon Arts Center"></strong>
							문화로 시민을 행복하게! 대전예술의전당
						</p>
					</div>
				</div>
							</div>
			<!-- //subvisual -->

			<!-- navigation -->
			<div id="navigation">
				<div class="naviwrap">
				 	<a href="/html/kr/" class="nv_home">HOME</a>&gt;<navi><a href="/html/kr/performance/performance_010101.html">고객센터</a>&gt;<a href="/html/kr/performance/performance_010101.html">QNA</a></navi>				 	<div class="nv_service">
												<a class="nvs_print" href="#total" onclick="printContent('/html/kr/performance/performance_010101.html?mode=V&amp;code=2946');return false"><span class="hide">Print</span></a>
												
					</div>
				</div>
			</div>
			<!-- //navigation -->

			<!-- container -->
			<div id="container">
				<%@ include file="/WEB-INF/views/board/center/submenu.jsp" %>


				<!-- content-->
				<div id="content">
					<!-- 컨텐츠 타이틀 -->
					<h3 class="cnt_ti">QNA</h3>
				
			<div id="txt">
			
			<!-- 게시판 상단 전체글수와 검색 -->
			<form action="search" id="boardFind" name="boardFind" method="post">

				<div class="board_list_info">
					<p class="page_num">총 4224 건 / 금일 : 0건</p>
					<fieldset class="board_find">
						<legend>게시물검색</legend>
						<label for="findItem" class="hidden">검색조건</label> <select name="skey" id="ID_skey" class="selectType03" title=""><option value="title">제목</option>
							<option value="ntt_cntn">내용</option>
							<option value="wrt">작성자</option>
							<option value="reg_date">년도</option></select> <label for="findWrite" class="hidden">검색어입력</label> <input type="text" name="sval" title="검색어를 입력하세요" value=""> <input type="image" src="<%=request.getContextPath()%>/resources/images/board_find.gif" alt="검색">
					</fieldset>
				</div>
			</form>
			<!-- 게시판 리스트 -->
			<div class="board_listWrap">
				<div class="board_listBox">
					<div class="board_list">
						<form method="post" name="chkForm" action="/_prog/_board/index.php?code=customer&amp;site_dvs_cd=kr&amp;menu_dvs_cd=040202&amp;skey=&amp;sval=&amp;GotoPage=&amp;mode=RC">
							<input type="hidden" name="submod" value="">
							<table cellspacing="0" cellpadding="0" border="0" summary="공지사항 게시판입니다. 총 4224개의 글이 있으며 제목링크를 통해서 상세내용으로 이동합니다.">
								<caption>공지사항</caption>
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
								<td style="text-align:center;" colspan="5">내용이 없습니다.</td>
							</tr>
						</c:if>
									
								</tbody>
							</table>
						</form>
					</div>
				</div>
			</div>

			<!-- 게시판 버튼모음 -->
			<div class="board_butt">

				<a href="#"><img src="<%=request.getContextPath()%>/resources/images/list.gif" alt="목록"></a> <a href="<%=request.getContextPath()%>/board/center/qna/regist"><img src="<%=request.getContextPath()%>/resources/images/write.gif" alt="쓰기"></a>
				<a href="#" target="_blank"> <img src="<%=request.getContextPath()%>/resources/images/rss.gif" alt="rss"></a>

			</div>

			<!-- 게시판 페이징 
			<div class="board_listPage">
				<div class="tblPage">
					<span>[1]</span><a
						href="?code=customer&amp;site_dvs_cd=kr&amp;menu_dvs_cd=040202&amp;skey=&amp;sval=&amp;GotoPage=&amp;GotoPage=2">2</a>
					<a
						href="?code=customer&amp;site_dvs_cd=kr&amp;menu_dvs_cd=040202&amp;skey=&amp;sval=&amp;GotoPage=&amp;GotoPage=3">3</a>
					<a
						href="?code=customer&amp;site_dvs_cd=kr&amp;menu_dvs_cd=040202&amp;skey=&amp;sval=&amp;GotoPage=&amp;GotoPage=4">4</a>
					<a
						href="?code=customer&amp;site_dvs_cd=kr&amp;menu_dvs_cd=040202&amp;skey=&amp;sval=&amp;GotoPage=&amp;GotoPage=5">5</a>
					<a
						href="?code=customer&amp;site_dvs_cd=kr&amp;menu_dvs_cd=040202&amp;skey=&amp;sval=&amp;GotoPage=&amp;GotoPage=6">6</a>
					<a
						href="?code=customer&amp;site_dvs_cd=kr&amp;menu_dvs_cd=040202&amp;skey=&amp;sval=&amp;GotoPage=&amp;GotoPage=7">7</a>
					<a
						href="?code=customer&amp;site_dvs_cd=kr&amp;menu_dvs_cd=040202&amp;skey=&amp;sval=&amp;GotoPage=&amp;GotoPage=8">8</a>
					<a
						href="?code=customer&amp;site_dvs_cd=kr&amp;menu_dvs_cd=040202&amp;skey=&amp;sval=&amp;GotoPage=&amp;GotoPage=9">9</a>
					<a
						href="?code=customer&amp;site_dvs_cd=kr&amp;menu_dvs_cd=040202&amp;skey=&amp;sval=&amp;GotoPage=&amp;GotoPage=10">10</a>
					<span class="pageBt"><a
						href="?code=customer&amp;site_dvs_cd=kr&amp;menu_dvs_cd=040202&amp;skey=&amp;sval=&amp;GotoPage=&amp;GotoPage=11"><img
							src="/images/kr/common/page_next01.gif" alt="10"></a></span><span
						class="pageBt"><a
						href="?code=customer&amp;site_dvs_cd=kr&amp;menu_dvs_cd=040202&amp;skey=&amp;sval=&amp;GotoPage=&amp;GotoPage=302"><img
							src="/images/kr/common/page_next02.gif" alt="300"></a></span>
				</div>
			</div>
			
			게시판 페이징  -->





		</div>
			</div>
	<!--quick  -->
<%-- <!-- 	<%@ include file="/WEB-INF/views/board/center/quick.jsp" %> --> --%>
	
		</div>
		<!-- //container -->
	</div>
	
	<link rel="stylesheet"
   href="<%=request.getContextPath()%>/resources/css/board.css"
   type="text/css" media="all">