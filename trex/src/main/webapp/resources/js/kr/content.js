jQuery(function(){
	
	var article = $('.faq .trigger');
	article.addClass('hide');
	article.find('.a').slideUp(100);
	article.eq(0).removeClass('hide').addClass('show');
	$('.faq .article .trigger').click(function(){
		var myArticle = $(this).parents('.article:first');
		if(myArticle.hasClass('hide')){
			article.addClass('hide').removeClass('show'); 
			article.find('.a').slideUp(100); 
			myArticle.removeClass('hide').addClass('show');
			myArticle.find('.a').slideDown(100);
		} else {
			myArticle.removeClass('show').addClass('hide');
			myArticle.find('.a').slideUp(100);
		}
	});
	
	$('.faq .hgroup .trigger').click(function(){
		var hidden = $('.faq .article.hide').length;
		if(hidden > 0){
			article.removeClass('hide').addClass('show');
			article.find('.a').slideDown(100);
		} else {
			article.removeClass('show').addClass('hide');
			article.find('.a').slideUp(100);
		}
	});
	
});


// plusmenu open
function plusOpen() {
	jQuery("#plusBox").css("display","none");
}
function box_open() {	
	document.getElementById('plusBox').style.display =  "block";
	document.getElementById('plusMenu').style.display =  "none";
}
function box_close() {
	document.getElementById('plusBox').style.display =  "none";
	document.getElementById('plusMenu').style.display =  "block";
}

//이미지오버
function imgOperation(){
	jQuery("a[rel*=ov]").hover(imgOv,imgOut);
}
function imgOv(){
	var old_img = jQuery(this).find(">img")[0].src;
	old_img = old_img.replace("_out","_ov");
	jQuery(this).find(">img")[0].src = old_img;
}
function imgOut(){
	var old_img = jQuery(this).find(">img")[0].src;
	old_img = old_img.replace("_ov","_out");
	jQuery(this).find(">img")[0].src = old_img;
}


//사이트맵 생성
function sitemap(){
	jQuery('select').css({"visibility":"hidden"});
	jQuery('#bottom select').css({"visibility":"visible"});
	//<![CDATA[
	jQuery('<div id="allmenu">\
				<div id="allmenuBox"></div>\
				<p class="allmenu_btn" id="sitemap_close">\
					<a href="#" onclick="sitemap_close()" onkeypress="">\
						<img src="/images/kr/common/allmenu_close.gif" alt="전체메뉴닫기" />\
					</a>\
				</p>\
			</div>').prependTo(jQuery("#total"));
	//]]>
	jQuery("#allmenuBox").load("/html/kr/sitemap.html");	
}
function sitemap_close(){
	jQuery('#allmenu').remove();
	jQuery('select').css({"visibility":"visible"});
}

//하단 셀렉트박스 링크처리
function bt_link(data){
	var slink = jQuery("#"+data)[0].value;
	var chkStr = "http";
	var check = slink.indexOf(chkStr);
	if(check==0){
		window.open(slink);
	} else {
		location.href = slink;
	}
}



// 메인 번호 텝
var enjoy_li;

function enjoy_init(){
	enjoy_li=jQuery("#enjoy >li");
	enjoy_li.find(">a").bind("mouseover",enjoy_hover);
	
}
function enjoy_hover(){
	var ej_index=jQuery(">a",enjoy_li).index(jQuery(this));
	var ej_set=ej_index+1;
	enjoy_li.find(">a").find(">img").each(function(n){var n_num=n+1; jQuery(this).attr("src","/images/kr/main/enjoy_0"+n_num+"_out.gif");});
	jQuery(this).find(">img").attr("src","/images/kr/main/enjoy_0"+ej_set+"_ov.gif");
	enjoy_li.find(">ul").hide();
	enjoy_li.find(">ul").eq(ej_index).show();
}

//메인  계절 그림  rotate
var old_set=2;
var useragent = navigator.userAgent;
function bg_change_init(){ // bg rotate 초기값 세팅
	var $j=jQuery;
	$j("#mbg_clone1").css({"z-index":"0","background":"url(/images/kr/main/main_02.jpg) repeat-x scroll center top"});
	$j("#mbg_clone2").css({"z-index":"1","background":"url(/images/kr/main/main_02.jpg) repeat-x scroll center top"});
	$j("#thumnail").css({"z-index":"2"});
}
//bg_change
function bg_change(set){ // main bg rotate
	jQuery("#thumnail").find(">ul>li>a > img").eq(old_set-1).attr("src","/images/kr/main/thumnail_0"+old_set+".gif");
	jQuery("#thumnail").find(">ul>li>a > img").eq(set-1).attr("src","/images/kr/main/thumnail_0"+set+"_ov.gif");
	old_set=set;
	var $j=jQuery;
	if ((useragent.indexOf('MSIE 6') > 0) && (useragent.indexOf('MSIE 7') == -1)){
		$j("#mbg_clone1").css({"z-index":"0","background":"url(/images/kr/main/main_0"+set+".jpg) repeat-x scroll center top"});
		$j("#mbg_clone2").css({"z-index":"1","background":"url(/images/kr/main/main_0"+set+".jpg) repeat-x scroll center top"});
		
	}else{
		
		$j("#mbg_clone2").stop();
		$j("#mbg_clone2").animate(
			{opacity:0}
			,0
			,function(){			
				$j("#mbg_clone2").css({"background":"url(/images/kr/main/main_0"+set+".jpg) repeat-x scroll center top"});
				$j("#mbg_clone2").animate(
					{opacity:1}
					,1500
					,function(){
						$j("#mbg_clone1").css({"background":"url(/images/kr/main/main_0"+set+".jpg) repeat-x scroll center top"});					
					}
				);
			}		
		);
	}
	
}



