<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>find</title>
<meta href="css/find.css" type="text/css" rel="styleSheet" />
<script src="../js/jquery-1.10.1.js"type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
//window로드 됐을때, id가 btnFindUid / btnFindPW 인 것을 클릭하면 해당 함수 실행
$(window).load(function(){
	$("btnFindmem_id").click(btnFindmem_id);
	$("btnFindmem_pwd").click(btnFindmem_pwd);
});

//btnFindmem_id를 클릭했을때 실행되는 함수내용.
function btnFindmem_id(event){
	var Email = $("#Email");
}if(Email.val() == ""){
	alert("이메일을 일력하세요");
	return;
}

var name = $("#name");
if(name.val()==""){
	alert("이름을 입력하세요");
	return;
}
 $.post("findIDResult.htm",{
	 Email:Email.val(),
	 name :name.val()
 	},function(data){
 		alert(eval(data).result);
 });
 }
</script>

</head>
<body>
	<div class="leftt">
		<form name="form1" action="findIDResult.htm" method="post">
		<fieldest>
		<legend class="hidden">ID/비밀번호찾기</legend>
		<ul id="findID">
		<li>ID찾기</li>
		<li><label>'E-mail</label><input type="text"id="Email"name="Email"/></li>
		<li><label>'이름</label><input type="text" id="name"name="name"/></li>
		<li>
		<input type="button" name="btnFindmem_id" id="btnFindmem_id"value="아이디 찾기"/>
		</li>
		</ul>
		</fieldest>
		</form>
	</div>
</body>
</html>