//아이디 중복체크
$('#id').blur(function(){
	id = $('#id').val();
	$('#idDiv').html('');
	if(!id){
		$('#idDiv').html('먼저 아이디를 입력');
	}
	else{
		$.ajax({
			type:'post',
			url: '/miniWeb/member/checkId.do',
			data: {'id' : $('#id').val()},
			dataType: 'text',
			success: function(data){
				if(data.trim() == 'exist'){
					$('#idDiv').html('<font color = red>사용 불가능</font>');
				}
				else{
					$('#idDiv').html('<font color = blue>사용 가능</font>');
					$('#checkid').val($('#id').val());
				}
			},
			error:function(e){
				console.log(e);
			}
		});
	}
});
//닉네임 중복체크
$('#nickname').blur(function(){
	id = $('#nickname').val();
	$('#nicknameDiv').html('');
	if(!id){
		$('#nicknameDiv').html('먼저 닉네임을 입력');
	}
	else{
		$.ajax({
			type:'post',
			url: '/miniWeb/member/checkNick.do',
			data: {'nickname' : $('#nickname').val()},
			dataType: 'text',
			success:function(data){
				if(data.trim() == 'exist'){
					$('#nicknameDiv').html('<font color = red>사용 불가능</font>');
				}
				else{
					$('#nicknameDiv').html('<font color = blue>사용 가능</font>');
					$('#checknick').val($('#nickname').val());
				}
			},
			error:function(e){
				console.log(e);
			}
		});
	}
});
//이메일 인증
//~~
//회원가입
$('#joinbtn').click(function(){
	nickname = $('#nickname').val();
	name = $('#name').val();
	pwd = $('#pwd').val();
	repwd = $('#repwd').val();
	id = $('#id').val();
	email = $('#email').val();
	checkid = $('#checkid').val();
	checknick = $('#checknick').val();
	
	$('#nameDiv').html('');
	$('#pwdDiv').html('');
	$('#repwdDiv').html('');
	$('#idDiv').html('');
	$('#emailDiv').html('');
	
	if(!pwd){
		$('#pwdDiv').html('비밀번호 입력');
	}
	else if(pwd != repwd){
		$('#repwdDiv').html('비밀번호가 일치하지않습니다.');
	}
	else if(!nickname){
		$('#nicknameDiv').html('닉네임 입력');
	}
	else if(!name){
		$('#nameDiv').html('이름 입력');
	}
	else if(!email){
		$('#emailDiv').html('이메일 입력');
	}
	else if(id != checkid){
		$('#idDiv').html('중복체크를 해주세요');
	}
	else if(nickname != checknick){
		$('#nickDiv').html('중복체크를 해주세요');
		alert('닉네임확인');
	}
	else{
		$.ajax({
			type:'post',
			url: '/miniWeb/member/join.do',
			data: $('#joinForm').serialize(),
			dataType: 'text',
			success:function(){
				alert('회원가입하였습니다.');
				location.href = "/miniWeb/index.do";
			},
			error:function(e){
				console.log(e);
			}
		});
	}
});
//우편번호 - Daum API
function checkPost() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zipcode').value = data.zonecode;
            document.getElementById("addr1").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("addr2").focus();
        }
    }).open();
}

$(function(){
	$("#gomain").click(function(){
		location.href="../index.do"
	})
});