//셀렉트 변환
function selectbox_change(ch,int,bt,check){
	var data = jQuery("."+ch);
	var count = jQuery(data).find(" > ul > li").length;
	var select_label = jQuery(data).find(" > ul > li").eq(0).text();
	var checks = check;
	var btn_alt="";
	
	jQuery('<label for="select_link_'+int+'" style="position:absolute; font-size:0; height:0px; width:0px; line-height:0px; visibility:hidden">'+select_label+'</label><select id="select_link_'+int+'"></select>').appendTo(jQuery(data));
	jQuery('#select_link_'+int+'').css({"margin-right":"5px"});
	if(checks == "Y") {btn_alt = "선택 사이트 새창열기";}
	else {btn_alt = "선택 사이트로 이동";}
	jQuery('<a href="#" onclick="bt_link(\'select_link_'+int+'\');return false;" onkeypress=""><img src="/images/jiyong/common/'+bt+'.gif" alt="'+btn_alt+'" /></a>').appendTo(jQuery(data));
	jQuery(data).find(" > ul > li").each(
		function(n){			
			var selectLink = jQuery(this).find(">a").attr("href");
			var val = jQuery(this).find(">a").text();
			
			if(jQuery(this).find(">ul > li").size() == 0){ //기본
				jQuery('<option value="'+selectLink+'">'+val+'</option>').appendTo(jQuery(data).find(" > select"));
			} else if(jQuery(this).find(">ul > li").size() != 0){//그룹화 생성							
				jQuery('<optgroup label="'+val+'" class="optgroup_'+n+'"></optgroup>').appendTo(jQuery(data).find(" > select"));				for(i=0;i<jQuery(this).find(">ul > li").size();i++){					
					var selectLink2 = jQuery(this).find("ul>li:eq("+i+")>a").attr("href");
					var val2 = jQuery(this).find("ul>li:eq("+i+")>a").text();
					jQuery('<option value="'+selectLink2+'">'+val2+'</option>').appendTo(jQuery(data).find(" > select > optgroup.optgroup_"+n+""));	
				}				
			}
		}
	);
	jQuery(data).find(" > ul").remove();
	//jQuery("#"+int).css({"border":"1px solid #dadada","margin-right":"5px","height":"20px"});
}


// left menu
var left_menu_check = 0;
var left_check_show ="";
function left_init(set){
	$j = jQuery;
	left_check_show = set;
	$j(".lm_2th > li > div[id^=submenu]").hide();	
}
function left_play(){

	$j = jQuery;
	if(left_menu_check==0){
		left_view();
	} else {
		left_hide();
	}
}
function left_view(){
	//alert(this_code2);
	left_menu_check = 1;
	$j = jQuery;
	//$j(".lm_2th > li > div[id^=submenu]").parent().find(">a").removeClass("link_2th").end().find(">a").addClass("link_2th_ov").attr("ov_view","on");
	$j(".lm_2th > li > div[id^=submenu]").parent().find(">a").each(function (n){
		var true_false=jQuery(this).hasClass("link_2th");
		if(true_false){
			jQuery(this).removeClass("link_2th").addClass("link_2th_ov").attr("ov_view","on");
		}	
	} );
	//addClass(".link_2th_ov");
	$j(".lm_2th > li > div[id^=submenu]").show();
	$j("#left_menu_all > img")[0].src="/images/kr/common/open_no.gif";
	$j("#left_menu_all > img").attr("alt","메뉴감추기");
	//$j("#bodyWrap").css({"height":left_height()+"px"});
	// 추가사항
	//$j("#leftImage").css({"position":"relative"}); 
	$j("#leftWrap").css({"padding-bottom":0}); 		
}
function left_hide(){
	left_menu_check = 0;	
	$j = jQuery;
	$j(".lm_2th > li > div[id^=submenu]").hide();

	$j(".lm_2th > li").find(">a").each(function (n){
		if(n!=this_code2-1){
			jQuery(this).removeClass("link_2th_ov").addClass("link_2th");
			
		}else{
			//if(jQuery(this).find(">div[id^=submenu]").size()){
				jQuery(this).parent().find(">div").show();
			//}
		}
	});

	$j("#left_menu_all > img")[0].src="/images/kr/common/open_yes.gif";
	$j("#left_menu_all > img").attr("alt","메뉴펼치기");
	$j("#bodyWrap").css({"height":"auto"});
	//$j("#leftImage").css({"position":"absolute"}); 
	$j("#leftWrap").css({"padding-bottom":360});
	
}
//function left_height(){
//	var $j=jQuery;
//	return $j("#bodyWrap").height();
//}



//팝업창 관리.
// 사용법 <a href="#" rel="pop"></a>
// 사용법 <a href="#" rel="ov pop"></a>
function windowPop(){
	jQuery("a[rel*=pop]").click(function(){windowPopPlay(this);return false;});
}
function windowPopPlay(slink){
	var data = slink.name.split(",");
	var swidth = data[0];
	var sheight = data[1];
	if(slink.name)
	{
		window.open(slink.href,'','width='+swidth+',height='+sheight+'');
	} else {
		window.open(slink.href);
	}
}


//팝업존
var bt;
var btn;
var pz_id='';
var pz_num = 0;
var pz_time;
var pz_count = 0;
var effect;
function pz_view(obj,bt,eff){
	btn = bt;
	pz_id = jQuery("#"+obj);
	pz_id.find(" > ul > li").css({"position":"absolute"});
	pz_id.find(" > ul > li").hide();			
	pz_id.find(" > ul > li:eq(0)").show();
	//pz_id.find(" > div > span:eq(0)").show();
	effect=eff;//효과 관련
	pz_Play();// 배너 플래이
	if(bt == 'Y'){ // 버튼이 있을때 
		pz_id.find(" > div > span:eq(0)").find("img")[0].src = appendOv(pz_id.find(" > div > span:eq(0)").find("img")[0]);
		pz_id.find(" > div > span > a").click(function(){bn_click(this);return false;});
	}			
}

