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
				href="<%=request.getContextPath()%>/board/Coronation/list">게시판</a>&gt;<a
				href="/html/kr/performance/performance_010101.html">대관안내</a>
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
		<%@ include file="/WEB-INF/views/board/Coronation/submenu.jsp"%>


		<!-- content-->
		<div id="content">
			<!-- 컨텐츠 타이틀 -->
			<h3 class="cnt_ti">대관 신청</h3>

			<!--  내용은 여기에 !!!!  -->
			<div id="txt">
				
				
				
				<form name="inputFrm" method="post"
					action="regist"
					enctype="multipart/form-data" >
					
					

					<ul class="board_writeInfo">

						<!--제목-->
						<li><label for="wrtTitle">제 목</label><input type="text"
							id="wrtTitle" name="title" value=""></li>

						<!--작성자 -->
						<li><label for="wrtPers">작성자</label><input type="text"
							id="wrtPers" name="writer" value="${loginUser.mem_code } " readonly=""><span
							class="tip"></span></li>
						
						<li><label for="hall">공연장</label> <!-- <input type="text"
							id="wrthall" name="hall" value="${CRAppBoard.hall_code }"></li> -->
						<div class="">			
							<select name="hall_code" onchange="fnChangeCategory();">
								<option value="" >---공연장 선택---</option>	
								<option value="HALL0001" >HALL0001</option>				
								<option value="HALL0002" >HALL0002</option>
								<option value="HALL0003" >HALL0003</option> 	<!-- //공연장 정보 확정되면 밸류에 공연장코드 삽입// -->		
							</select>
						</div>
						</li>
						
						<li><label for="pf_app_code">공연 등록 코드</label> <input type="text"
							id="pf_app_code" name="pf_app_code" value=""></li>
						
						<li><label for="">기간</label> <input type="date"
							id="startdate" name="startdate" value="">~<input type="date"
							id="enddate" name="enddate" value=""></li>		
							
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
					<div class="board_butt" style="margin: 10px 0;padding: 0 10px; text-align: right">
						<input type="image"
							src="<%=request.getContextPath()%>/resources/images/regist.png"
							alt="등록">
						
						<a href="/board/Coronation/app/list">
						<img src="<%=request.getContextPath()%>/resources/images/cancel.png" alt="취소"></a>
						
					</div>
				</form>
				<!--  웹필터 수정 -->
				<!--  웹필터 수정 -->
			</div>


		</div>
	</div>
		<%@ include file="/WEB-INF/views/board/Coronation/app/smartEditor_js.jsp"%>
	<!-- //container -->
</div>
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/resources/css/board.css"
   type="text/css" media="all">