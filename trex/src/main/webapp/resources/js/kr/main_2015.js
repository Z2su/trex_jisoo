/***** 리뉴얼 15.6 *****/

/* top-find */
$(function(){
	$(".findTxt").focus(function(){
		$(".top_find label").css("visibility","hidden");
	}).blur(function(){
	   if($(this).val().length == 0) {
		   $(".top_find label").css("visibility","visible");
	    }
	});
});

/* calender */
function kCalendar(){

	var calDate = $("#calendar .date");
	var calWeek = $("#calendar .msc_num .mask");

	var duration = 1000;
	var method = "easeInOutExpo";

	var dayList = $("#mshedule .msc_list");
	
	var prevDate = null;
	var nextDate = null;

	// ---- 개발
	//var resultDate; //현재 currentYear(년),currentMonth(월),currentDate(일) 저장
	var resultDate;

	var resultYear = 0;
	var resultMonth = 0;
	var resultDay = 0; 
	// ---- 개발

	var html = '';

	function _calender(date){	
		if( typeof( date ) !== 'undefined' ) {
			date = date.split('-');
			date[1] = date[1] - 1;
			date = new Date(date[0], date[1], date[2]);
		} else {
			var date = new Date();
		}

		var currentYear = date.getFullYear();
		var currentMonth = date.getMonth() + 1;
		var currentDate = date.getDate();
		
		date.setDate(1);
		var currentDay = date.getDay();

		var dateMonth = new Array('January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December');
		var dateString = new Array('S', 'M', 'T', 'W', 'T', 'F', 'S');
		var lastDate = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
		if( (currentYear % 4 === 0 && currentYear % 100 !== 0) || currentYear % 400 === 0 ){
			lastDate[1] = 29;
		}
		
		var currentLastDate = lastDate[currentMonth-1];
		var week = Math.ceil( ( currentDay + currentLastDate ) / 7 );

		if(currentMonth != 1){
			prevDate = currentYear + '-' + ( currentMonth - 1 ) + '-' + currentDate;
		}else{
			prevDate = ( currentYear - 1 ) + '-' + 12 + '-' + currentDate;
		}
		
		if(currentMonth != 12){
			nextDate = currentYear + '-' + ( currentMonth + 1 ) + '-' + currentDate;
		}else{
			nextDate = ( currentYear + 1 ) + '-' + 1 + '-' + currentDate;
		}

		if( currentMonth < 10 ){
			var currentMonth = '0' + currentMonth;
		}

		for(var j = 0; j < 12; j++){
			if(j+1 == currentMonth){
				dateMonth[j];
				calDate.find('.cmonth_en').text(dateMonth[j]);
			}
		}
		calDate.find('.cyear').text(currentYear+'.');
		calDate.find('.cmonth').text(currentMonth);

		var dateNum=1-currentDay;
		
		html = '<ul>'
		for(var i = 0; i < week; i++){
			for(var j = 0; j < 7; j++, dateNum++){
				if(dateNum < 1 || dateNum > currentLastDate){
					continue;
				}
				html += ('<li class='+dateString[j]+'>'+dateString[j]+'<span><a href="#'+dateNum+'">'+dateNum+'</a></span></li>');
			} 
		}
		html += '</ul>'

		resultYear = currentYear;
		resultMonth = currentMonth;
	}
	_calender();
	calWeek.html(html);

	calDate.find("a[rel=prev]").bind("click",function(event){
		dayList.hide();

		_calender(prevDate);
		calWeek.prepend(html);

		calWeek.css("top",60*-1);
		calWeek.stop().animate({top:0},duration,method,function(){
			calWeek.find("ul:last").remove();
			_daycontrol();
		});	

		event.preventDefault();
	});
	
	calDate.find("a[rel=next]").bind("click",function(event){
		dayList.hide();

		_calender(nextDate);
		calWeek.append(html);

		calWeek.stop().animate({top:60*-1},duration,method,function(){
			calWeek.find("ul:first").remove();
			calWeek.css("top",0);
			_daycontrol();
		});

		event.preventDefault();
	});

	function _daycontrol(){
		
		calWeek.find("a").on("click",function(event){
			var pog = $(this).position();

			calWeek.find("a").removeClass("ov");
			$(this).addClass("ov");

			resultDay = Number($(this).text()); //현재 저장
			resultDate = [resultYear,resultMonth,resultDay]; //현재 년/월/일

			$.get("//www.djac.or.kr" + "/_prog/program/ajax_p_info_call.php?p_date=" + resultDate, function(data,status)
			{	

				if(status == "success")
				{
					dayList.empty();
					dayList.append(data);
					_daycolse(); //일별공연목록 닫기기능
					$('.scrollbar-outer').scrollbar(); //스크롤바 디자인
				}
			});

			dayList.hide();
			dayList.css({"left":pog.left+22,"bottom":45}).show();
						
			//console.log(resultDate);

			event.preventDefault();
		});
	}
	_daycontrol();

	function _daycolse(){
		dayList.find("a[rel=close]").bind("click",function(event){
			dayList.hide();
			calWeek.find("a").removeClass("ov");
			event.preventDefault();
		});
	}
}