function bn_click(obj){
	obj.btnImg = jQuery(obj)[0].childNodes[0];				
	obj.li = jQuery(obj)[0].parentNode.parentNode;
	obj.num = pz_id.find(" > div > span > a").index(jQuery(obj));	
	pz_num = obj.num;
	btn_hide();
	obj.btnImg.src = appendOv(obj.btnImg);
	pz_id.find(" > ul > li").hide();
	pz_id.find(" > ul > li:eq("+obj.num+")").show().css({"z-index":"0"});
}

function btn_hide(){
	var obj = pz_id.find(" > div > span");				
	var count = obj.length;
	for(i=0; i<count; i++){	
		var img_src = obj[i].childNodes[0].childNodes[0];					
		img_src.src = removeOv(img_src.src);					
	}	
		
}

function removeOv(src){				
	src = src.replace("_ov","");
	return src;
}

function appendOv(img){				
	var obj = img;	
	var objImg = obj.src;
	var objImg_array = objImg.split("/");								
	objImg_array2 = objImg_array[objImg_array.length-1].split(".");					
	var imgpath = "";
	var imgsrc = "";
	var imgtype = objImg_array2[objImg_array2.length-1];
	var aaa;				
	for(i=0; i<objImg_array2.length-1; i++)
	{	
		if(i==objImg_array2.length-1){
			aaa = ".";
		} else {
			aaa = "";
		}
		for(k=0; k<objImg_array.length-1; k++)
		{
			imgsrc += objImg_array[k]+"/";						
		}
		imgpath = imgsrc;					
		imgpath += objImg_array2[i]+aaa;		
	}
	return imgpath+"_ov."+imgtype;
}

function j_banner_L(){
	if(pz_num != 0){
		pz_num--;
		pz_id.find(">ul>li").hide();
		if(effect=="Y"){
			pz_id.find(">ul>li").eq(pz_num).fadeIn();
		}else{
			pz_id.find(">ul>li").eq(pz_num).show();
		}
		btn_hide();
		if(btn == 'Y'){ 
			pz_id.find(">div.pzone_num>span:eq("+pz_num+")>a>img")[0].src = appendOv(pz_id.find(">div.pzone_num>span:eq("+pz_num+")>a>img")[0]);
		}
	}
	
}

function j_banner_R(){
	
	if(pz_num < pz_id.find(">ul>li").length-1){	
		pz_num++;
		pz_id.find(">ul>li").hide();	
		if(effect=="Y"){
			pz_id.find(">ul>li").eq(pz_num).fadeIn();
		}else{
			pz_id.find(">ul>li").eq(pz_num).show();
		}
		btn_hide();
		if(btn == 'Y'){ 
			pz_id.find(">div.pzone_num>span:eq("+pz_num+")>a>img")[0].src = appendOv(pz_id.find(">div.pzone_num>span:eq("+pz_num+")>a>img")[0]);
		}
	}
	
}
function PZ_Pcount(){
	if(pz_count == pz_id.find(">ul>li").length-1){
		pz_count = -1;
		pz_num = -1;
	}
	pz_count++;
	j_banner_R();
}
function pz_Play(){	
	pz_time = setInterval(PZ_Pcount,4000);
}
function j_banner_S(){
	clearInterval(pz_time);
}

function windowPop(slink,width,height){
	var swidth = width;
	var sheight = height;
	window.open(slink.href,'','width='+swidth+',height='+sheight+'');
}


// main prNote
var prNote_save_src = new Array;
function prTab(id){	
	prNote = jQuery("#"+id);		
	jQuery(prNote).find(">li>ul").hide();
	jQuery(prNote).find(">li>div").hide();
	jQuery(prNote).find(">li>ul:eq(0)").show();
	jQuery(prNote).find(">li>div:eq(0)").show();
	jQuery(prNote).find(">li").css({"float":"left"});	
	jQuery(prNote).find(">li>a>img").attr("rel","nov");
	jQuery(prNote).find(">li").hover(prNote_show,prNote_show);
	jQuery(prNote).find(">li").hover(prNote_img_ov,prNote_img_ov);
	jQuery(prNote).find(">li>a").each(function(n){
	jQuery(prNote).find(">li>a")[n].onfocus = prNote_img_ov_key;
	prNote_save_src[n] = jQuery(prNote).find(">li>a>img")[n].src;
	});	
	prNote_ov();
}

function prNote_ov(){
	var ori_img = jQuery(prNote).find(">li>a>img:eq(0)")[0].src;		
	var img_src = ori_img.split("/");
	var imgName = img_src[img_src.length-1];
	var imgName = imgName.split(".");
	var name = imgName[imgName.length-2];
	var type = imgName[imgName.length-1];
	name = name.replace("_ov","");
	var ov_img ='';
	
	for(i=0;i<img_src.length; i++)
	{
		if(i<(img_src.length-1)){ov_img += img_src[i]+"/";}		
	}	
	ov_img += name+"_ov."+ type;
	
	jQuery(prNote).find(">li>a>img:eq(0)")[0].src = ov_img;
}

function prNote_show(){	
	jQuery(prNote).find(">li>ul").hide();
	jQuery(prNote).find(">li>div").hide();
	jQuery(this)[jQuery(this).find(">ul:hidden").show()];	
	jQuery(this)[jQuery(this).find(">div:hidden").show()];	
}

function prNote_img_ov() {	
	jQuery(prNote).find(">li>a>img").not("rel*=no_ov").removeAttr("rel");				
	jQuery(this)[jQuery(this).find(">a>img").attr("rel","nov")];		
	
	var menu_length = jQuery(prNote).find(">li>a>img").length;
	var ori_img = jQuery(prNote).find(">li>a>img[rel*=nov]")[0].src;	
	var img_src = ori_img.split("/");
	var imgName = img_src[img_src.length-1];
	var imgName = imgName.split(".");
	var name = imgName[imgName.length-2];
	var type = imgName[imgName.length-1];
	name = name.replace("_ov","");
	var ov_img ='';
	for(s=0;s<menu_length; s++){jQuery(prNote).find(">li>a>img")[s].src = prNote_save_src[s];}
	for(i=0;i<img_src.length; i++){if(i<(img_src.length-1)){ov_img += img_src[i]+"/";}}	
	ov_img += name+"_ov."+ type;
	jQuery(this).find(">a>img").not("rel*=no_ov")[0].src = ov_img;
}

