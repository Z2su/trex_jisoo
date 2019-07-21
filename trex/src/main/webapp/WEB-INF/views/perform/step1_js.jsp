<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

	<script>
		var pf_code = $('#pf_code', parent.document).val();

		var input = $('<input type="hidden" value="'+pf_code+'" name="pf_code"/>');
		$('#formCalendar').prepend(input);
	</script>



	<script>
	function parse(str){
		var year = str.substr(0,4);
		var month = str.substr(4,2);
		var date = str.substr(6,2);
		return new Date(year,month-1,date); 
	};
	
	var rundateval = $('#rundate').val();
	var pfsh_code;
	let year ;
	let month ;
	let date ;
	var today = parse(rundateval);
	//alert("rundateval>>>>>"+rundateval.getDate());
	/* var rundate;  */
	var runday;
	var runmonth;
	var a;
	var idx = 0;
	var s_rundate;
	var e_rundate;

	
	var rundateFunc=function(){
		
		$('input#rundate').each(function(index, item){
			var rundate = parse($(item).val());
			runmonth = rundate.getMonth()+1;
			runday = rundate.getDate();
		
			pfsh_code = $(item).attr('pfsh_code');
			//alert("ㅋㅋ"+pfshcode);
			
			
			//alert(typeof($(item).val())+"ㅎㅎ"+rundate);
			if(runmonth == month && rundate.getFullYear()==year){
				$('#'+runday).css("background-color","#FF9933");
				$('#'+runday).empty();
				$('#'+runday).prepend(
				$('<a id="CellPlayDate" run="'+rundate+'"name="CellPlayDate" class="sel1" href="#" onclick="pfshajax('+$(item).val()+');">'+runday+'<span class="blind">일 예매 가능</span></a>'));
			}
			//$('#'+day.getDate()).empty();
			
		});
	};
	
	function pfshajax(data){
		/* s_rundate=new Date($(this).attr('run'));
		e_rundate=new Date($(this).attr('run'));
		e_rundate.setDate(e_rundate.getDate()+1); */
		//alert(s_rundate+"~~"+e_rundate); 
		var dat = parse(String(data));
		alert(typeof(dat));
		$.ajax({
			url:"<%=request.getContextPath()%>/performrese/pfsh",
			type:"post",
			data:dat,
		
			success:function(data){
				
			
			alert("성공>>"+data);
			
		},
			error:function(error){
			
			alert("오류");
		}
			
			
		});
		
		//alert("this~~~~..>"+$(this).attr('run'));
		/* var data = {
				"s_rundate":s_rundate,
				"e_rundate":e_rundate,
				"pf_code":pf_code
				
		} */
		
		/* $('input#rundate').each(function(index, item){
			alert("ㅎㅎ"+$(item).val());
			
		});
		 */
		
	}
	
	
		
		//var today = new Date();
		var calendarFunc = function() {
			 year = today.getFullYear();
			month = today.getMonth() + 1;
			date = today.getDate(); 
			$('#calendar tbody').empty();

			if (idx != 0) {
				$('.prev img').css("display", "block");

			} else if (idx == 0) {

				$('.prev img').css("display", "none");
			}

			let firstDate = new Date(year, month - 1, 1);
			let lastDate = new Date(year, month, 0)
			$('.month em:first-child').text(year);
			$('.month em:last-child').text(month)
			//alert("first: "+ firstDate.getDay() +", last : "+lastDate);

			var row = Math.ceil((firstDate.getDay() + lastDate.getDate()) / 7);
			//alert("row >>>>>"+row);
			var dNum = 1;
			for (var i = 1; i <= row; i++) {
				var tr = '<tr>';

				for (var j = 0; j < 7; j++) {
					if (i == 1 && j < firstDate.getDay()
							|| dNum > lastDate.getDate()) {
						tr += "<td></td>";
					} else {
						if (j == 0) {

							tr += '<td class="sun" id="'+dNum+'">'+dNum
									+ '<span class="blind">일 예매 불가능</span></td>';

						} else {
							tr += '<td id="'+dNum+'">'
									+ dNum
									+ '<span class="blind">일 예매 불가능</span></td>';
						}

						dNum++;
					}
				}

				tr += '</tr>';

				$('#calendar tbody').append(tr);

			}
			/* let days=["일","월","화","수","목","금","토"];
			let day=days[today.getDay()];
			let hour="00"+today.getHours();
			hour=hour.substring(hour.length-2);
			let minute="00"+today.getMinutes();
			minute=minute.substring(minute.length-2);
			let second="00"+today.getSeconds();
			second=second.substring(second.length-2);
			
			fullDate.text(year+"년 "+month+"월 "+date+"일 "+day+"요일");
			hours.text(hour);
			min.text(minute);
			sec.text(second); */
			rundateFunc();

		}
		calendarFunc();

		/* var time=setInterval(intervalFunc,1000); */

		function next() {
			today.setMonth(today.getMonth() + 1);
			idx++;
			calendarFunc();
		}
		function prev() {
			today.setMonth(today.getMonth() - 1);
			idx--;
			calendarFunc();
		}
		
		
		
		
		
		
	</script>
	