/* fulldown-menu */
function topmenu(param,btn,obj,index,wraper){
	var param = $(param);
	var btn = param.find(btn);
	var obj = param.find(obj);
	var wraper = param.find(wraper);

	var oldHeight = param.height();
	var newHeight = oldHeight;

	var elem = index;

	btn.append('<span class="arrow"></span>');

	var open = function(){
		newHeight = obj.outerHeight(true);
		btn.not(elem).removeClass('current').parent().find('#tms ul').removeClass('ov');
		btn.eq(elem).addClass('current').parent().find('#tms ul').addClass('ov');
		wraper.stop(true,false).animate({height:newHeight+oldHeight},300,'easeOutExpo');
		btn.not(elem).find('.arrow').stop(true,true).hide();
		btn.eq(elem).find('.arrow').stop(true,true).show();
		param.css('z-index','100');
	};

	var close = function(){
		wraper.stop(true,false).animate({height:oldHeight},300,'easeInExpo',function(){
			param.css('z-index','1');
		});
		btn.not(elem).removeClass('current').parent().find('#tms ul').removeClass('ov');
		btn.not(index).find('.arrow').stop(true,true).hide();
		btn.eq(index).find('.arrow').stop(true,true).show();
	};

	btn.on("mouseenter focusin",function(){
		var t = $(this);
		elem = t.parent().index();
		$(document).queue(open).dequeue();
	});

	btn.next().on("mouseenter",function(){
		var t = $(this).parent().find("a");
		elem = t.parent().index();
		$(document).queue(open).dequeue();
	});

	wraper.on("mouseleave",function(){
		$(document).queue(close).dequeue();
	});

	$(".tmect>#tms>a").on("focusout",function(){
		$(document).queue(close).dequeue();
	});
}

