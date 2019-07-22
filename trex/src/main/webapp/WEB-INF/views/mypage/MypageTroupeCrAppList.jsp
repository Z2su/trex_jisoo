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
			<div id="content">
				<!-- 컨텐츠 타이틀 -->
				<h3 class="cnt_ti">대관신청조회</h3>
				<table width="100%" class="table1 center" border="0" cellspacing="0"
					cellpadding="0">

					<colgroup>
						<col style="width: 45px;">
						<col style="width: 280px;">
						<col style="width: 90px;">
						<col style="width: 145px;">
					</colgroup>

					<thead>
						<tr>
							<th scope="col" class="t_head">번호</th>
							<th scope="col" class="t_head">제목</th>
							<th scope="col" class="t_head">작성일</th>
							<th scope="col" class="t_head">작성자</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach var="CR_AppList" items="${CRAppBoardList }">
							<tr role="row" class="jqgrow ui-row-ltr ui-widget-content">
								<td role="gridcell" style="text-align: center;">${CR_AppList.cr_app_num }</td>
								<td role="gridcell"><a
									href="/board/Coronation/app/detail/${CR_AppList.cr_app_code }"
									onclick="OpenWindow('detail?cr_app_code=${CR_AppList.cr_app_code }','','850','620')"
									style='<c:if test="" >font-weight:bold;color:blue;</c:if>'>${CR_AppList.title }
								</a></td>
								<td role="gridcell" style="text-align: center;"><fmt:formatDate
										value="${CR_AppList.regdate }" pattern="yyyy-MM-dd" /></td>
								<td role="gridcell" style="text-align: center;"><a
									class="maninfo" rel="${CR_AppList.writer }" href="#"
									data-hasqtip="21"> <i class="pink2 ace-icon fa fa-user"
										title="작성자"></i> ${CR_AppList.writer }
								</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<!-- //container -->
	</div>