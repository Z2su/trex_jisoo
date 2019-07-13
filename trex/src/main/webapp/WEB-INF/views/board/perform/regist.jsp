<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="/resources/css/Perform.css" type="text/css"
	media="all">
<div id="contentswrap">

	<!-- subvisual -->
	<div id="subvisual">
		<div class="subv_performance">
			<div class="subv_pat">
				<p>
					<strong> <img src="/resources/images/ma_service_type.png"
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
			<h3 class="cnt_ti">regist</h3>
			

			<div class="show_sale">
				<h4>
					할인혜택<a class="user_money"
						href="/html/kr/together/together_0301.html"><img
						src="/resources/images/perform/bt_subscribe.gif" alt="유료회원혜택"></a>
				</h4>
				<div class="showcontent">
					
					<select name="code" onchange="fnChangeCategory();">
				<option value="" >공연코드</option>	
				<c:forEach items="${PFList}" var="PF">
				<option value="${PF.pf_code }" >${PF.pf_code }</option>
				
				</c:forEach>
								
						
			</select>
			<select name="time" onchange="fnChangeCategory();">
								<option value="" >공연시간</option>	
				
						
			</select>
			

						<input type="text" name="pf_code" /> 
						<input type="text" name="writer" value="${loginUser.mem_code }" />
						<form id="registform" action='regist' method="POST">
						
						
					</form>
					<input id="regist" type="button" value="등록"/>
			<script>
					
			var form = $('form#registform');
			
			$('input#regist').on('click',function(e){
				if($('select[name="code"]').val()=="")
					{
					alert("코드를 선택하시오");
					return;
					}
				if($('select[name="time"]').val()=="")
					{
					alert("시간을 선택하시오");
					return;
					}
				
				$('form#registform').attr({action:"regist",method:"post"});
			
					$('form#registform').submit();
			});
				$('select[name="code"]').on('change',function(e){
					$('select[name="time"]').empty();
					


					var pf_code = $(this).val();

					$.ajax({
						url:"<%=request.getContextPath()%>/board/perform/pfcode",
						type:"post",
						data:pf_code,	
						headers:{
							"Content-Type":"application/json",
							"X-HTTP-Method-Override":"post"
						},
						
						success:function(data){
							
							$('select[name="time"]').append($('<option value="">공연시간</option>'));								
							$.each(data, function(idx, val) {
								//alert(idx + " " + val.pfsh_code);
								var option = $('<option value="'+val.pfsh_code+'">'+val.starttime+'</option>');								
								$('select[name="time"]').append(option);
							});
							
						//alert("성공>>"+data.val.pfsh_code);
						
					},
						error:function(error){
						
						alert("오류");
					}
						
						
					});
					
					 $('select[name="time"]').on('change',function(e){ 
					/* if($('select[name="time"]').val() !=null){ */
						var index=0;

						var pfsh_code=$(this).val();
					
						$.ajax({
							url:"<%=request.getContextPath()%>/board/perform/pfsh",
							type:"post",
							data:pfsh_code,	
							headers:{
								"Content-Type":"application/json",
								"X-HTTP-Method-Override":"post"
							},
							
							success:function(data){
								
									
							index++;
							if(index==1)
								show(data);
							//alert("성공>>"+data.val.pfsh_code);
							
						},
							error:function(error){
							
							alert("오류");
						}
							
							
						});
						
						
						
					});
					
					
					
				});
				function show(data){
					var title = data.title;
					var rundate= new Date(data.rundate);
					var starttime=new Date(data.starttime);
					var hall_code = data.hall_code;
					var hall_name = data.hall_name;
					var runtime = data.runtime;
					var cls = data.cls;
					var cont = data.cont;
					var pf_code = $('select[name="code"]').val();
					var pfsh_code =$('select[name="time"]').val();
					var writer =$('input[name="writer"]').val();
					
					
					$('span#title').empty();
					$('span#rundate').empty();
					$('span#starttime').empty();
					$('span#hall_name').empty();
					$('span#runtime').empty();
					$('span#cls').empty();
					$('div#show_view_01').empty();
					
					$('span#title').append(title);
					$('span#rundate').append(rundate);
					$('span#starttime').append(starttime);
					$('span#hall_name').append(hall_name);
					$('span#runtime').append(runtime);
					$('span#cls').append(cls);
					$('div#show_view_01').append(cont);
					
					$('form#registform>input[type="hidden"]').remove();
					
					$('form#registform').prepend($('<input type="hidden" name="pf_code" value="'+pf_code+'"/>'));
					$('form#registform').prepend($('<input type="hidden" name="pfsh_code" value="'+pfsh_code+'"/>'));
					$('form#registform').prepend($('<input type="hidden" name="writer" value="'+writer+'"/>'));
					$('form#registform').prepend($('<input type="hidden" name="title" value="'+title+'"/>'));
					$('form#registform').prepend($('<input type="hidden" name="hall_code" value="'+hall_code+'"/>'));
					$('form#registform').prepend($('<input type="hidden" name="hall_name" value="'+hall_name+'"/>'));
					$('form#registform').prepend($('<input type="hidden" name="runtime" value="'+runtime+'"/>'));
					$('form#registform').prepend($('<input type="hidden" name="cls" value="'+cls+'"/>'));
					$('form#registform').prepend($('<input type="hidden" name="cont" value="'+cont+'"/>'));
					$('form#registform').prepend($('<input type="hidden" name="rundate" value="'+rundate+'"/>'));
					$('form#registform').prepend($('<input type="hidden" name="starttime" value="'+starttime+'"/>'));
					
				}
			
			</script>
				</div>
			</div>
			<div id="showView">
				<strong class="top"></strong>
				<div class="pefrImg">
					<div class="photo_gallery">
						<div class="galleryNum">
							(<span class="bold">1</span>/4)
						</div>
						<div class="galleryView">
							<ul class="bicImage">
								<li><a
									href="/resources/images/perform/performance_1_155383691853133_518870747.jpg"
									rel="facebox"><img
										src="/resources/images/perform/performance_1_155383691853133_518870747.jpg"
										alt="바르셀로나 기타 트리오 &amp; 댄스 “플라멩코”" style="display: inline;"></a></li>
								<li><a
									href="/resources/images/perform/performance_2_155383691903589_1853500726.jpg"
									rel="facebox"><img
										src="/resources/images/perform/performance_2_155383691903589_1853500726.jpg"
										alt="바르셀로나 기타 트리오 &amp; 댄스 “플라멩코”" style="display: none;"></a></li>
								<li><a href="/resources/images/perform/" rel="facebox"><img
										src="/resources/images/perform/"
										alt="바르셀로나 기타 트리오 &amp; 댄스 “플라멩코”" style="display: none;"></a></li>
								<li><a href="/resources/images/perform/" rel="facebox"><img
										src="/resources/images/perform/"
										alt="바르셀로나 기타 트리오 &amp; 댄스 “플라멩코”" style="display: none;"></a></li>
							</ul>
							<ul class="bicImage1">
								<li><a
									href="/resources/images/perform/performance_1_155383691853133_518870747.jpg"
									rel="facebox"><img
										src="/resources/images/perform/expansion.gif" alt="확대보기"></a></li>
								<li><a
									href="/resources/images/perform/performance_2_155383691903589_1853500726.jpg"
									rel="facebox"><img
										src="/resources/images/perform/expansion.gif" alt="확대보기"></a></li>
								<li><a href="/resources/images/perform/" rel="facebox"><img
										src="/resources/images/perform/expansion.gif" alt="확대보기"></a></li>
								<li><a href="/resources/images/perform/" rel="facebox"><img
										src="/resources/images/perform/expansion.gif" alt="확대보기"></a></li>
							</ul>
						</div>
						<div id="discount" style="display: none;">예당 유료회원 법인
							20%할인(100매), 골드 20%(4매), 블루 15%(4매)</div>

						<!-- <p class="no_mar center top_mar_5"><a href="/resources/images/perform/performance_1_155383691853133_518870747.jpg" rel="facebox"><img src="/resources/images/perform/expansion.gif" alt="확대보기" /></a></p>-->
						<div class="galleryThum">
							<div class="wrap">
								<ul class="thumnail">
									<li><a href="#total" onclick="thumImg(1); return false;"><img
											src="/resources/images/perform/thm_performance_1_155383691853133_518870747.jpg"
											alt="바르셀로나 기타 트리오 &amp; 댄스 “플라멩코”"
											style="width: 41px; height: 39px;"></a></li>
									<li><a href="#total" onclick="thumImg(2); return false;"><img
											src="/resources/images/perform/thm_performance_2_155383691903589_1853500726.jpg"
											alt="바르셀로나 기타 트리오 &amp; 댄스 “플라멩코”"
											style="width: 41px; height: 39px;"></a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<script type="text/javascript">
					photoAlbum();
				</script>
				
				<ul class="pefrText">
					<li><strong>공연이름</strong><span id="title"></span></li>
				
					<li><strong>공연구분</strong><span></span></li>
					<li><strong>공연날짜</strong><span id="rundate"> <fmt:formatDate
								value="${PFGBoard.rundate }" pattern="yyyy-MM-dd" /> 
					</span></li>
					<li><strong>공연시간</strong><span id="starttime"> <fmt:formatDate
								value="${PFGBoard.starttime }" pattern="HH:mm" />


					</span></li>
					<li><strong>공연장소</strong><span id="hall_name"></span></li>
				<!-- 	<li><strong>티켓정보</strong><span>R석 7만원, S석 6만원, A석 5만원,
							B석 4만원</span></li> -->
					<li><strong>소요시간</strong><span id="runtime"></span></li>
					<!-- <li><strong>관람등급</strong><span>8세 이상</span></li> -->
					<li><strong>공연장르</strong><span id="cls"></span></li>
				<!-- 	<li><strong>문의처</strong><span>브라보컴 1661-1605</span></li> -->
				</ul>
				
				<p class="reserer">
					<a href="#total"
						onclick="javascript:INTER_OpenSeat('19005622','08920','rlawltn656','199511252');"><img
						src="/resources/images/perform/bt_reser.gif"
						alt="바르셀로나 기타 트리오 &amp; 댄스 “플라멩코” 공연예매"></a><a href="#total"
						onclick="javascript:if(confirm('[바르셀로나 기타 트리오 &amp; 댄스 “플라멩코”] 공연정보를 관심공연담기로 지정 하시겠습니까?')) goBasket('3087');"><img
						src="/resources/images/perform/bt_show.gif"
						alt="바르셀로나 기타 트리오 &amp; 댄스 “플라멩코”관심공연담기"></a><a
						href="/html/kr/performance/performance_010101.html?year=2019&amp;mon=07&amp;genrecode=&amp;site_dvs_cd=kr&amp;menu_dvs_cd=010101&amp;skey=&amp;sval=&amp;GotoPage="><img
						src="/images/kr/common/showviewlist.gif" alt="목록"></a>
				</p>
			</div>
			<div class="clearfix"></div>
			<div class="show_sale">
				<h4>
					할인혜택<a class="user_money"
						href="/html/kr/together/together_0301.html"><img
						src="/resources/images/perform/bt_subscribe.gif" alt="유료회원혜택"></a>
				</h4>
				<div class="showcontent">
					<strong></strong>
					<div>예당&nbsp;유료회원&nbsp;법인&nbsp;20%할인(100매),&nbsp;골드&nbsp;20%(4매),&nbsp;블루&nbsp;15%(4매)
					</div>
				</div>
			</div>
			<div id="showviewTab">
				<span> <a href="#show_view_01"
					onclick="showview01(0);return false;">공연소개</a>
				</span> <span> <a href="#show_view_02"
					onclick="showview02(0);return false;">프로그램소개</a>
				</span> <span> <a href="#show_view_03"
					onclick="showview03(0);return false;">출연진소개</a>
				</span> <span><a href="#show_view_04"
					onclick="showview04(0);return false;">기타사항</a> </span> <span> <a
					href="#show_view_05" onclick="showview05(0);return false;">이벤트</a></span>
			</div>
			<div class="showcontent">
				<strong></strong>
				<div id="show_view_01" ></div>

			</div>

		
			<!--quick  -->
			<%@ include file="/WEB-INF/views/board/commons/quick.jsp"%>


		</div>
		<!-- //container -->
	</div>