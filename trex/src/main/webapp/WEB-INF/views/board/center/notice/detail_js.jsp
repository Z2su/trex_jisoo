<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.12/handlebars.js"></script>
<script id="detail-template" type="text/x-handlebars-template">
<li style="width:10%;font-size:0.8em;" data-src="{{fullName}}">	
    <div class="mailbox-attachment-info">
	  <a href="{{getLink}}" class="mailbox-attachment-name thumbnail">
	   <span class="mailbox-attachment-icon has-img">
       <img src="{{imgsrc}}" alt="Attachment"></span>
	   <span class="over">{{fileName}}</span>
      </a>      
    </div>
</li>
</script>

<script>
	var notice_num=${notice.notice_num};
	var template=Handlebars.compile($('#detail-template').html());	
	
	$.getJSON("/getAttach/"+notice_num,function(list){
		$(list).each(function(){
			/* pdsAttach → handlebar json data 생성 */
			var fileInfo=getFileInfo(this,"<%=request.getContextPath()%>");
			var html=template(fileInfo);
			$('.uploadedList').append(html);
		});
	});
	
	function getFileInfo(attachJson,contextPath){
		var fileName,imgsrc,getLink;
		var fullName;
		if(attachJson.fileType=="1"){
			fullName=attachJson.uploadPath.replace(/\\/g,"/")
					 +"s_"+attachJson.uuid+"$$"+attachJson.fileName;
			imgsrc=contextPath+"/displayFile?fileName="+fullName;				
		}else{
			fullName=attachJson.uploadPath.replace(/\\/g,"/")
					 +attachJson.uuid+"$$"+attachJson.fileName;
			
			var fileFormat=attachJson.fileName.split(".")[1].toLowerCase();
			var icon="";
			switch(fileFormat){
			case "doc":case "docx": icon="doc"; break;
			case "ppt":case "pptx": icon="ppt"; break;
			case "xlsx": case "xls": case "csv": icon="xls"; break;
			case "hwp": icon = "hwp"; break;
			case "zip": icon = "zip"; break;
			case "pdf": icon = "pdf"; break;
			default:icon = "file";		
			}
			
			imgsrc=contextPath+"/resources/common/images/"+icon+".png";		
		}
		getLink=attachJson.uploadPath.replace(/\\/g,"/")
			    +attachJson.uuid+"$$"+attachJson.fileName;
		fileName=attachJson.fileName;
		
		return {fileName:fileName,imgsrc:imgsrc,getLink:getLink,fullName:fullName};
	};
	
	$('.uploadedList').on('click','.thumbnail',function(e){
		e.preventDefault();
		
		var form =$('<form>').attr({action:"<%=request.getContextPath()%>/displayFile",
									method:"get"}).css("display","none");
		
		var input = $('<input>').attr("name","fileName")
							    .val($(this).attr("href"));
		
		$(document.body).append(form);
		
		form.append(input);
		form.submit();
	});
	
	var formObj = $("form[role='form']");
	
	function modify_go(){
		formObj.attr("method", "get");
		formObj.attr("action", "modify");
		formObj.submit();
	}
	function remove_go(){
		/* 첨부파일 삭제 요청  */
		var arr=[];
		$('.uploadedList li').each(function(event){
			arr.push($(this).attr("data-src"));			
		});
		if(arr.length>0){
			var answer=confirm(
				arr.length+"개의 첨부파일이 존재합니다.\n 정말 삭제하시겠습니까?");
			if(answer){
				
				$.post('<%=request.getContextPath()%>/deleteAllFiles',
						{files:arr},function(){});
			}else{
				return;
			}
			
		}
		
		formObj.attr("action", "remove");
		formObj.submit();
	}
</script>








