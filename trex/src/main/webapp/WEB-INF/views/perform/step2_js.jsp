<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!-- <script>
	var pf_code = $('#pf_code').val();

	var input = $('<input type="hidden" value="'+pf_code+'" name="pf_code"/>');
	//$('#formCalendar').prepend(input);
</script>
 -->

<script>
	$('#LargeNextBtnLink').on('click', function(e) {
		e.preventDefault();
		/* alert($(this).attr('data-url')); */
		$('#ifrmBookStep').attr('src', $(this).attr('data-url'));
		
	});
</script>
<script>
var nextindex=0;



$('.seatcheck').change(function(){

	
	var id=$(this).attr('id');
	
	var seat_code = $(this).attr('seat_code');
	//alert("seat"+seat_code);
	
	if($(this).is(':checked')){
	$('label[for="'+id+'"]').attr('pfshs_rese','2');
	$(this).attr('pfshs_rese','2');
	$(this).attr('checked',true);
	$('#trexinfo').append($('<input type="hidden" id="'+id+'" name="seat_code" value="'+seat_code+'"/>')); 

	
	}else{
	$('label[for="'+id+'"]').attr('pfshs_rese','0');
	$(this).attr('pfshs_rese','0');
	$(this).attr('checked',false);
	$('#trexinfo input#'+id).remove();

	}
	
	
	
});


/* 	 
 
 $('.seatlabel').on('click', function() {

		//alert($(this).attr('for'));
		var id = $(this).attr('for');

		 if (!$('div#seat #' +id).is(":checked")) {
			
			alert("선택");
			$('div#seat #' + id).prop('checked', true);
			$('div#seat #' + id).attr('pfshs_rese', '2');
			$(this).attr('pfshs_rese', '2');
			$('#trexinfo').append($('<input type="hidden" id="'+$(this).attr("for")+'" name="seat_code" value=""/>')); 
		} else {
			
			$('div#seat #' + id).prop('checked', false);
			$('div#seat #' + id).attr('pfshs_rese', '0');
			alert("해제");
			$(this).attr('pfshs_rese', '0');
			$('#trexinfo input#'+$(this).attr('for')).remove();

		} 
		//$(this).css("background-color","white");
	});  
	*/
	
	
	/* 
		  $('#chkBox:checked').each(function() { 
        alert($(this).val());
   });


		
	*/
	
/* 	$('div#seat .seatcheck:checked').each(function(){
		
		alert($(this).attr('id'));
		
		
	}) */
	$('#LargeNextBtn').on('click',function(){
		nextindex = $(".seatcheck:checked").length;

		if(nextindex==0){
			alert('자리선택');
			return;
		}else{
	
			
			
			
			$('#trexinfo').submit();
			
		}
	})
	
	
	
</script>


