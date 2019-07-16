<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<head>
	<style>
	.fileDrop{
		width:80%;
		height:100px;
		border:1px dotted gray;		
		margin:auto;
	}
		
	.over{
		display:block;
		width:100%;
		white-space:nowrap;
		overflow:hidden;
		text-overflow:ellipsis;
	}
	</style>
</head>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.12/handlebars.js"></script>
<script id="detail-template" type="text/x-handlebars-template">
<li style="width:10%;font-size:0.8em;">
	<div class="mailbox-attachment-info" style="padding:2px;">
	<a href="{{fullName}}" class="btn btn-default btn-xs pull-right delbtn">
		<i class="fa fa-fw fa-remove"></i>
	</a>
	   <a href="{{getLink}}" class="mailbox-attachment-name thumbnail" style="margin-bottom:0;height:90px;">
		 <span class="mailbox-attachment-icon has-img" style="font-size:12px;">
      		<img src="{{imgsrc}}" alt="Attachment" style="max-height:50px;">
			</span>
	 		<span class="over">{{fileName}}</span>    	  
	   </a>
	</div>    
</li>
</script>

<script>
	var nno=${notice.nno};
	var template=Handlebars.compile($('#detail-template').html());	
	
	$.getJSON("/getAttach/"+nno,function(list){
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
	
	var attachListNum=0;
	function fileInputAttach(index,fullName,submitForm){
		if(!fullName){
			return;
		}
		
		var loginUser_id="/${loginUser.id}";
		var fileName,fileType,uuid;
		var splitName;
		if(checkImageType(fullName)){
			splitName=fullName.substring(14+loginUser_id.length).split('$$');						
			fileType="1";
		}else{
			splitName=fullName.substring(12+loginUser_id.length).split('$$');						
			fileType="0";
		}
		uuid=splitName[0];
		fileName=splitName[1];
		
		var uploadPath=fullName.substring(0,12+loginUser_id.length).replace(/\//g,"\\");
		var input1=$('<input>').attr('type','hidden')
		  					   .attr('name','attachList['+index+'].uuid')
		   					   .val(uuid);
		
		var input2=$('<input>').attr('type','hidden')
		   					   .attr('name','attachList['+index+'].fileName')
		   					   .val(fileName);
		var input3=$('<input>').attr('type','hidden')
							   .attr('name','attachList['+index+'].fileType')
							   .val(fileType);
		var input4=$('<input>').attr('type','hidden')
							   .attr('name','attachList['+index+'].uploadPath')
							   .val(uploadPath);
		
		form.prepend(input1).prepend(input2).prepend(input3).prepend(input4);
		attachListNum++;
	}
	
	function modify_go(){
		if (!validCheck()) return false;
		if (!confirm("저장 하시겠습니까?")) return false;
		
		$(window).unbind("beforeunload");			
		
		//waitMsg();	/* Processing message */
		
		//업로드된 파일 개수.
		var index=0;
		
		//업로드 되는 파일 개수 확인
		var fileNum=0;
		
		for(var i of fileFormData.values()){
			fileNum++;
		}
		
		//기존 썸네일을 <input>으로 추가
		$(".uploadedList .delbtn").each(function(i, obj){		
			var fullName=$(this).attr('href');
			fileInputAttach(i,fullName,form)
		});	
		
		for(var value of fileFormData.values()){
			//file을 업로드하기 위한  formData()를 생성.
			var dataForm=new FormData();
			dataForm.append('file',value);	
			
			// 추가된 파일을 업로드 하고 <input> 추가			
			$.ajax({
				url:"<%=request.getContextPath()%>/upload",
				type:"post",
				data:dataForm,
				processData:false,
				contentType:false,
				success:function(data){
					fileInputAttach(attachListNum,data,form);
					index++;
				}
			}); 
		}	
		 
		var submitTime=setInterval(function(e){
			if(fileNum==index){
				// ajax에 의한 파일업로드가 완료되면 submit을 진행한다.
				controlSubmit(form);
				
				// 해당 setInterval을 종료.
				clearInterval(submitTime);
			}
		},500);  
	}
	function cancel_go(){
		history.go(-1);		
	}
	
	//썸네일 파일 삭제
	var form=$('form#modifyForm');
	$('.uploadedList').on('click','.delbtn',function(event){
		event.preventDefault();
		
		$(this).parent('div').parent('li').remove();
		
		var input= $('<input>').attr({
										type:"hidden",
										name:"oldAttach",
										value:$(this).attr('href')
									});	
		form.prepend(input);
	});
	
	// DropZone 드롭 이벤트
	$(document).on("dragenter dragover drop",function(event){
		event.preventDefault();
	});
	
	var fileFormData = new FormData(); 
	$('.fileDrop').on('drop',function(event){
		
		var uploadedFileNum=$('.uploadedList li').length;
		var files=event.originalEvent.dataTransfer.files;	
		var droppingFileNum = files.length;
		
		if(uploadedFileNum+droppingFileNum > 3){
			alert("파일 업로드는 3개까지만 허용됩니다.");
			return;
		}
		
		for(var file of files){
			if(file.size>1024*1024*5){
				alert("파일 용량이 5MB를 초과하였습니다.");
				return false;
			}
		}
		
		if (files) {
		    [].forEach.call(files, readAndPreview);
		 }
		
		function readAndPreview(file) {
			var reader = new FileReader();
			reader.addEventListener("load", function () {	
				fileFormData.append(file.name,file);
				var fileInfo=getUploadFileInfo(file.name,this.result);
				var html=template(fileInfo);
				$('.uploadedList').append(html);
			}, false);
			reader.readAsDataURL(file);
		}
	});
	
	function checkImageType(fileName){
		var pattern=/jpg|gif|png|jpeg/i;	
		return fileName.toLowerCase().match(pattern);
	}
	
	function getUploadFileInfo(fileName,imgsrc){		
		var fileNameFormat = fileName.substring(fileName.lastIndexOf('.')+1);	
		if(!checkImageType(fileName)){
			var icon="";
			switch(fileNameFormat){
			case "doc":case "docx": icon="doc"; break;
			case "ppt":case "pptx": icon="ppt"; break;
			case "xlsx": case "xls": case "csv": icon="xls"; break;
			case "hwp": icon = "hwp"; break;
			case "zip": icon = "zip"; break;
			case "pdf": icon = "pdf"; break;
			default:icon = "file";		
			}		
			
			imgsrc="<%=request.getContextPath()%>/resources/common/images/"+icon+".png";
		}
		return {fileName:fileName,imgsrc:imgsrc};	
	}
</script>