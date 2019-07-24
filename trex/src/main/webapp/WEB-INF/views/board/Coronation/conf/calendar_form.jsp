<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces ="true" %>    

 <!-- Bootstrap 3.3.7 -->
 <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/cal/bower_components/bootstrap/dist/css/bootstrap.min.css">

 <!-- fullCalendar -->
 <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/cal/bower_components/fullcalendar/dist/fullcalendar.min.css">
 <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/cal/bower_components/fullcalendar/dist/fullcalendar.print.min.css" media="print">
  
<!-- jQuery 3 -->
<script src="<%=request.getContextPath()%>/resources/cal/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="<%=request.getContextPath()%>/resources/cal/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="<%=request.getContextPath()%>/resources/cal/bower_components/jquery-ui/jquery-ui.min.js"></script>
<!-- Slimscroll -->
<script src="<%=request.getContextPath()%>/resources/cal/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="<%=request.getContextPath()%>/resources/cal/bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="<%=request.getContextPath()%>/resources/cal/bower_components/moment/moment.js"></script>
<script src="<%=request.getContextPath()%>/resources/cal/bower_components/fullcalendar/dist/fullcalendar.min.js"></script>
<script>	

 
	

var events=[];
$.getJSON( "<%=request.getContextPath()%>/board/Coronation/conf/listcal", function(data) {
events=data;
   for(var json of events){
      json.start=new Date(json.start);
      json.end=new Date(json.end);     
   }
 
  
}); 


$(document).ready(function() {
	var date = new Date();
	var d = date.getDate();
	var m = date.getMonth();
	var y = date.getFullYear();
	
	var calendar=$('#calendar').fullCalendar({
		header    : {
	       left  : 'prev,next today',
	       center: 'title',
	       right : 'month,agendaWeek,agendaDay'
	     },
		selectable: false,
		selectHelper: true,
		select: function(start, end, allDay) {
			var title = prompt('Event Title:');
			if (title) {
				calendar.fullCalendar('renderEvent',
					{
						title: title,
						start: start,
						end: end,
						allDay: allDay
					},
					true // make the event "stick"
				);
			
			}
			
			var data={	
					
					"title":title,
					"starttime":start,
					"endtime":endtime,
			}
			
			$.ajax({
				url:"<%=request.getContextPath()%>/registCal",
				type:"post",
				data:JSON.stringify(data),	
				headers:{
					"Content-Type":"application/json",
					"X-HTTP-Method-Override":"post"
				},
				success:function(data){
					if(data="SUCCESS"){
						getPage("<%=request.getContextPath()%>/calendar");			
					}else{
						alert('댓글 등록이 취소되었습니다.');
					}	
				},
				error:function(error){
					alert('서버 오류로 인하여 댓글 등록을 실패했습니다.');
				}
			});
			
			
			calendar.fullCalendar('unselect');
			
			
		},
		editable: true,     
		events: events
	});
});
</script>

