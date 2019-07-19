<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>
<script type="text/javascript">
     /* summernote에서 이미지 업로드시 실행할 함수 */
jQuery.noConflict();    
function sendFile(file, editor) {
	
	/* if(file.name.확장자.toLowerCase()!="jpg"){
		alert("JPG 이미지만 가능합니다.");\
		return;
	} */
         // 파일 전송을 위한 폼생성
         
    var event_code = $('input[name="event_code"]').val();    
	var formData = new FormData();
    formData.append("uploadFile", file);
    formData.append("event_code",event_code);
    
    $.ajax({ // ajax를 통해 파일 업로드 처리
        data : formData,
        type : "POST",
        url : "<%=request.getContextPath()%>/board/my/imageUpload",
        cache : false,
        contentType : false,
        processData : false,
        success : function(data) { // 처리가 성공할 경우
                 // 에디터에 이미지 출력
        	jQuery(editor).summernote('editor.insertImage', data.url);
        	
        }
    });
}
jQuery(document).ready(function() {
	jQuery('#wrtCont').summernote({ // summernote를 사용하기 위한 선언
		tabsize: 1,
		height: 300,                 // set editor height
  	  	minHeight: 200,             // set minimum height of editor
  	  	maxHeight: 500,             // set maximum height of editor
  	  	focus: true,     	  
		callbacks: { // 콜백을 사용
                     // 이미지를 업로드할 경우 이벤트를 발생
		    onImageUpload: function(files, editor, welEditable) {
			    sendFile(files[0], this);
			}
		}
	});
});
</script>
