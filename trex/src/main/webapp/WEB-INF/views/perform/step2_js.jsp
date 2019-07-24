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
	$('.seatlabel').on('click', function() {

		alert($(this).attr('for'));

		 if (!$('div#seat #' + $(this).attr('for')).is(":checked")) {
			
			alert("선택");
			$('div#seat #' + $(this).attr('for')).prop('checked', true);
			$('div#seat #' + $(this).attr('for')).attr('pfshs_rese', '2');
			$(this).attr('pfshs_rese', '2');
			$('#trexinfo').append($('<input type="hidden" id="'+$(this).attr("for")+'" name="seat_code" value=""/>')); 
		} else {
			
			$('div#seat #' + $(this).attr('for')).prop('checked', false);
			$('div#seat #' + $(this).attr('for')).attr('pfshs_rese', '0');
			alert("해제");
			$(this).attr('pfshs_rese', '0');
			$('#trexinfo input#'+$(this).attr('for')).remove();

		} 
		//$(this).css("background-color","white");
	});
	$('#LargeNextBtn').on('click',function(){
		if(nextindex==0){
			alert('자리선택');
			return;
		}
		
		if(nextindex!=0){
			
			$.each($('.seatcheck[pfshs_rese=2]'), function(idx, val){
				
				alert(val)
				
			})
			
			
			
			//$('#trexinfo').submit();
			
		}
	})
	
	
	
</script>