function prNote_img_ov_key() {	
	jQuery(prNote).find(">li>ul").hide();
	jQuery(this).parent()[jQuery(this).parent().find(">ul:hidden").show()];
	jQuery(this).parent()[jQuery(this).parent().find(">div:hidden").show()];			
	jQuery(prNote).find(">li>a>img").not("rel*=no_ov").removeAttr("rel");				
	jQuery(this)[jQuery(this).find(">img").attr("rel","nov")];		
	
	var menu_length = jQuery(prNote).find(">li>a>img").length;
	var ori_img = jQuery(prNote).find(">li>a>img[rel*=ov]")[0].src;				
	var img_src = ori_img.split("/");
	var imgName = img_src[img_src.length-1];
	var imgName = imgName.split(".");
	var name = imgName[imgName.length-2];
	var type = imgName[imgName.length-1];
	name = name.replace("_ov","");
	var ov_img ='';
	
	for(s=0;s<menu_length; s++){jQuery(prNote).find(">li>a>img")[s].src = prNote_save_src[s];}
	for(i=0;i<img_src.length; i++){if(i<(img_src.length-1)){ov_img += img_src[i]+"/";}}	
		
	ov_img += name+"_ov."+ type;	
	jQuery(this).find(">img").not("rel*=no_ov")[0].src = ov_img;
}


// main hbNote
var hbNote_save_src = new Array;
function hbTab(id){	
	hbNote = jQuery("#"+id);		
	jQuery(hbNote).find(">li>ul").hide();
	jQuery(hbNote).find(">li>div").hide();
	jQuery(hbNote).find(">li>ul:eq(0)").show();
	jQuery(hbNote).find(">li>div:eq(0)").show();
	jQuery(hbNote).find(">li").css({"float":"left"});	
	jQuery(hbNote).find(">li>a>img").attr("rel","nov");
	jQuery(hbNote).find(">li").hover(hbNote_show,hbNote_show);
	jQuery(hbNote).find(">li").hover(hbNote_img_ov,hbNote_img_ov);
	jQuery(hbNote).find(">li>a").each(function(n){
	jQuery(hbNote).find(">li>a")[n].onfocus = hbNote_img_ov_key;
	hbNote_save_src[n] = jQuery(hbNote).find(">li>a>img")[n].src;
	});	
	hbNote_ov();
}

function hbNote_ov(){
	var ori_img = jQuery(hbNote).find(">li>a>img:eq(0)")[0].src;		
	var img_src = ori_img.split("/");
	var imgName = img_src[img_src.length-1];
	var imgName = imgName.split(".");
	var name = imgName[imgName.length-2];
	var type = imgName[imgName.length-1];
	name = name.replace("_ov","");
	var ov_img ='';
	
	for(i=0;i<img_src.length; i++)
	{
		if(i<(img_src.length-1)){ov_img += img_src[i]+"/";}		
	}	
	ov_img += name+"_ov."+ type;
	
	jQuery(hbNote).find(">li>a>img:eq(0)")[0].src = ov_img;
}

function hbNote_show(){	
	jQuery(hbNote).find(">li>ul").hide();
	jQuery(hbNote).find(">li>div").hide();
	jQuery(this)[jQuery(this).find(">ul:hidden").show()];	
	jQuery(this)[jQuery(this).find(">div:hidden").show()];	
}

function hbNote_img_ov() {	
	jQuery(hbNote).find(">li>a>img").not("rel*=no_ov").removeAttr("rel");				
	jQuery(this)[jQuery(this).find(">a>img").attr("rel","nov")];		
	
	var menu_length = jQuery(hbNote).find(">li>a>img").length;
	var ori_img = jQuery(hbNote).find(">li>a>img[rel*=nov]")[0].src;	
	var img_src = ori_img.split("/");
	var imgName = img_src[img_src.length-1];
	var imgName = imgName.split(".");
	var name = imgName[imgName.length-2];
	var type = imgName[imgName.length-1];
	name = name.replace("_ov","");
	var ov_img ='';
	for(s=0;s<menu_length; s++){jQuery(hbNote).find(">li>a>img")[s].src = hbNote_save_src[s];}
	for(i=0;i<img_src.length; i++){if(i<(img_src.length-1)){ov_img += img_src[i]+"/";}}	
	ov_img += name+"_ov."+ type;
	jQuery(this).find(">a>img").not("rel*=no_ov")[0].src = ov_img;
}

function hbNote_img_ov_key() {	
	jQuery(hbNote).find(">li>ul").hide();
	jQuery(this).parent()[jQuery(this).parent().find(">ul:hidden").show()];
	jQuery(this).parent()[jQuery(this).parent().find(">div:hidden").show()];			
	jQuery(hbNote).find(">li>a>img").not("rel*=no_ov").removeAttr("rel");				
	jQuery(this)[jQuery(this).find(">img").attr("rel","nov")];		
	
	var menu_length = jQuery(hbNote).find(">li>a>img").length;
	var ori_img = jQuery(hbNote).find(">li>a>img[rel*=ov]")[0].src;				
	var img_src = ori_img.split("/");
	var imgName = img_src[img_src.length-1];
	var imgName = imgName.split(".");
	var name = imgName[imgName.length-2];
	var type = imgName[imgName.length-1];
	name = name.replace("_ov","");
	var ov_img ='';
	
	for(s=0;s<menu_length; s++){jQuery(hbNote).find(">li>a>img")[s].src = hbNote_save_src[s];}
	for(i=0;i<img_src.length; i++){if(i<(img_src.length-1)){ov_img += img_src[i]+"/";}}	
		
	ov_img += name+"_ov."+ type;	
	jQuery(this).find(">img").not("rel*=no_ov")[0].src = ov_img;
}




