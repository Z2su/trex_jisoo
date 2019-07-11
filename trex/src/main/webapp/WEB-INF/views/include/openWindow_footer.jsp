<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!-- /WEB-INF<%=request.getContextPath()%>/resources/common/file_upload_control.jsp -->


<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/common/libs/jquery-ui-file-upload/css/jquery.fileupload-ui.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/common/css/fileupload.css" />

<!-- Shim to make HTML5 elements usable in older Internet Explorer versions -->
<!--[if lt IE 9]><script src="<%=request.getContextPath()%>/resources/common/libs/html5shim/html5shiv.min.js"></script><![endif]-->

<!-- <script src="<%=request.getContextPath()%>/resources/common/jquery/js/jquery-1.8.0.min.js"></script> -->
<!-- <script src="<%=request.getContextPath()%>/resources/common/jquery/ui/1.8.16/jquery-ui.min.js"></script> -->

<script src="<%=request.getContextPath()%>/resources/common/libs/javascript-templates/tmpl.min.js"></script>

<script src="<%=request.getContextPath()%>/resources/common/libs/jquery-ui-file-upload/js/jquery.iframe-transport.js"></script>
<script src="<%=request.getContextPath()%>/resources/common/libs/jquery-ui-file-upload/js/jquery.fileupload.js"></script>
<script src="<%=request.getContextPath()%>/resources/common/libs/jquery-ui-file-upload/js/jquery.fileupload-fp.js"></script>
<script src="<%=request.getContextPath()%>/resources/common/libs/jquery-ui-file-upload/js/jquery.fileupload-ui.js"></script>
<script src="<%=request.getContextPath()%>/resources/common/libs/jquery-ui-file-upload/js/jquery.fileupload-jui.js"></script>
<script src="<%=request.getContextPath()%>/resources/common/libs/jquery-ui-file-upload/js/locale.js"></script>
<script src="<%=request.getContextPath()%>/resources/common/scripts/fileupload.js"></script>

<!-- The XDomainRequest Transport is included for cross-domain file deletion for IE8+ -->
<!--[if gte IE 8]><script src="<%=request.getContextPath()%>/resources/common/libs/jquery-ui-file-upload/js/cors/jquery.xdr-transport.js"></script><![endif]-->
<style>

/* .ui-button-text-icon-primary .ui-button-text, .ui-button-text-icons .ui-button-text { */
/*     padding: .2em .5em .2em 1.1em; */
/* } */
.ui-button-text-icon-primary .ui-button-text, .ui-button-text-icons .ui-button-text {
    padding: 0px 5px 2px;
}
table#fileresult > span.ui-buttojn-text { padding:0px; }

.upload td.name a, .upload td.name span, #dmstbl td.name span {

}
.fileupload-buttonbar .ui-button{margin-bottom:none;}
.fileupload-buttonbar .ui-button, .fileupload-buttonbar .toggle { margin: 1px;}
.upload td.name { font-weight: normal; }

.upload table td { height:25px; padding: 0px 5px; font-weight:normal; '}
.upload td.name { font-weight: normal; }

</style>
<!-- 	</td> -->
<!-- 	</tr> -->
<!-- 	</tbody> -->
<!-- </table> -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/common/scripts/validate.js"></script>

</body>
</html>







