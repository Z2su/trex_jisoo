var miniCaln;
var wrtTbl;
var input_cl;//input 클래스	
var td_padd; // table td의 패딩
var cl_val="";
var m_CurrentDate = null;


function initCal(input_class) // 초기 실행시 초기화 
{ 	
	miniCaln=jQuery("#miniCaln");
	wrtTbl=jQuery("table.wrtTbl");
	td_padd=9;
	miniCaln.hide();
	input_cl=jQuery("."+input_class);
	date = new Date();
	m_CurrentDate = date;
}

function input_click(in_cl_num){ // 인풋박스 클릭시  달력 띄우기
	cl_val=in_cl_num;
	var cal_pos = input_cl.eq(in_cl_num).position();
	var cal_pos2 = input_cl.eq(in_cl_num).parent().position();
	var cal_left=input_cl.eq(in_cl_num).height()+td_padd+cal_pos2.top;
	
	miniCaln.css({"left":cal_pos.left,"top":cal_left}).show();
	make_date();
	date_click_event();
}

function cal_close(){ // 달력 닫기
	miniCaln.hide();
}

function DP_FormatDate(d) // 오늘 구하기
{
	 var year = String(d.getFullYear());
	 var month = String(d.getMonth() + 1);
	 var mday = String(d.getDate());
	 var s = year + "-";
	 s += ((month.length < 2)? '0': '') + month;
	 s += '-' + ((mday.length < 2)? '0': '') + mday;
	 return s;
}

function today_cl(){
	//cl_val :클릭한  input 순서
	var today_text=miniCaln.find(">p.todayDate > a  > span").text();
	input_cl.eq(cl_val).val(today_text);
	cal_close();
		
}

function make_date(date){
	
	var today=new Date;
	
	if (date == null)
		date = m_CurrentDate;
	if (date == null)
		date = today;
	
	var year = date.getFullYear();
	var month = date.getMonth() + 1;
	
	var cYear=jQuery("#cYear");
	var cMonth=jQuery("#cMonth");
	
	//select box 년 출력
	cYear.children().each(function(n){
		jQuery(this).remove();
	});
	var i, y;
	for (i = 0, y = year - 3; y < year + 4; i++, y++)
	{ 
		if (y == year) var selected="selected='selected'"
		else selected="";
		jQuery("<option "+selected+" value="+y+">"+y+"년"+"</option>").appendTo(cYear);
	}
	
	// select box 월출력
	cMonth.find("option").eq(month-1).attr("selected","selected='selected'");
	
	//오늘 구하기
	miniCaln.find(">p.todayDate > a >  span").text(DP_FormatDate(today));
	
	var cal = new DP_Calendar(year, month);
	i = 1;
	ist_num = 0;

	var tb_cal = document.getElementById("tbl_cal");
		// 달력 초기화
	var td_=jQuery(">tbody>tr",tb_cal);
	
	if(td_.size() > 4){
		td_.each(function(n){
			if(n!=0){
				jQuery(this).remove();
			}		
		});	
	}

	while (cal.hasNextWeek()) {
		var w = cal.nextWeek();
		
		var tr = tb_cal.insertRow(i);
		while (w.hasNextDate()) {
			var d = w.nextDate();
			var cr_td = document.createElement("td");
			var td = tr.appendChild(cr_td);
		
			td.id = DP_FormatDate(d);
			
			td.className = (cal.month == d.getMonth()) ? 'DPDate' : 'DPDate2';
			if (DP_DateEquals(d, m_CurrentDate)){
				td.style.fontWeight = 'bold';
				td.style.color = 'black';
			} 
			if(d.getDay()==0){
				td.style.color = 'red';
			}else if(d.getDay()==6){
				td.style.color = 'blue';
			}
			//if(){}	
			td.innerHTML = d.getDate();
			
		}
		i++;
	}
}

function DP_Calendar(year, month)
{
 if (year == null || month == null)
 {
  var d = new Date();
  this.year = d.getFullYear();
  this.month = d.getMonth();
 }
 else
 {
  this.year = year;
  this.month = month - 1;   // Date 개체의 경우 달은 0부터 시작
 }
 
 this.first_week = new DP_Week(new Date(this.year, this.month, 1));
 this.last_date = new Date(this.year, this.month + 1, 1);
 this.next_week = this.first_week;

 // methods
 this.reset = DP_Calendar_Reset;
 this.hasNextWeek = DP_Calendar_HasNextWeek;
 this.nextWeek = DP_Calendar_NextWeek;
}


function DP_Calendar_Reset()
{
 this.last_week = this.first_week;
}

function DP_Calendar_HasNextWeek()
{ 
 return DP_DateCompare(this.next_week.date, this.last_date) < 0;
}

function DP_Calendar_NextWeek()
{
 next_week = this.next_week;
 this.next_week = next_week.nextWeek();
 return next_week;
}

function DP_Week(date)
{
 // methods
 this.hasNextDate = DP_Week_HasNextDate;
 this.nextDate = DP_Week_NextDate;
 this.nextWeek = DP_Week_NextWeek;
 this.getWeekFirstDate = DP_Week_GetWeekFirstDate;
 this.equals = DP_Week_Equals;
 this.compare = DP_Week_Compare;
 this.reset = DP_Week_Reset;

 // fields
 this.index = 0;

 if (date == null)
  date = new Date();
 this.date = this.getWeekFirstDate(date);
}