// main ctNote
var ctNote_save_src = new Array;
function ctTab(id){	
	ctNote = jQuery("#"+id);		
	jQuery(ctNote).find(">li>ul").hide();
	jQuery(ctNote).find(">li>div").hide();
	jQuery(ctNote).find(">li>ul:eq(0)").show();
	jQuery(ctNote).find(">li>div:eq(0)").show();
	jQuery(ctNote).find(">li").css({"float":"left"});	
	jQuery(ctNote).find(">li>a>img").attr("rel","nov");
	jQuery(ctNote).find(">li").hover(ctNote_show,ctNote_show);
	jQuery(ctNote).find(">li").hover(ctNote_img_ov,ctNote_img_ov);
	jQuery(ctNote).find(">li>a").each(function(n){
	jQuery(ctNote).find(">li>a")[n].onfocus = ctNote_img_ov_key;
	ctNote_save_src[n] = jQuery(ctNote).find(">li>a>img")[n].src;
	});	
	ctNote_ov();
}

function ctNote_ov(){
	var ori_img = jQuery(ctNote).find(">li>a>img:eq(0)")[0].src;		
	var img_src = ori_img.split("/");
	var imgName = img_src[img_src.length-1];
	var imgName = imgName.split(".");
	var name = imgName[imgName.length-2];
	var type = imgName[imgName.length-1];
	name = name.replace("_ov","");
	var ov_img ='';
	
	for(i=0;i<img_src.length; i++)
	{
		if(i<(img_src.length-1)){ov_img += img_src[i]+"/";}		
	}	
	ov_img += name+"_ov."+ type;
	
	jQuery(ctNote).find(">li>a>img:eq(0)")[0].src = ov_img;
}

function ctNote_show(){	
	jQuery(ctNote).find(">li>ul").hide();
	jQuery(ctNote).find(">li>div").hide();
	jQuery(this)[jQuery(this).find(">ul:hidden").show()];	
	jQuery(this)[jQuery(this).find(">div:hidden").show()];	
}

function ctNote_img_ov() {	
	jQuery(ctNote).find(">li>a>img").not("rel*=no_ov").removeAttr("rel");				
	jQuery(this)[jQuery(this).find(">a>img").attr("rel","nov")];		
	
	var menu_length = jQuery(ctNote).find(">li>a>img").length;
	var ori_img = jQuery(ctNote).find(">li>a>img[rel*=nov]")[0].src;	
	var img_src = ori_img.split("/");
	var imgName = img_src[img_src.length-1];
	var imgName = imgName.split(".");
	var name = imgName[imgName.length-2];
	var type = imgName[imgName.length-1];
	name = name.replace("_ov","");
	var ov_img ='';
	for(s=0;s<menu_length; s++){jQuery(ctNote).find(">li>a>img")[s].src = ctNote_save_src[s];}
	for(i=0;i<img_src.length; i++){if(i<(img_src.length-1)){ov_img += img_src[i]+"/";}}	
	ov_img += name+"_ov."+ type;
	jQuery(this).find(">a>img").not("rel*=no_ov")[0].src = ov_img;
}

function ctNote_img_ov_key() {	
	jQuery(ctNote).find(">li>ul").hide();
	jQuery(this).parent()[jQuery(this).parent().find(">ul:hidden").show()];
	jQuery(this).parent()[jQuery(this).parent().find(">div:hidden").show()];			
	jQuery(ctNote).find(">li>a>img").not("rel*=no_ov").removeAttr("rel");				
	jQuery(this)[jQuery(this).find(">img").attr("rel","nov")];		
	
	var menu_length = jQuery(ctNote).find(">li>a>img").length;
	var ori_img = jQuery(ctNote).find(">li>a>img[rel*=ov]")[0].src;				
	var img_src = ori_img.split("/");
	var imgName = img_src[img_src.length-1];
	var imgName = imgName.split(".");
	var name = imgName[imgName.length-2];
	var type = imgName[imgName.length-1];
	name = name.replace("_ov","");
	var ov_img ='';
	
	for(s=0;s<menu_length; s++){jQuery(ctNote).find(">li>a>img")[s].src = ctNote_save_src[s];}
	for(i=0;i<img_src.length; i++){if(i<(img_src.length-1)){ov_img += img_src[i]+"/";}}	
		
	ov_img += name+"_ov."+ type;	
	jQuery(this).find(">img").not("rel*=no_ov")[0].src = ov_img;
	
	
	
	
// 탭메뉴
function tabOn(tabid,a) {
	for (i=1;i<=10;i++) {
		if(i<10){inn="0"+i;} else {inn=""+i;}
		tabMenu = document.getElementById("tab"+tabid+"m"+i);
		tabContent = document.getElementById("tab"+tabid+"c"+i);
		tabMore = document.getElementById("tab"+tabid+"more"+i);
		if (tabMenu) { //객체가존재하면
			if (tabMenu.tagName=="IMG") { tabMenu.src = tabMenu.src.replace("_ov.gif", ".gif"); } //이미지일때
			if (tabMenu.tagName=="A") { tabMenu.className=""; } //앵커일때
		}
		if (tabContent) { tabContent.style.display="none"; }
		if (tabMore) { tabMore.style.display="none"; }

	}
	if(a<10){ann="0"+a;} else {ann=""+a;}
	tabMenu = document.getElementById("tab"+tabid+"m"+a);
	tabContent = document.getElementById("tab"+tabid+"c"+a);
	tabMore = document.getElementById("tab"+tabid+"more"+a);
//	alert(tabMenu.tagName);
	if (tabMenu) { //객체가존재하면
		if (tabMenu.tagName=="IMG") { tabMenu.src = tabMenu.src.replace(".gif", "_ov.gif"); } //이미지일때
		if (tabMenu.tagName=="A") { tabMenu.className="on"; } //앵커일때
	}
	if (tabContent) { tabContent.style.display="block"; }
	if (tabMore) { tabMore.style.display="block"; }
}


}



