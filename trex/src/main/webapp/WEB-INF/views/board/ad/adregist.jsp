<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
	$(function() {
		$("#datepicker1").datepicker({
			dateFormat : 'yy-mm-dd'
		});
	});

	$(function() {
		$("#datepicker2").datepicker({
			dateFormat : 'yy-mm-dd'
		});
	});
</script>

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
			<a href="/html/kr/" class="nv_home">HOME</a>&gt; <a
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



				<form name="inputFrm" method="post" action="adregist"
					enctype="multipart/form-data">



					<ul class="board_writeInfo">

						<!--제목-->
						<li><label for="wrtTitle">제 목</label><input type="text"
							id="wrtTitle" name="title" value=""></li>

						<!--작성자 -->
						<li><label for="wrtPers">작성자</label><input type="text"
							id="wrtPers" name="writer" value="${loginUser.mem_code }"
							readonly=""><span class="tip"></span></li>
						<li><label for="pfSelect">공연선택</label>							
							<select name="pf_code">
							<c:forEach var="pf" items="${pfList }">
								<option value="${pf.pf_code}">${pf.name }</option>
							</c:forEach>
							</select>
							
						</li>

						<li><label for="dms.subject"
							class="col-xs-4 col-sm-2 control-label no-padding-right bolder g_label">
								게시기간 </label><input id="datepicker1" name="startdate"
							style="color: #919191;" class="dateInput" readonly="readonly"
							type="text"
							value='<fmt:formatDate value="<%=new Date()%>" pattern="yyyy-MM-dd" />' />
							~ <input id="datepicker2" name="enddate" class="dateInput"
							type="text"
							value='<fmt:formatDate value="<%=new Date()%>" pattern="yyyy-MM-dd" />' /></li>


						<li><label for="wrtimg">이미지</label><input type="file"
							id="img" name="file" />
							<div class="select_img">
								<img src="" />
							</div></li>








						<li><label for="wrtCont">내용입력</label> <textarea id="wrtCont"
								name="cont" rows="20" cols="1"></textarea></li>
					</ul>
					<div class="board_butt">
						<input type="image" src="/resources/images/regist.png" alt="등록">
						<a href="adlist"><img src="/resources/images/cancel.png"
							alt="취소"></a> <a href="adlist"><img
							src="/resources/images/list.gif" alt="목록"></a>
					</div>
				</form>
			</div>


			<!-- 게시판 버튼모음 -->


			<!--  웹필터 수정 -->
			<!--  웹필터 수정 -->
		</div>
		<%@ include file="/WEB-INF/views/board/ad/smartEditor_js.jsp"%>

	</div>
</div>
<!-- //container -->

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/board.css"
	type="text/css" media="all">


<script>
	$("#img").change(
			function() {
				if (this.files && this.files[0]) {
					var reader = new FileReader;
					reader.onload = function(data) {
						$(".select_img img").attr("src", data.target.result)
								.width(500);
					}
					reader.readAsDataURL(this.files[0]);
				}
			});
</script>