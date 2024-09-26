$(document).ready(function() {
    boardPaging(pg);
});

function boardPaging(pg) {
    location.href = "boardForm.do?pg=" + pg;
}

$(function(){
	
	$("#notice_list").on('click', function(){
		location.href="/miniWeb/board/noticeboardForm.do?pg=1";
	});

	$("#all_list").on('click', function(){
		location.href="../board/boardForm.do?pg=1";
	});
	
	$("#hot_list").on('click', function(){
		location.href="/miniWeb/board/hotboardForm.do?pg=1";
	});
	
	$("#latest_list").on('click', function(){
		location.href="/miniWeb/board/latestboardForm.do?pg=1";
	});
});