//팝업창 관련
function close_layer(id,to_close){
	//alert(id);
	document.getElementById(id).style.display = 'none';
	//쿠키굽기
	if(to_close=="Y"){
		setCookie(id, 'done' , 1); 
	}
}

//쿠기
function setCookie( name, value, expiredays ) { 
 var todayDate = new Date(); 
 todayDate.setDate( todayDate.getDate() + expiredays ); 
 document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";" 
} 

function getCookie(name) 
{ 
	var arg = name + "="; 
	var alen = arg.length; 
	var clen = document.cookie.length; 
	var i = 0; while(i< clen) 
	{ 
		var j = i + alen; 
		if(document.cookie.substring(i,j)==arg)
			{ 
			var end = document.cookie.indexOf(";",j); 
			if(end == -1) end = document.cookie.length;
			return unescape(document.cookie.substring(j,end)); 
			} 
		i=document.cookie.indexOf(" ",i)+1; 
		if (i==0) break; 
	} 
	return null; 
}

//배너

var count_num =0;
var bn_px=0;
var bn_num;
var bn_ul;
jQuery(document).ready(function(){
	function bn_start(){
		defaultMar = 16;//배너끼리 여백 입력
		//jQuery("#list>ul").attr("motion", "easeInOutExpo")
		bn_ul=jQuery("#list>ul");
		bn_li=jQuery("#list>ul>li");
		bn_ul.attr("top", "0");
		bn_ul.css({"width":"10000px","position":"absolute"});
	
		//var aaa = jQuery("#list>ul").attr("width", jQuery("#list>ul>li").eq(count_num).innerWidth());	
		bn_num = bn_li.length;
		bn_ul.attr("total", bn_li.size());
		bn_li.each(function (){
			jQuery(this).clone().appendTo(jQuery(bn_ul));
		});
	
		bn_ul.hover(function(){
			  bn_stop();
		  },function(){
			  bn_stop();
			  bn_move();
		  });
		  
		  //배너시작 
		  bn_move();
	}
	
	
	//bn_start();
});

function my_banner(){
	if(count_num == bn_num){
			bn_px = 0;
			count_num = 0;
		}	
	  if (jQuery("#list>ul:animated").size()) return false;
	  var width = bn_li.eq(count_num).width();
	  var pos = (parseInt(bn_ul.attr("top"))+1);
	 // var mar = pos * defaultMar;
	  	bn_px += width+defaultMar;
		bn_ul.attr("top", pos);
		bn_ul.animate({ 
	      left: ((bn_px * -1) + "px")
	    }, 500
	      ,function() {
	          var pos = parseInt(jQuery("#list>ul").attr("top"));
	          var total = parseInt(jQuery("#list>ul").attr("total"));
	          if (pos>=total) {
	              jQuery("#list>ul").attr("top", 0);
	              jQuery("#list>ul").css("left", "0px");
	          }
	      }
	  );
		count_num++;
}

function bn_left(){
	bn_stop();
	my_banner();
}

function bn_right(){	
  bn_stop();
  if (jQuery("#list>ul:animated").size()) return false;
  var width = bn_li.eq(count_num-1).width();
  var pos = (parseInt(bn_ul.attr("top"))+1)-2;
  //var mar = pos * defaultMar;

	if(pos>=0) {
		bn_px -= width+defaultMar;
		count_num--;
		bn_ul.attr("top", pos);
		bn_ul.animate({ 
			left: ((bn_px * -1) + "px")
		}, 500
			,function() {
				var pos = parseInt(bn_ul.attr("top"));
				var total = parseInt(bn_ul.attr("total"));
				if (pos>=total) {
					bn_ul.attr("top", 0);
					bn_ul.css("left", "0px");
				}
			}
		);

	}else{
		alert('첫번째 배너입니다');
	}
}

function bn_stop(){
		clearInterval(bn_ul.attr("timer"));
}
function bn_move(){
		bn_stop();
		bn_ul.attr("timer", setInterval(my_banner, 3000));
}


//공연정보  년간일정  2010.11.23 wclee 
var sYear;
var sYear_li;
var sy_list;
var sYear_old_num=0;

function sy_innit(m){
//alert(m);
	sYear_old_num=m-1;
	sYear=jQuery("ul#scheduleYear");
	sYear_li=sYear.find(">li");
	sy_list=sYear_li.find("> div");
	sy_list.hide();
	sy_list.eq(m-1).show();
	sYear_li.eq(m-1).addClass("schedule_ov");
	sYear_li.eq(m-1).find(">span.monthTxt > a").addClass("month_ov");
	sYear_li.eq(m-1).find(">span.monthImg > img").attr("src", "/images/kr/performance/month_0"+(m)+"_ov.gif");
	sYear_li.eq(m-1).find(">p.btn > a > img").attr({
		alt: "닫기",
		src: "/images/kr/performance/month_close.gif"
	});
	
}	
	