/* obj-scroll */
function stateScrollObj(param,obj,btn,interval,speed,viewSize,moreSize,dir,data,auto,hover,method,op1,h){
	var param = $(param);
	var btn = $(btn);
	var obj = param.find(obj);

	var elem = 0;
	var objYScale = obj.eq(elem).outerHeight(true)+moreSize;
	var objXScale = obj.eq(elem).outerWidth(true)+moreSize;
	var str;
	var returnNodes;

	var playdir = data;
	var data = data; // 0:default, 1:prev

	var play = btn.find("[rel=play]");
	var stop = btn.find("[rel=stop]");

	if(op1 == true) obj.not(elem).css({opacity:0}).eq(elem).css({opacity:1});

	function movement(){
		if(obj.parent().find(":animated").size()) return false;
		switch(data){
			case 0:
				if(dir == "x"){
					obj.parent().stop(true,true).animate({left:-objXScale},{duration:speed,easing:method,complete:
						function(){
							obj.parent().css("left",0);
							str = obj.eq(elem).detach();
							obj.parent().append(str);
							if(elem == obj.size()-1){
								elem = 0;
							}else{
								elem++;
							}
							objXScale = obj.eq(elem).outerWidth(true)+moreSize;
						}
					});
				}else{ 
					obj.parent().stop(true,true).animate({top:-objYScale},{duration:speed,easing:method,complete:
						function(){
							obj.parent().css("top",0);
							str = obj.eq(elem).detach();
							obj.parent().append(str);
							if(elem == obj.size()-1){
								elem = 0;
							}else{
								elem++;
							}
							objYScale = obj.eq(elem).outerHeight(true)+moreSize;
						}
					});
				}

				if(op1 == true){
					obj.eq(elem).stop(true,true).animate({opacity:0},{duration:speed,easing:method});
					obj.eq(elem).next().stop(true,true).animate({opacity:1},{duration:speed,easing:method});
				}
			break;
			
			case 1:
				if(dir == "x"){
					if(elem == 0){
						elem = obj.size()-1;
					}else{
						elem--;
					}
					objXScale = obj.eq(elem).outerWidth(true)+moreSize;
					obj.parent().css("left",-objXScale);
					str = obj.eq(elem).detach();
					obj.parent().prepend(str);
					obj.parent().stop(true,false).animate({left:0},{duration:speed,easing:method});
				}else{
					if(elem == 0){
						elem = obj.size()-1;
					}else{
						elem--;
					}
					objYScale = obj.eq(elem).outerHeight(true)+moreSize;
					obj.parent().css("top",-objYScale);
					str = obj.eq(elem).detach();
					obj.parent().prepend(str);
					obj.parent().stop(true,false).animate({top:0},{duration:speed,easing:method});
				}

				if(op1 == true){
					obj.eq(elem).stop(true,false).animate({opacity:1},{duration:speed,easing:method});
					obj.eq(elem).next().stop(true,false).animate({opacity:0},{duration:speed,easing:method});
				}
			break;
			
			default: alert("warning, 0:default, 1:prev, data:"+data);
		}
	}
	
	function rotate(){
		clearInterval(returnNodes);
		returnNodes = setInterval(function(){
			movement();
		},interval);
	}

	if(obj.size() <= viewSize) return false;

	obj.find("a").bind("focusin",function(){
		clearInterval(returnNodes);
	});
	
	btn.find("a[rel=play]").bind("click",function(event){
		data = playdir;
		if(play.css("display") == "none"){
			play.hide();
			stop.show();
		}
		rotate();
		return false;
	});
	
	btn.find("a[rel=stop]").bind("click",function(event){
		clearInterval(returnNodes);
		param.find(":animated").stop();
		if(play.css("display") == "none"){
			stop.hide();
			play.show();
		}
		return false;
	});
	
	btn.find("a[rel=prev]").bind("click",function(event){
		clearInterval(returnNodes);
		data = 1;
		movement();
		// add
		if(play.css("display") == "none"){
			stop.hide();
			play.show();
		}
		return false;
	});
	
	btn.find("a[rel=next]").bind("click",function(event){
		clearInterval(returnNodes);
		data = 0;
		movement();
		// add
		if(play.css("display") == "none"){
			stop.hide();
			play.show();
		}
		return false;
	});
	
	if(hover == true){
		obj.hover(function(){
			clearInterval(returnNodes);
		},function(){
			rotate();
		});
	}
	
	if(auto == true) rotate();

	if(h==true){
		play.hide();

		stop.click(function(){
		var t = $(this);
		t.hide();
		play.show();

		return false;
		});

		play.click(function(){
		var t = $(this);
		t.hide();
		stop.show();

		return false;
		});
	}
}

function tabScrollObj(obj,number,auto){
	var obj = $(obj);
	var number = $(number);

	var elem = 0;
	var duration = 1000;
	var method = "easeInOutExpo";
	var objYScale = obj.eq(elem).outerHeight(true);
	
	$.each(obj,function(e){
		obj.eq(e).attr('id','num_'+(e+1));
		number.eq(e).attr('href','#num_'+(e+1));
	});

	// 넘버링
	function number_control(t){
		var current = $("[id=num_"+(t.parent().index()+1)+"]"); // 현재 index 찾기.

		if(elem != t.parent().index()){
			elem = t.parent().index();

			obj.parent().stop(true,false).animate({top:current.position().top*-1},duration/2,method);
			obj.not(current.index()).stop(true,false).animate({opacity:0},duration,method);
			current.stop(true,false).animate({opacity:1},duration,method);
		}
	}

	function number_active(){
		number.parent().not(elem).removeClass("ov");
		number.parent().eq(elem).addClass("ov");
	}

	number.bind("click",function(event){
		clearInterval(movement);
		number_control($(this));
		number_active();
		event.preventDefault();
	});
	
	obj.on('mouseenter',function(){
		clearInterval(movement);
	});

	function autoplay(){
		movement = setInterval(function(){
			obj.parent().stop(true,true).animate({top:-objYScale},duration,method,function(){
				obj.parent().css("top",0);
				obj.parent().append(obj.eq(elem).detach());
				if(elem == obj.size()-1) elem = 0; else elem++;
				objYScale = obj.eq(elem).outerHeight(true);
				number_active();
			});
		},5000);
	}
	if(auto != false) autoplay();
}

