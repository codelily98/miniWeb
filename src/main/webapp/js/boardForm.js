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
		location.href="/miniWeb/board/boardHotForm.do?pg=1";
	});
	
	$("#latest_list").on('click', function(){
		location.href="/miniWeb/board/boardLatestForm.do?pg=1";
	});
	
	//조회수 증가
	$(document).on("click",".asubject", function(){
		if($('#memNickname').val() == ''){
				alert('먼저 로그인하세요');
			}
			else{
				let seq = $(this).closest('tr').find('.seq').val();
				let pg = $('#pg').val();
				let memNickname = $('#memNickname').val();
				let postnickname = $(this).closest('tr').find('.postnickname').val();
				
				
				if(memNickname != postnickname){
					$.ajax({
						type:'post',
						url:'./boardHit.do',
						data:{'seq':seq},
						dataType:'text',
						success:function(){
							location.href = './boardView.do?seq=' + seq + '&pg=' + pg;
						},
						error:function(e){
							console.log(e);
						}
					});
				}
				else{
					location.href = './boardView.do?seq=' + seq + '&pg=' + pg;
				}
			}
	});
});