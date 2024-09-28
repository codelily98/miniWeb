$(document).ready(function() {
    $('#search').on('keyup', function(event) {
        if (event.key === 'Enter') {
        	let search = $('#search').val();
        	alert(search);
        	$.ajax({
        		type:'post',
        		url:'/miniWeb/board/search.do',
				data:{search:search},
				dataType:'text',
				success:function(data){
					location.href = '/miniWeb/board/boardSearchList.do?pg=1&search=' + search;
				},
				error:function(e){
					console.log(e);
				}
        	});
        }
    });
});