function list_click(cl_num){
	if (sYear_old_num == cl_num) {
		if(sy_list.eq(cl_num).is(":hidden")){ // 같은 버튼 클릭시 열리고 
			sYear_li.eq(sYear_old_num).find(">p.btn > a > img").attr({
				alt:"닫기", 
				src:"/images/kr/performance/month_close.gif"
			});
			sy_list.eq(cl_num).show();
		}else{ // 같은 버튼 클릭시 닫히고 
			sYear_li.eq(cl_num).find(">p.btn > a > img").attr({
				alt:"열기", 
				src:"/images/kr/performance/month_open.gif"
			});
			sy_list.hide();
		}	
		
	}else{ //다른버튼 클릭시 
		sYear_li.eq(cl_num).find(">p.btn > a > img").attr({
				alt:"닫기", 
				src:"/images/kr/performance/month_close.gif"
		});
		sYear_li.eq(sYear_old_num).find(">p.btn > a > img").attr({
				alt:"열기", 
				src:"/images/kr/performance/month_open.gif"
		});
		var s_o_num=sYear_old_num+1;
		var c_num=cl_num+1;
		if(s_o_num <10){
			s_o_num="0"+s_o_num;
		}
		if(c_num <10){
			c_num="0"+c_num;
		}
		sYear_li.eq(sYear_old_num).find(">span.monthImg > img").attr("src","/images/kr/performance/month_"+s_o_num+"_out.gif");
		sYear_li.eq(cl_num).find(">span.monthImg > img").attr("src","/images/kr/performance/month_"+c_num+"_ov.gif");
		
		sYear_li.eq(sYear_old_num).find(">span.monthTxt > a").removeClass("month_ov");
		sYear_li.eq(cl_num).find(">span.monthTxt > a").addClass("month_ov");
		sYear_li.eq(sYear_old_num).removeClass("schedule_ov");
		sYear_li.eq(cl_num).addClass("schedule_ov");
		sy_list.hide();
		sy_list.eq(cl_num).show();
	}	
	sYear_old_num =cl_num;
}

function list_click_en(cl_num){
	if (sYear_old_num == cl_num) {
		if(sy_list.eq(cl_num).is(":hidden")){ // 같은 버튼 클릭시 열리고 
			sYear_li.eq(sYear_old_num).find(">p.btn > a > img").attr({
				alt:"Close", 
				src:"/images/en/performance/month_close.gif"
			});
			sy_list.eq(cl_num).show();
		}else{ // 같은 버튼 클릭시 닫히고 
			sYear_li.eq(cl_num).find(">p.btn > a > img").attr({
				alt:"Open", 
				src:"/images/en/performance/month_open.gif"
			});
			sy_list.hide();
		}	
		
	}else{ //다른버튼 클릭시 
		sYear_li.eq(cl_num).find(">p.btn > a > img").attr({
				alt:"Close", 
				src:"/images/en/performance/month_close.gif"
		});
		sYear_li.eq(sYear_old_num).find(">p.btn > a > img").attr({
				alt:"Open", 
				src:"/images/en/performance/month_open.gif"
		});
		var s_o_num=sYear_old_num+1;
		var c_num=cl_num+1;
		if(s_o_num <10){
			s_o_num="0"+s_o_num;
		}
		if(c_num <10){
			c_num="0"+c_num;
		}
		sYear_li.eq(sYear_old_num).find(">span.monthImg > img").attr("src","/images/en/performance/month_"+s_o_num+"_out.gif");
		sYear_li.eq(cl_num).find(">span.monthImg > img").attr("src","/images/en/performance/month_"+c_num+"_ov.gif");
		
		sYear_li.eq(sYear_old_num).find(">span.monthTxt > a").removeClass("month_ov");
		sYear_li.eq(cl_num).find(">span.monthTxt > a").addClass("month_ov");
		sYear_li.eq(sYear_old_num).removeClass("schedule_ov");
		sYear_li.eq(cl_num).addClass("schedule_ov");
		sy_list.hide();
		sy_list.eq(cl_num).show();
	}	
	sYear_old_num =cl_num;
}


// 공연안내 상세보기
function showviewDaily(show_chk) {
//alert(show_chk);
	if(show_chk=="Y"){
		jQuery("#show_view_01").css("display","none");
		jQuery("#show_view_02").css("display","none");
		jQuery("#show_view_03").css("display","none");
		jQuery("#show_view_04").css("display","none");
		jQuery("#show_view_05").css("display","none");	
	} else {
		jQuery("#show_view_02").css("display","none");
		jQuery("#show_view_03").css("display","none");
		jQuery("#show_view_04").css("display","none");
		jQuery("#show_view_05").css("display","none");
		jQuery("#show_view_06").css("display","none");
	}
}
function showview01() {
document.getElementById('show_view_01').style.display =  "block";
document.getElementById('show_view_02').style.display =  "none";
document.getElementById('show_view_03').style.display =  "none";
document.getElementById('show_view_04').style.display =  "none";
document.getElementById('show_view_05').style.display =  "none";
document.getElementById('show_view_06').style.display =  "none";
}
function showview02() {
document.getElementById('show_view_01').style.display =  "none";
document.getElementById('show_view_02').style.display =  "block";
document.getElementById('show_view_03').style.display =  "none";
document.getElementById('show_view_04').style.display =  "none";
document.getElementById('show_view_05').style.display =  "none";
document.getElementById('show_view_06').style.display =  "none";
}
function showview03() {
document.getElementById('show_view_01').style.display =  "none";
document.getElementById('show_view_02').style.display =  "none";
document.getElementById('show_view_03').style.display =  "block";
document.getElementById('show_view_04').style.display =  "none";
document.getElementById('show_view_05').style.display =  "none";
document.getElementById('show_view_06').style.display =  "none";
}
function showview04() {
document.getElementById('show_view_01').style.display =  "none";
document.getElementById('show_view_02').style.display =  "none";
document.getElementById('show_view_03').style.display =  "none";
document.getElementById('show_view_04').style.display =  "block";
document.getElementById('show_view_05').style.display =  "none";
document.getElementById('show_view_06').style.display =  "none";
}
function showview05(){
	document.getElementById('show_view_01').style.display = "none";
	document.getElementById('show_view_02').style.display = "none";
	document.getElementById('show_view_03').style.display = "none";
	document.getElementById('show_view_04').style.display = "none";
	document.getElementById('show_view_05').style.display = "block";
	document.getElementById('show_view_06').style.display = "none";
}
function showview06() {
document.getElementById('show_view_01').style.display =  "none";
document.getElementById('show_view_02').style.display =  "none";
document.getElementById('show_view_03').style.display =  "none";
document.getElementById('show_view_04').style.display =  "none";
document.getElementById('show_view_05').style.display =  "none";
document.getElementById('show_view_06').style.display =  "block";
}



