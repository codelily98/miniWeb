$(document).ready(function(){
	$("#notice_list").on('click', function(){
		location.href="/miniWeb/board/noticeboardForm.do?pg=1";
	});
	
	$("#all_list").on('click', function(){
		location.href="/miniWeb/board/boardForm.do?pg=1";
	});
	
	$("#hot_list").on('click', function(){
		location.href="/miniWeb/board/boardHotForm.do?pg=1";
	});
	
	$("#latest_list").on('click', function(){
		location.href="/miniWeb/board/boardLatestForm.do?pg=1";
	});
});