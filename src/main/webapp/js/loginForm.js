$(function(){
	$(document).on('click', '#gomain', function(){
		location.href="../index.do"
	});
	
	//로그인버튼 클릭 이벤
	$('#loginbtn').on('click',function(){
		$('#checkid').empty();
		$('#checkpwd').empty();				
		
		if ($('#id').val() == '')
			$('#checkid').html('아이디 입력');
		else if ($('#pwd').val() == '')
			$('#checkpwd').html('비밀번호 입력');
		else {
			$.ajax({
				type: 'post',
				url : '/miniWeb/member/login.do',
				data : $('#loginForm').serialize(),
				dataType: 'text',
				success: function(response){
					let result = response.trim();
					if(result != 'fail') {
						alert("로그인 성공.");
						location.href="../index.do";				
					} else {
						alert("로그인 실패.");
					}
				},
				error: function(e) {
				  console.log(e);
				}
			});
		}	
	});
});