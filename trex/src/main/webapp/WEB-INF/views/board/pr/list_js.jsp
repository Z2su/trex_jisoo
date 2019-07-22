<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<script>
	$('#searchPRBtn').on('click',function(e){
		var form = $('form#search');
				
		var searchType=$('select#searchType');
		if(searchType.val()==""){
			alert("검색구분을 선택하세요.");
			searchType.focus();
			return;
		}
		form.submit();  
	 
	});
	$('#first_grid-pager>span').on('click',function(e){
		location.href="prlist${pageMaker.makeQuery(1)}";
	});
	$('#prev_grid-pager>span').on('click',function(e){
		if(${pageMaker.cri.page}==1){
			alert("현재 첫페이지 입니다.");
			return;
		}
		location.href="prlist${pageMaker.makeQuery(pageMaker.cri.page-1)}"
	});
	$('#next_grid-pager>span').on('click',function(e){
		var currentPage=${pageMaker.cri.page};
		var lastPage=${pageMaker.realEndPage};
		if(currentPage>=lastPage){
			alert("마지막 페이지입니다.");
			return;
		}
		location.href="prlist${pageMaker.makeQuery(pageMaker.cri.page+1)}"
	});
	$('#last_grid-pager>span').on('click',function(e){
		location.href="prlist${pageMaker.makeQuery(pageMaker.realEndPage)}"
	});
	
	$('input#pageNum').on('change',function(e){
		var page=parseInt($(this).val());
		
		if(isNaN(page)){
			alert("숫자가 아닙니다.");
			$(this).val('${pageMaker.cri.page}').focus();			
			return;
		}else if(!(Number.isInteger(page)&& page>0 && page< ${pageMaker.realEndPage+1})){
		//	alert(typeof(page));
			alert("1부터 ${pageMaker.realEndPage}까지의 정수를 입력하세요.");
			$(this).val('${pageMaker.cri.page}').focus();
			return;
		}
		
		$('input[name="page"]').val(page);		
		$('form#search').submit();
	});
	$('select#perPageNum').on('change',function(e){
		var perPageNum=$(this).val();
		
		$('input[name="perPageNum"]').val(perPageNum);
		
		$('form#search').submit();
	});

</script>