/* obj-Popzone */
function commonPopzone(param,btn,obj,auto,f,s,p,h){
	var param = $(param);
	var btn = param.find(btn);
	var obj = param.find(obj);

	var stop = btn.find("a[rel=stop]");
	var play = btn.find("a[rel=play]");

	var returnNodes; // 버튼 이벤트를 위해 반복 명령 받아두기
	var elem = 0;
	var fade = f;
	var speed = s;
	var data = "";

	// setup
	obj.hide().eq(0).show();

	//페이징
	if(p.use==true){
		var target = param.find(p.path);

		if(p.type == null){
			$.each(obj,function(e){
				target.append('<a href="#">'+(e+1)+'</a>');
			});
			var pbtn = target.find("a");

			pbtn.not(elem).removeClass("ov").eq(elem).addClass("ov");
			pbtn.bind("click",function(event){
				clearInterval(returnNodes);
				var t = $(this);
				elem = t.index();
				pbtn.not(elem).removeClass("ov").eq(elem).addClass("ov");
				obj.not(elem).stop(false,true).fadeOut(f/2).eq(elem).stop(false,true).fadeIn(f/2);
				stop.hide();
				play.show();
				event.preventDefault();
			});
		}

		if(p.type == 1){
			target.html("<em>"+(elem+1)+"</em>/"+obj.size());
		}
	}

	function init(n){
		if(data == "prev"){
			if(elem != 0) elem--; else elem = obj.length-1;	 
		}else{
			if(elem<obj.length-1) elem++; else elem = 0;
		}		

		if(p.use==true){
			if(p.type == null) pbtn.not(elem).removeClass("ov").eq(elem).addClass("ov");
			if(p.type == 1) target.children().text(elem+1);
		}

		obj.not(elem).stop(true,true).fadeOut(n).eq(elem).stop(true,true).fadeIn(n);
	}

	function rotate(){ returnNodes = setInterval(function(){ init(f); },speed); } // 초단위 반복

	if(h==true) play.hide();
	if(obj.size() <= 1 ) return false; // 팝업 갯수가 하나면 실행하지않습니다.
	if(auto != false) rotate();
	
	// 포커스 들어오면 멈춤
	obj.find("a").bind("focusin",function(){
		clearInterval(returnNodes);
		if(h==true){
			stop.hide();
			play.show();
		}
	});

	// 멈춤
	btn.find("a[rel=stop]").bind("click",function(event){
		clearInterval(returnNodes);
		if(h==true){
			stop.hide();
			play.show();
		}
		event.preventDefault();
	});
	
	// 시작
	btn.find("a[rel=play]").bind("click",function(event){
		clearInterval(returnNodes);
		if(h==true){
			play.hide();
			stop.show();
		}
		rotate();
		event.preventDefault();
	});
	
	// 이전
	btn.find("a[rel=prev]").bind("click",function(event){
		clearInterval(returnNodes);
		data = "prev";
		init(f/2);
		if(h==true){
			stop.hide();
			play.show();
		}
		event.preventDefault();
	});
	
	// 다음
	btn.find("a[rel=next]").bind("click",function(event){
		clearInterval(returnNodes);
		data = "next";
		init(f/2);
		if(h==true){
			stop.hide();
			play.show();
		}
		event.preventDefault();
	});
}

/* obj-tab */
function latest_bbs(param,btn,obj,event){
	var param = $(param);
	var btn = param.find(btn);
	var obj = param.find(obj);
	
	obj.hide().eq(0).show();
	btn.eq(0).addClass("ov");
	
	btn.bind(event,function(){
		var t = $(this);

		btn.removeClass("ov");
		t.addClass("ov");
		
		obj.hide();
		t.parent().next().show();
		
		return false;
	});
}

/* popup-top */
function layer_popup_top(){
	var param = $("#popupTop");
	var obj = param.find(".obj>li");
	var btn = param.find(".control>a");
	var elem = 0;
	var rel = null;
	var duration = 1000;
	var method = "easeInOutCubic";	

	$.each(obj,function(e){
		$(this).attr("class","item"+(e+1));
	});

	function init_movement(){
		if(rel == "prev"){
			if(elem > 0) elem--; else elem = obj.size()-1;
			obj.parent().css({left:(obj.eq(elem).outerWidth())*-1});
			obj.parent().prepend(obj.eq(elem).detach());
			obj.parent().stop(true,false).animate({left:0},duration,method);
		}
		if(rel == "next"){
			if(elem < obj.size()-1) elem++; else elem = 0;
			obj.parent().stop(true,false).animate({left:(obj.eq(elem).outerWidth())*-1},duration,method,function(){
				obj.parent().append(obj.eq(elem).prev().detach());
				obj.parent().css({left:0});
			});
		}
	}
	btn.unbind().bind("click",function(event){
		rel = $(this).attr("rel");
		init_movement();
		event.preventDefault();
	});
}