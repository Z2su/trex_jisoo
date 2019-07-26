<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>




<script>
var nextindex=0;
var pf_code;
$('.iframe a').on('click',function(){
	
	pf_code = $(this).attr('value');
	
	
	var input = $('<input type="hidden" value="'+pf_code+'" name="pf_code"/>');
	$('.iframe a').css("background","white");
	$(this).css("background","yellow");
	
	$('#trexinfo').empty();
	$('#trexinfo').append(input);
	nextindex=1;
	
	
});

$('#LargeNextBtn').on('click',function(){
	if(nextindex==0){
		alert('공연선택');
		return;
	}
	if(nextindex==1){
		$('#trexinfo').attr("action",pf_code+"/step1")
		
		$('#trexinfo').submit();
		
	}
})

</script>


