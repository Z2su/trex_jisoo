<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div id="contentswrap">

	<!-- subvisual -->
	<div id="subvisual">
		<div class="subv_performance">
			<div class="subv_pat">
				<p>
					<strong><img src="/resources/images/ma_service_type.png"
						alt="Daejeon Arts Center"></strong> 문화로 시민을 행복하게! 대전예술의전당
				</p>
			</div>
		</div>
	</div>
	<!-- //subvisual -->

	<!-- navigation -->
	<div id="navigation">
		<div class="naviwrap">
			<a href="/html/kr/" class="nv_home">HOME</a>&gt;
			<navi> <a
				href="<%=request.getContextPath()%>/board/pr/prlist">게시판</a>&gt;<a
				href="<%=request.getContextPath()%>/board/ad/adlist">광고게시판</a>
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
			<h3 class="cnt_ti">광고 리스트</h3>

			<!--  내용은 여기에 !!!!  -->
			<div id="txt">
				
				
				
				<form name="inputFrm" method="post"
					action="adregist"
					enctype="multipart/form-data" >
					
					

					<ul class="board_writeInfo">

						<!--제목-->
						<li><label for="wrtTitle">제 목</label><input type="text"
							id="wrtTitle" name="title" value=""></li>

						<!--작성자 -->
						<li><label for="wrtPers">작성자</label><input type="text"
							id="wrtPers" name="writer" value="${loginUser.mem_code }" readonly=""><span
							class="tip"></span></li>
						<!--공지 사항 체크-->

						<!--비밀글  체크-->

						
						
					
						
						<!--첨부파일-->
						<!-- <li><label for="wrtFile">첨부파일</label><input
							name="fileattach[]" id="file1" type="file" class="upFile"
							title="첫번째첨부파일"><br>
						<input name="fileattach[]" type="file" class="upFile"
							title="1 첨부파일"> (최대 파일사이즈 : 2 MB)</li> -->
						<!--내용입력-->
						
						<li><label for="wrtCont">내용입력</label> <textarea id="wrtCont"
								name="cont" rows="20" cols="1"></textarea></li>



					</ul>

					<!-- 게시판 버튼모음 -->
					<div class="board_butt">
						<input type="image"
							src="/resources/images/regist.png" alt="등록">
						<a
							href="/_prog/_board/index.php?code=stage&amp;site_dvs_cd=kr&amp;menu_dvs_cd=0308&amp;skey=&amp;sval=&amp;GotoPage="><img
							src="/resources/images/cancel.png" alt="취소"></a>
						<a
							href="/_prog/_board/index.php?code=stage&amp;site_dvs_cd=kr&amp;menu_dvs_cd=0308&amp;skey=&amp;sval=&amp;GotoPage="><img
							src="/resources/images/list.gif" alt="목록"></a>
					</div>
				</form>
				<!--  웹필터 수정 -->
				<!--  웹필터 수정 -->
			</div>


		</div>
	</div>
	<!-- //container -->
</div>
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/resources/css/board.css"
   type="text/css" media="all">