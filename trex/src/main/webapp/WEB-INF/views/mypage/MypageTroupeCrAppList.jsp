<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<body>
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
					href="<%=request.getContextPath()%>/mypage/MypageTroupeCrAppList">대관신청조회</a>
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
			<%@ include file="/WEB-INF/views/board/commons/submenu.jsp"%>

			<!-- content-->
			<div id="content">
				<!-- 컨텐츠 타이틀 -->
				<h3 class="cnt_ti">대관신청조회</h3>

				<!-- 게시판 리스트 -->
				<div class="board_listWrap">
					<div class="board_listBox">
						<div class="board_list">
							<form method="post" name="chkForm"
								action="/_prog/_board/index.php?code=customer&amp;site_dvs_cd=kr&amp;menu_dvs_cd=040202&amp;skey=&amp;sval=&amp;GotoPage=&amp;mode=RC">
								<input type="hidden" name="submod" value="">
								<table
									summary="대관신청조회입니다. 총 4224개의 글이 있으며 제목링크를 통해서 상세내용으로 이동합니다.">
									<caption>대관신청조회</caption>
									<thead>

										<tr>
											<th scope="col" class="head_first" width="8%">번호</th>
											<th scope="col" width="45%">제목</th>
											<th scope="col" width="15%">작성자</th>
											<th scope="col" width="15%">분류</th>
											<th scope="col" width="16%">내용</th>
											<th scope="col" width="10%">작성일</th>
										</tr>
									</thead>
									<tbody>
										<tr>
										
											<td class="center">1&nbsp;</td>

											<td class="title"><img
												src="<%=request.getContextPath()%>/resources/images/list_icon_hold.gif"
												alt="잠긴글"><a
												href="./?code=customer&amp;mode=V&amp;no=ziASixn1hjTZHMWDAuWheg&amp;code=customer&amp;site_dvs_cd=kr&amp;menu_dvs_cd=040202&amp;skey=&amp;sval=&amp;GotoPage=">대관신청 합니다.</a>&nbsp;</td>

											<td class="center">류 * * &nbsp;</td>
											<td class="center">정기대관&nbsp;</td>
											<td class="center">정기대관신청&nbsp;</td>
											<td class="center">2019-07-10&nbsp;</td>

										</tr>
		
								</table>
							</form>
						</div>
					</div>
				</div>
				
			</div>
		</div>
		<!-- //container -->
	</div>