function DP_Week_Reset()
{
 this.index = 0;
}

function DP_Week_GetWeekFirstDate(date)
{
 var d = new Date(date.valueOf());
 var wday = d.getDay();
 d.setDate(d.getDate() - wday);
 return d;
}

function DP_Week_HasNextDate()
{
 return (this.index < 7)
}

function DP_Week_NextDate()
{
 if (this.index >= 7)
  return null;

 var d = new Date(this.date.valueOf());
 d.setDate(d.getDate() + this.index);
 this.index ++;
 return d;
}

function DP_Week_NextWeek()
{
 var d = new Date(this.date.valueOf());
 d.setDate(d.getDate() + 7);
 return new DP_Week(d);
}

function DP_Week_Equals(week)
{
 return DP_DateEquals(this.date, week.date);
}

function DP_Week_Compare(week)
{
 return Date_Compare(this.date, week.date);
}


function DP_ParseDate(dstr)
{
 var str = String(dstr);
 if (str == null || str == '')
  return null;

 if (str.match(/(\d{4})-(\d{2})-(\d{2})/))
 {
  var year = Number(RegExp.$1);
  var month = Number(RegExp.$2) - 1;
  var mday = Number(RegExp.$3);
  return new Date(year, month, mday);s
 }
 else
  return null;
}

function DP_DateEquals(d1, d2)
{
 return (
  (d1.getFullYear() == d2.getFullYear()) &&
  (d1.getMonth() == d2.getMonth()) &&
  (d1.getDate() == d2.getDate())
 )
}

function DP_DateCompare(d1, d2)
{ 
 if (d1.getFullYear() > d2.getFullYear()){  return 1;}
 else if (d1.getFullYear() < d2.getFullYear()){  return -1;}
 else if (d1.getMonth() > d2.getMonth()){  return 1;}
 else if (d1.getMonth() < d2.getMonth()){  return -1;}
 else if (d1.getDate() > d2.getDate()){  return 1;}
 else if (d1.getDate() < d2.getDate()){  return -1;}
 else
  return 0;
}


function _pickDate(date_str)
{
	if (parent.DP_GetPickedDate != null)
	{
		parent.DP_GetPickedDate(date_str);
	}
}

function _disablePicker()
{
	if (parent.DP_DisablePicker != null)
	{
		parent.DP_DisablePicker();
	}
}

function DPCalendar_click(e)
{	
	var myEvt = e ? e.currentTarget : window.event.srcElement;   	
	if (myEvt.tagName == 'SPAN' && myEvt.id == 'DPToday')
		_pickDate(myEvt.innerHTML);

	return false;
}


function DPCalendar_PrevMonth()
{ 		

	var DPYear = document.getElementById("cYear");
	var DPMonth = document.getElementById("cMonth");
	if (
		(DPYear.selectedIndex == -1 || DPYear.options[DPYear.selectedIndex].value == '') ||
		(DPMonth.selectedIndex == -1 || DPMonth.options[DPMonth.selectedIndex].value == '')
	)
		return;
	var year = Number(DPYear.options[DPYear.selectedIndex].value);
	var month = Number(DPMonth.options[DPMonth.selectedIndex].value);
	var date = new Date(year, month - 2, 1);
	make_date(date);
    date_click_event();
}

function DPCalendar_NextMonth()
{
	var DPYear = document.getElementById("cYear");
	var DPMonth = document.getElementById("cMonth");
	if (
		(DPYear.selectedIndex == -1 || DPYear.options[DPYear.selectedIndex].value == '') ||
		(DPMonth.selectedIndex == -1 || DPMonth.options[DPMonth.selectedIndex].value == '')
	)
		return;

	var year = Number(DPYear.options[DPYear.selectedIndex].value);
	var month = Number(DPMonth.options[DPMonth.selectedIndex].value);
	var date = new Date(year, month, 1);

	make_date(date);
	date_click_event();

}

function DPCalendar_ChangeMonth()
{
	var DPYear = document.getElementById("cYear");
	var DPMonth = document.getElementById("cMonth");
	if (
		(DPYear.selectedIndex == -1 || DPYear.options[DPYear.selectedIndex].value == '') ||
		(DPMonth.selectedIndex == -1 || DPMonth.options[DPMonth.selectedIndex].value == '')
	)
		return;

	var year = Number(DPYear.options[DPYear.selectedIndex].value);
	var month = Number(DPMonth.options[DPMonth.selectedIndex].value);
	var date = new Date(year, month - 1, 1);

	make_date(date);
	date_click_event();

}


function date_click_event(){

	jQuery("td.DPDate2").click(click_hide);
	jQuery("td.DPDate").click(click_hide);
}

function click_hide(){

	var date_in=jQuery(this).attr("id");
	var class_name=jQuery(this).attr("class");
	
	input_cl.eq(cl_val).val(date_in);
	miniCaln.css("display","none");

}