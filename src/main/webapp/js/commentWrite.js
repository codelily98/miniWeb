$(document).ready(function() {
		
	
	
    $("#commentSubmitBtn").on('click', function() {
		const id = $("#id").val();
		const ref = $("#seq").val();
		const nickname = $("#nickname").val();
		const profile = $("#profile").val();
		const comment = $("#comment").val();

        if (comment.trim() === "") {
            alert("댓글 내용을 입력하세요.");
            return;
        }

        $.ajax({
            type: "POST",
            url: "/miniWeb/comment/commentWrite.do",
            data: {
				ref: ref,
				id: id,
                nickname: nickname,
				profile: profile,
				comment: comment
            },
            success: function(response) {
                location.reload();
            },
            error: function(e) {
                alert("오류가 발생했습니다: " + e);
            }
        });
    });
});
