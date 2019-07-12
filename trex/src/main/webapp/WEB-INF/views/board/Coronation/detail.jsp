<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="CRGList" value="${dataMap.CRGList }" />
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/resources/css/Coronation.css"
   type="text/css" media="all">
<div id="contentswrap">

			<!-- subvisual -->
			<div id="subvisual">
								<div class="subv_performance">
					<div class="subv_pat">
						<p>
							<strong><img src="/resources/images/ma_service_type.png" alt="Daejeon Arts Center"></strong>
							문화로 시민을 행복하게! 대전예술의전당
						</p>
					</div>
				</div>
							</div>
			<!-- //subvisual -->

			<!-- navigation -->
			<div id="navigation">
				<div class="naviwrap">
				 	<a href="/html/kr/" class="nv_home">HOME</a>&gt;<navi><a href="/html/kr/performance/performance_010101.html">공연안내</a>&gt;<a href="/html/kr/performance/performance_010101.html">공연안내</a>&gt;<a href="/html/kr/performance/performance_010101.html" class="navi_ov">공연정보</a></navi>				 	<div class="nv_service">
												<a class="nvs_print" href="#total" onclick="printContent('/html/kr/performance/performance_010101.html?mode=V&amp;code=2946');return false"><span class="hide">Print</span></a>
												<a href="#" onclick="twitterOpen('http://www.djac.or.kr/html/kr/performance/performance_010101.html?mode=V&amp;code=2946', '대전예술의전당 | 공연정보'); return false;" class="nvs_twt twitter" target="_blank" title="대전예술의전당 트위터(새창)"><span class="hide">트위터</span></a>
						<a href="#" onclick="facebookOpen('http://www.djac.or.kr/html/kr/performance/performance_010101.html?mode=V&amp;code=2946'); return false;" class="nvs_face facebook" target="_blank" title="대전예술의전당 페이스북(새창)"><span class="hide">페이스북</span></a>

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
					<h3 class="cnt_ti">상세 보기</h3>
					
	<table class="board_view">
		<colgroup>
			<col width="25%"/>
			<col width="25%"/>
			<col width="25%"/>
			<col width="25%"/>
		</colgroup>
		<caption>게시글 상세</caption>
		<tbody>
			<tr>
				<th scope="row">번호</th>
				<td>${CRGBoard.crg_num }</td>
				<th scope="row">조회수</th>
				<td>${CRGBoard.viewcnt }</td>
			</tr>
			<tr>
				<th scope="row">작성자</th>
				<td>${CRGBoard.writer }</td>
				<th scope="row">작성시간</th>
				<td><fmt:formatDate value="${CRGBoard.regDate }" pattern="yyyy-MM-dd" /></td>
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td colspan="3">${CRGBoard.title }</td>
			</tr>
			<tr>
				<td colspan="4">${CRGBoard.cont }</td>
			</tr>
		</tbody>
	</table>
	
	
	 <!-- 게시판 버튼모음 -->
           <div class="board_butt">
             <input type="image" href="./modify"
                src="<%=request.getContextPath() %>/resources/images/modify.gif" alt="수정">
             <a
                href="./delete"><img
                src="<%=request.getContextPath() %>/resources/images/delete.gif" alt="삭제"></a>
             <a
                href="/board/Coronation/list"><img
                src="<%=request.getContextPath() %>/resources/images/list.gif" alt="목록"></a>            
           </div>
	
	
	<script type="text/javascript">
		$(document).ready(function(){
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_openBoardList();
			});
			
			$("#update").on("click", function(e){
				e.preventDefault();
				fn_openBoardUpdate();
			});
		});
		
		function fn_openBoardList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/Coronation/list'/>");
			comSubmit.submit();
		}
		
		function fn_openBoardUpdate(){
			var idx = "${map.IDX}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/Coronation/modify' />");
			comSubmit.addParam("IDX", idx);
			comSubmit.submit();
		}
	</script>
					
					
				
				
			<!-- 	
				///////////////////////////////////
				//                               //
				//                               //
				//            내용채우기                            //
				//                               //
				//                               //
				//                               //
				//                               //
				//                               //
				/////////////////////////////////// -->
	
		
						
			</div>
	<!--quick  -->
	<%@ include file="/WEB-INF/views/board/commons/quick.jsp" %>
	
		</div>
		<!-- //container -->
	</div>