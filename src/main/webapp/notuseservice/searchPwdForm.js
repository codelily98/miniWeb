//비밀번호 찾기 - 등록된 아이디, 이름 이메일 확인
$('#id,#name,#email').on('blur',function(){
	id = $('#id').val();
	name = $('#name').val();
	email = $('#email').val(); 
	
	$('#idDiv').html('');
	$('#nameDiv').html('');
	$('#emailDiv').html('');
	
	if(!id)
		$('#idDiv').html('<font color = red>아이디 입력</font>');
	else if(!name)
		$('#nameDiv').html('<font color = red>이름 입력</font>');
	else if(!email)
		$('#emailDiv').html('<font colot = red>이메일 입력</font>');
	else{
		$.ajax({
			type: 'post',
			url: '/miniWeb/member/searchPwd.do',
			data: $("#findpwdForm").serialize(),
			dataType: 'text',
			success: function(data){
				alert(data);
				if(data.trim() !='fail')
					$('#result').html("<span> 당신의 비밀번호는 "+data.trim()+"입니다.</span>");
				else
					alert('아이디 혹은 이메일로 가입된 아이디 정보가 없습니다.');
			},
			error: function(e){
				console.log(e);
			}
		});
	}
});