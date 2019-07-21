<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<script>
		var pf_code = $('#pf_code').val();

		var input = $('<input type="hidden" value="'+pf_code+'" name="pf_code"/>');
		//$('#formCalendar').prepend(input);
	</script>


<script>
var nextindex=0;

	var background= ["#7C68EE", "#1CA814", "#17B3FF","#FB7E4F","#A0D53F"];
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
	
	function pfshajax(rundate){
		nextindex=1;
		/* s_rundate=new Date($(this).attr('run'));
		e_rundate=new Date($(this).attr('run'));
		e_rundate.setDate(e_rundate.getDate()+1); */
		//alert(s_rundate+"~~"+e_rundate); 
		$('#'+runday).css("background-color","#FF9933");
		$('#MyPlayDate').empty();
		$('#MyPlayDate').text(rundate);
		//$(this).parent().css("background-color","#c50102");
		//alert("ㅎㅎ"+$(this).parent().attr('id'));

		//alert(typeof(dat));
		$.ajax({
			url:"<%=request.getContextPath()%>/performrese/pfsh",
			type : "post",
			data : {
					"rundate":String(rundate),
					"pf_code":pf_code
					},
			
			success : function(data) {
				$('#TagPlaySeq').empty();
				var ul = '<ul>';
				$.each(data, function(idx, val) {
					//alert(idx + " " + new Date(val.starttime));
					
					/* <ul>
					<li>
					<a id="CellPlaySeq" name="CellPlaySeq" href="#;" onclick="fnSelectPlaySeq(0, '001', '20190819', '15시 00분 ', 'N', '201908222359')">15시 00분 </a>
					</li>
					<li><a id="CellPlaySeq" name="CellPlaySeq" href="#;" onclick="fnSelectPlaySeq(1, '002', '20190819', '19시 30분 ', 'N', '201908222359')">19시 30분 </a></li></ul> */
					
					ul+='<li><a id="CellPlaySeq" href="#" onclick="seat_go();" name ="" pfsh_code="'+val.pfsh_code+'"value="'+new Date(val.starttime)+'">'+new Date(val.starttime)+'</a></li>';
					//var option = $('<option value="'+val.pfsh_code+'">'+val.starttime+'</option>');								
				});
					ul+='</ul>';
					$('#TagPlaySeq').append(ul);

			},
			error : function(error) {

				alert("오류");
			}

		});

		

	}
	
	function seat_go(){
		nextindex=2;
		var pfsh_code = $(this).attr('pfsh_code');
		var input = $('<input type="hidden" value="'+pfsh_code+'" name="pfsh_code"/>');
		$('#trexinfo').prepend(input);
		$.ajax({
			url:"<%=request.getContextPath()%>/performrese/pfsh1",
			type : "post",
			data : {
					"pfsh_code":pfsh_code
					},
			
			success : function(data) {
				$('#TagRemainSeat').empty();
				var ul = '<ul>';
				$.each(data, function(idx, val) {
					//alert(background[idx] + " " + val.count);
					
					  
					ul+='<li><div class="lv" style="background:'+background[idx]+'"></div><div class="lv_det">'+val.grade+'석 | '+val.count+'석</div></li>';
					//var option = $('<option value="'+val.pfsh_code+'">'+val.starttime+'</option>');								
				});
					ul+='</ul>';
					$('#TagRemainSeat').append(ul);


			},
			error : function(error) {

				alert("오류");
			}

		});
		/* $('#LargeNextBtn').on('click',function(){
			alert("다음으로~");
		}) */
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

						tr += '<td class="sun" id="'+dNum+'">' + dNum
								+ '<span class="blind">일 예매 불가능</span></td>';

					} else {
						tr += '<td id="'+dNum+'">' + dNum
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
	
	$('#LargeNextBtn').on('click',function(){
		if(nextindex==0){
			alert('날짜선택');
			return;
		}
		if(nextindex==1){
			alert("시간선택");
			return;
		}
		if(nextindex==2){
			alert("넘어가자");
			
		}
	})
</script>