// photo gallery
var albumNum = 0;
function photoAlbum(){
	jQuery(".bicImage > li > a > img").hide();
	jQuery(".bicImage > li > a > img").eq(0).show();	
	jQuery('<div class="galleryNum">(<span class="bold">1</span>/'+jQuery(".bicImage > li > a > img").length+')</div>').prependTo(jQuery(".photo_gallery"));
	jQuery(".galleryView > span > a").eq(0).click(function() {albumShow(1); return false;});
	jQuery(".galleryView > span > a").eq(1).click(function() {albumShow(2); return false;});
 jQuery(".galleryThum > span > a").eq(0).click(function() {albumMove(2); return false;});
	jQuery(".galleryThum > span > a").eq(1).click(function() {albumMove(1); return false;});			
	jQuery(".thumnail > li > a > img").css({"width":"41px","height":"39px"});
	//jQuery(".thumnail > li > a > img").eq(0).css({"width":"59px","height":"48px","border":"3px solid #71b137"});	
}
function albumShow(data){
	var listNum = jQuery(".bicImage > li > img").length;
	
	if(data == 1){
		if(albumNum < 0 || albumNum == 0){
			
		} else {
			albumNum--;
			albumMove(2);
		}
	} else if(data == 2) {
		if(albumNum > listNum-2){
				
		} else {
			albumNum++;
			albumMove(1);
		}
	}
	jQuery(".bicImage > li > img").hide();
	jQuery(".bicImage > li > img").eq(albumNum).fadeIn(1000);
	jQuery(".thumnail > li > a > img").css({"width":"41px","height":"39px"});
	//jQuery(".thumnail > li > a > img").eq(albumNum).css({"width":"59px","height":"48px","border":"3px solid #71b137"});	
	jQuery(".galleryNum").html('(<span class="bold">'+(albumNum+1)+'</span>/'+jQuery(".bicImage > li > img").length+')');
}
var main_sub_box3_photo_num=0;
function albumMove(data){
	var tot = jQuery(".thumnail > li > a > img").length * 68;
	tot2 = (tot - 544)*-1;
	if(tot2 < 0)
	{
	if(data == 1){
		if(jQuery(".thumnail").position().left > tot2)
		{
			main_sub_box3_photo_num -=68;
		} else {			
			main_sub_box3_photo_num = tot2;
		}		
	} else if(data == 2) {
		if(jQuery(".thumnail").position().left < 0)
		{
			main_sub_box3_photo_num +=68;
		} else {			
			main_sub_box3_photo_num = 0;	
		}
	}
	
	jQuery(".thumnail").animate(
	{
		left:main_sub_box3_photo_num
	},200
	);
	}
			
}

function thumImg(data){
	albumNum = data-1;
	jQuery(".bicImage > li > a > img").hide();
	jQuery(".bicImage > li > a > img").eq(albumNum).fadeIn(1000);
	jQuery(".galleryNum").html('(<span class="bold">'+(albumNum+1)+'</span>/'+jQuery(".bicImage > li > a > img").length+')');
	jQuery(".bicImage1 > li > a > img").hide();
	jQuery(".bicImage1 > li > a > img").eq(albumNum).fadeIn(1000);
	jQuery(".galleryNum").html('(<span class="bold">'+(albumNum+1)+'</span>/'+jQuery(".bicImage1 > li > a > img").length+')');
	
	jQuery(".thumnail > li > a > img").css({"width":"41px","height":"39px"});
	//jQuery(".thumnail > li > a > img").eq(albumNum).css({"width":"59px","height":"48px","border":"3px solid #71b137"});	
}


//배너모음
var m_bn_count=0;
var m_bn_p_click_check= 0;
function m_bn_init(){
	var $j=jQuery;
	m_bn_count = $j("#m_bn_move > ul > li").size();
	
	//$j("#m_bn_move").css({"height":"20px","overflow":"hidden"});
	
	$j("#m_bn_p").click(function(){m_bn_p_click();return false;});	
	$j("#m_bn_s").click(function(){m_bn_s_click();return false;});
	$j("#m_bn_r").click(function(){m_bn_r_click();return false;});
	$j("#m_bn_l").click(function(){m_bn_l_click();return false;});
	
	m_bn_s_click();
}
function m_bn_p_click(){
	var $j=jQuery;	
	var setwidth = $j("#m_bn_move > ul > li").eq(0).width();
	
	if(m_bn_p_click_check == 0){
		m_bn_p_click_check = 1;
		$j("#m_bn_move > ul > li").eq(0).clone().appendTo($j("#m_bn_move > ul"));
		$j("#m_bn_move > ul").animate(
			{
				left:-setwidth
			}
			,2000
			,function(){
				$j("#m_bn_move > ul > li").eq(0).remove();
				$j("#m_bn_move > ul").css({"left":"0px"});
				m_bn_p_click_check = 0;
				m_bn_p_click();
			}
		);
	}
}
function m_bn_s_click(){
	var $j=jQuery;
	var count = $j("#m_bn_move > ul > li").size();
	m_bn_p_click_check = 0;
	$j("#m_bn_move > ul").stop();
	$j("#m_bn_move > ul").css({"left":"0px"});
	if(m_bn_count < count){
		$j("#m_bn_move > ul > li:last").remove();
	}
}
function m_bn_r_click(){
	var $j=jQuery;
	m_bn_s_click();
	$j("#m_bn_move > ul > li").eq(0).clone().appendTo($j("#m_bn_move > ul"));
	$j("#m_bn_move > ul > li").eq(0).remove();
}
function m_bn_l_click(){
	var $j=jQuery;
	m_bn_s_click();
	$j("#m_bn_move > ul > li:last").clone().prependTo($j("#m_bn_move > ul"));
	$j("#m_bn_move > ul > li:last").remove();
}

