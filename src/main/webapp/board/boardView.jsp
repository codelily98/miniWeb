<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>404: View</title>
<style type="text/css">
html, body {
	width: 100%;
	height: 100%;
}
html {
	overflow-y: scroll;
}

#wrap{
	width: 1100px; 
	margin: 0 auto;
}

#header {
	height: 10%;
	text-align: center;
}
table{
	width: 100%;
	border-collapse: collapse;
	font-size:20px;
}
td,th{
	padding: 20px 0;
	border-top:2px solid black;
}
input{
	color: #ffffff;
	background: gray;
	border-radius: 10px;
	padding: 5px 30px;
	border-style: none;
	width:150px;
	height: 40px;
}
input:hover{
	background: black;
	font-weight: bold;
}
#content{
	white-space: pre-wrap;
	vertical-align: top;
}
</style>
</head>
<body>
	<div id = wrap>
		<div id = header>
			<h1>
				글 목록
			</h1>
		</div>
		<form id = boardViewForm>
		<input type = "hidden" name = "pg" value = "${requestScope.pg }">
		<input type = "hidden" name = "seq" value = "${list[0].seq}">
		<input type = "hidden" id = "pwd" value = "${memPwd }">
			<table>
				<tr>
					<th width = "15%">제목</th>
					<td colspan = "3">${list[0].subject}</td>
					<th width = "10%">작성일 : </th>
					<td width = "10%">
						<fmt:formatDate pattern = "yy.MM.dd HH:mm" value = "${list[0].logtime}"/>
					</td>
				</tr>
				<tr>
					<th>글번호 : </th>
					<td width = 30% data-seq="${list[0].seq}">${list[0].seq}</td>
					<th width = 10%>작성자 : </th>
					<td>${list[0].id}</td>
					<th>조회수 : </th>
					<td>${list[0].hit}</td>
				</tr>
				<tr>
					<th>내용</th>
					<td id = content colspan = "5" height = "300px">${list[0].content}</td>
				</tr>
				<tr>
					<th><input type = "button" value ="목록" onclick = "location.href = './boardForm.do?pg=${requestScope.pg}'"></th>
					<td align = right colspan = "5">
						<c:if test = "${memId == list[0].id}">
							<input id = deleteBtn type = "button" value ="글 삭제" />
							<input id = updateBtn type = "button" value ="글 수정" 
							onclick = "location.href = './boardUpdateForm.do?seq=${list[0].seq}'"/>
						</c:if>
					</td>
				</tr>
			</table>
		</form>
	</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$(function(){
	let seq = $('td[data-seq]').data('seq');
	let pwd = $('#pwd').val();
	$('#deleteBtn').click(function(){
		let password = prompt('비밀번호를 입력하세요.');
		if(password == pwd){
			$.ajax({
				type:'post',
				url:'./boardDelete.do',
				data:{'seq':seq},
				dataType:'text',
				success:function(data){
					alert('글을 삭제하였습니다.');
					location.href = './boardForm.do?pg=1';
				},
				error:function(e){
					alert('글을 삭제하는데 실패했습니다.');
					console.log(e);
				}
			});
		}
		else{
			alert('비밀번호가 일치하지 않습니다.');
		}
	});
	$('#updateBtn').click(function(){
		$('#boardViewForm').attr('action','./boardUpdateForm.do')
		$('#boardViewForm').submit();
	});
});
</script>
</body>
</html>