$(document).ready(function() {
    boardPaging(pg);
});
function boardPaging(pg) {
    location.href = "./boardHotForm.do?pg=" + pg;
}
$(function(){
	
	$("#notice_list").on('click', function(){
		location.href="/miniWeb/board/noticeboardForm.do?pg=1";
	});
	$("#all_list").on('click', function(){
		location.href="../board/boardForm.do?pg=1";
	});
	
	$("#hot_list").on('click', function(){
		location.href="/miniWeb/board/boardHotForm.do?pg=1";
	});
	
	$("#latest_list").on('click', function(){
		location.href="/miniWeb/board/boardLatestForm.do?pg=1";
	});
});
//조회수 증가
$(document).on("click",".asubject", function(){
	let seq = $(this).closest('tr').find('#seq').val();//현재 글 번호를 가져옴
	
	//AJAX로 조회수 증가 요청
	$.ajax({
		type: 'post',
		url: '/miniWeb/board/boardHit.do',//조회수 증가를 처리하는 URL
		data: {'seq':seq},
		dataType: 'text',
		success: function(data){
			location.reload();
		},
		error: function(e){
			console.log(e);
		}
	});
});