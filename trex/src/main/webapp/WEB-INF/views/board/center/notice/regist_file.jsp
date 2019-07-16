<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<script type="text/javascript">
	var fileSeq = 0;
	var fileuploadfail = new Array();
	
	jQuery(function($) {
	//$(function () {
    	
		$("#upload")				
		.bind('fileuploaddrop fileuploadchange', function (e, data) {

			if ($("#upload").data("blueimpJUI-fileupload")) $(this).data('fileupload', $("#upload").data("blueimpJUI-fileupload"));
			
			var that = $(this).data('fileupload').element[0];
	        var names = $(that).find(".name > span");
	        var temps = new Array();

	        for(var i = 0; i < names.length; i++) {
	        	var name = $(names[i]).text();	        	
	            for(var j = 0; j < data.files.length; j++) {
	            	if (name == data.files[j].name) {
	            		temps.push("'"+data.files[j].name+"'");
	            		data.files.splice(j--, 1);
	            	}
	            }
	        }
	        if (temps.length > 0) alert(temps.join(",\n") + "\n위의 파일명은 이미 존재합니다.");
			//console.log(typeof data.files);
			//console.log(e.target.id);

			setTimeout( function() {
				uploadFileAllSize();
				uploadRedraw(0);
			} , 500);
	    })
	    .bind('fileuploaddestroyed', function (e, data) {
	    	uploadFileAllSize();
    	})
    	
		/* 업로드 시작전에 데이터 유효값 체크 */
	    .bind('fileuploadstart', function (e, data) {
	    	
	    	//var conf_msg = "저장하시겠습니까?";
	    	if ($('#fileuploadstartconfirm').val() == 1) {
	    		
	    		//if (!confirm(conf_msg)) {
	    			var filesList = this.options.filesContainer;
	    			filesList.find('.cancel button').click();
	    			return false;
	    		//}
	    	}
	    })
	    
	    /* 업로드 완료후에 폼 제출 */
		.bind('fileuploadstop', function (e, data) {
			
	// 		try { setEditorForm(); } catch (e) {} // 에디터의 데이터를 폼에 삽입
	// 		try { form.elements["bbs.content"].value = geteditordata();	} catch (e) {} 	//bbs 
	// 		try { form.elements["dms.content"].value = geteditordata();	} catch (e) {}	//dms
			
			//업로드 실패한 파일이 있고, 메일폼이라면
			if (fileuploadfail.length > 0 && document.getElementById("mailWebForm") != null) {
				
				//임시저장임을 알림
				document.forms[0].cmd.value = "draft";
				
				//임시저장시에는 예약발송을 해제
				if (document.getElementById("mailWebForm").reserved.checked) {
					document.getElementById("mailWebForm").reserved.checked = false;
				}
				
				alert("파일 업로드에 실패하였습니다(Failed to upload files)\n메일이 임시보관함으로 저장됩니다(Mail will be saved as a draft)\n----- 실패한 파일 목록(List of failed files) -----\n"+fileuploadfail.join(",\n"));
				$(window).unbind("beforeunload");
			}
	
			setTimeout(function() {
				var form = document.forms[0];
				form.method = "POST";
				form.action = "./notice/upload";
				form.submit();
			}, 1000);
		})
		.bind('fileuploadfail', function (e, data) {
			if (data.errorThrown == "Internal Server Error") {
			    $.each(data.files, function (index, file) {
		            var error = $('<span class="text-danger"/>').css({'color':'red'}).text('failed');
		            $(data.context.children()[index]).append(error);
		            fileuploadfail.push(file.name);
		        });
			}
		})
		.fileupload({ 
			dropZone: $('#upload'),
			sequentialUploads: true 
		});
	
	    // Enable iframe cross-domain access via redirect option:
	    $("#upload").fileupload(
	        'option',
	        'redirect',
	        window.location.href.replace(
	            /\/[^\/]*$/,
	            '<%=request.getContextPath()%>/resources/commons/libs/jquery-ui-file-upload/cors/result.html?%s'
	        )
	    );

	    $("#upload").each(function () {
			var that = this;
			/* 다운로드 템플릿에 들어갈 JSON 데이터  */
			var result = { files: [
				
			]};
			if (result.files.length > 0) {
				if ($("#upload").data("blueimpJUI-fileupload")) $(this).data('fileupload', $("#upload").data("blueimpJUI-fileupload"));
				$(that).fileupload('option', 'done')
					.call(that, null, {result: result.files});
			} else {
				$(".fileupload-buttonbar").find(".delete").hide();
			}
		});
	});
	
	// 첨부파일 영역 디자인 변경 : 2017.04.11 jkkim
	function uploadRedraw( args ) {
		if ( args == 0 ) {
			var tag = "span";
		} else {
			var tag = "a";
		}
		
		var names = $("#upload").find(".name > " + tag);
		
		for(var i = 0; i < names.length; i++) {
			if( !$(names[i]).prev().is("i") ) {
				var tmpStr = $(names[i]).text().split(".");
				var str = tmpStr[tmpStr.length-1].toLowerCase();
				
				if("txt" == str){
					extension = "green ace-icon fa fa-file-text-o bigger-120";
				}else if("xlsx" == str || "xls" == str || "csv" == str){
					extension = "pink2 ace-icon fa fa-file-excel-o bigger-120";
				}else if("docx" == str || "doc" == str){
					extension = "pink2 ace-icon fa fa-file-word-o bigger-120";
				}else if("pptx" == str || "ppt" == str){
					extension = "pink2 ace-icon fa fa-file-powerpoint-o bigger-120";
				}else if("pdf" == str){
					extension = "orange ace-icon fa fa-file-pdf-o bigger-120";
				}else if("png" == str || "jpg" == str || "bmp" == str || "gif" == str){
					extension = "purple ace-icon fa fa-file-image-o bigger-120";
				}else if("avi" == str || "mp4" == str || "mkv" == str || "wmv" == str){
					extension = "red ace-icon fa fa-file-movie-o bigger-120";
				}else if("mp3" == str){
					extension = "red ace-icon fa fa-file-audio-o bigger-120";
				}else if("zip" == str){
					extension = "blue ace-icon fa fa-file-zip-o bigger-120";
				}else{
					extension = "ace-icon fa fa-file-o bigger-120";
				}
				$(names[i]).before('<i class="' + extension + '"></i>');
			}
        }
	}
	
	function fileData(arrayDate) {
	    $("#upload").each(function () {
			var that = this;
			var result = arrayDate;
			if (result && result.length) {
				$(that).fileupload('option', 'done')
					.call(that, null, {result: result});
			} else {
				$(".fileupload-buttonbar").find(".delete").hide();
				$('#upload table tbody tr.template-download').remove();
			}
		});
	}
	
	function uploadFileAllSize() {
		var allSize = 0;
		var sizes = $("#upload").find(".size");
		for(var i = 0; i < sizes.length; i++) {
			var size = $(sizes[i]).attr("data-size");
			allSize += Number(size);
		}
		if (allSize > 0) {
			$("#allSize").html(" ("+formatFileSize(allSize)+")");
		} else {
			$("#allSize").html("");
		}
	}
	
	function formatFileSize(bytes) {
        if (typeof bytes !== 'number') {
            return '';
        }
        if (bytes >= 1000000000) {
            return (bytes / 1000000000).toFixed(2) + ' GB';
        }
        if (bytes >= 1000000) {
            return (bytes / 1000000).toFixed(2) + ' MB';
        }
        return (bytes / 1000).toFixed(2) + ' KB';
    }
	</script>

	<!-- The template to display files available for upload -->
	<script id="template-upload" type="text/x-tmpl">
		{% for (var i=0, file; file=o.files[i]; i++) {
			if (file.no && file.no != "") {
				fileSeq = file.no;
			} else {
				var arr = new Array();
				var ufns = $("input[name=ufileno]");
				for(var j=0; j < ufns.length; j++) {
					arr.push(ufns[j].value.replace(/[.]/gi, ""));
				}
				fileSeq = Math.max.apply(Math, arr);
				fileSeq++;
			}
	 %}
		<tr class="template-upload fade___">
			<td class="delete">
				<input type="hidden" name="ufileno" value="{%=fileSeq%}">
				<input type="hidden" name="ufilenm" value="{%=file.name%}">
			</td>
			<td class="name"><span>{%=file.name%}</span></td>
			<td class="size" data-size="{%=file.size%}"><span>{%=o.formatFileSize(file.size)%}</span></td>
			{% if (file.error) { %}
				<td class="error hide" colspan="2"><span class="label label-important">{%=locale.fileupload.error%}</span> {%=locale.fileupload.errors[file.error] || file.error%}</td>
			{% } else if (o.files.valid && !i) { %}
				<td class="hide">
					<div class="progress progress-success progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0"><div class="bar" style="width:0%;"></div></div>
				</td>
				<td class="start hide">{% if (!o.options.autoUpload) { %}
					<button class="btn btn-primary">
						<i class="icon-upload icon-white"></i>
						<span>{%=locale.fileupload.start%}</span>
					</button>
				{% } %}</td>
			{% } else { %}
				<td class="hide" colspan="2"></td>
			{% } %}
			<td class="cancel">{% if (!i) { %}
				<button class="btn btn-minier btn-white">
					<i class="red ace-icon fa fa-trash-o bigger-120"></i>
					<span><b>{%=locale.fileupload.destroy%}</b></span>
				</button>
			{% } %}</td>
		</tr>
	{% } %}
	</script>

	<!-- The template to display files available for download if (isFinite(fileSeq)) -->
	<script id="template-download" type="text/x-tmpl">
	{%
		for (var i=0, file; file=o.files[i]; i++) {
			if (file.no && file.no != "") {
				fileSeq = file.no;
			} else {
				var arr = new Array();
				var ufns = $("input[name=ufileno]");
				for(var j=0; j < ufns.length; j++) {
					arr.push(ufns[j].value.replace(/[.]/gi, ""));
				}
				fileSeq = Math.max.apply(Math, arr);
				fileSeq++;
			}
	%}
		<tr class="template-download fade___">
			<td class="delete">
				<input type="checkbox" name="delete" value="1">
				<input type="hidden" name="ufileno" value="{%=fileSeq%}">
				<input type="hidden" name="ufilenm" value="{%=file.name%}">
			</td>
			{% if (file.error) { %}
				<td class="name"><span>{%=file.name%}</span></td>
				<td class="size" data-size="{%=file.size%}"><span>{%=o.formatFileSize(file.size)%}</span></td>
				<td class="error hide" colspan="2"><span class="label label-important">{%=locale.fileupload.error%}</span> {%=locale.fileupload.errors[file.error] || file.error%}</td>
			{% } else { %}
				<td class="name">
					<a href="{%=file.url%}" title="{%=file.name%}" rel="{%=file.thumbnail_url&&'gallery'%}" download="{%=file.name%}">{%=file.name%}</a>
				</td>
				<td class="size" data-size="{%=file.size%}"><span>{%=o.formatFileSize(file.size)%}</span></td>
				<td class="hide" colspan="2"></td>
			{% } %}
			<td class="delete">
				<button class="btn btn-minier btn-white" data-type="{%=file.delete_type%}" data-url="{%=file.delete_url%}">
					<i class="red ace-icon fa fa-trash-o bigger-120"></i>
					<span><b>{%=locale.fileupload.destroy%}</b></span>
				</button>
			</td>
		</tr>
	{% } %}
	</script>

	<script id="template-downloads" type="text/x-tmpl">
	{%for (var i=0, file; file=o.files[i]; i++) { %}
		<tr class="template-download fade___">
			<td class="delete">
				<input type="checkbox" name="delete" value="1">
			</td>
			{% if (file.error) { %}
				<td class="name"><span>{%=file.name%}</span></td>
				<td class="size" data-size="{%=file.size%}"><span>{%=o.formatFileSize(file.size)%}</span></td>
				<td class="error hide" colspan="2"><span class="label label-important">{%=locale.fileupload.error%}</span> {%=locale.fileupload.errors[file.error] || file.error%}</td>
			{% } else { %}
				<td class="name">
					<a href="{%=file.url%}" title="{%=file.name%}" rel="{%=file.thumbnail_url&&'gallery'%}" download="{%=file.name%}">{%=file.name%}</a>
				</td>
				<td class="size" data-size="{%=file.size%}"><span>{%=o.formatFileSize(file.size)%}</span></td>
				<td class="hide" colspan="2"></td>
			{% } %}
			<td class="nekDownload">
				<button class="btn btn-minier btn-white" data-type="{%=file.delete_type%}" data-url="{%=file.delete_url%}">
					<i class="red ace-icon fa fa-trash-o bigger-120"></i>
					<span><b>{%=locale.fileupload.download%}</b></span>
				</button>
			</td>
		</tr>
	{% } %}
</script>

<script>
	setTimeout( function() { uploadFileAllSize(); uploadRedraw( 1 ); } , 500 );	//편집 시 첨부 디자인 변경
</script>