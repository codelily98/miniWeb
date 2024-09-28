$(document).ready(function() {
    $('#search').on('keyup', function(event) {
        if (event.key === 'Enter') {
        	let search = $("#search").val();
			
			location.href = '/miniWeb/board/boardSearchList.do?pg=1&search=' + search;
        }
    });
});