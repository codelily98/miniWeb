$(document).ready(function() {
	$('.show1').hide();
	$('.show2').hide();
	
    $('#hideBtn2').on('click', function() {
        // .hide 클래스가 적용된 요소를 숨김
        $('.hide2').hide();        
        // .show 클래스가 적용된 요소를 표시
        $('.show2').show();
    });
	
	$('#hideBtn1').on('click', function() {
        // .hide 클래스가 적용된 요소를 숨김
        $('.hide1').hide();        
        // .show 클래스가 적용된 요소를 표시
        $('.show1').show();
    });
});

// delete() 함수 정의
function deleteAccount() {
    if (confirm("정말로 계정을 삭제하시겠습니까?")) {
		let id = $('#id').val();
        // AJAX 요청으로 서버에 삭제 요청을 보냅니다.
        $.ajax({
            url: '/miniWeb/member/infoDelete.do', // 서버의 계정 삭제 URL로 변경
            type: 'POST',
            data: {
                id: id // 현재 사용자의 ID 값을 전달
            },
            success: function(response) {
                alert("404 계정이 삭제되었습니다.");
                window.location.href = "/miniWeb/index.do"; // 메인 페이지로 이동
            },
            error: function() {
                // 오류 시 처리
                alert("서버와의 통신에 문제가 발생했습니다.");
            }
        });
    }
}

// a 태그 클릭 시 deleteAccount() 함수 실행
$('#deleteInfo a').click(function(event) {
    event.preventDefault(); // 기본 동작을 막고
    deleteAccount(); // deleteAccount 함수 호출
});


//회원정보수정
$('#updateBtn').click(function(){
	$('#checkDiv').empty();
	
	if($('#nickname').val() == '') {
		$('#checkDiv').html('닉네임 입력');
	} else if($('#pwd').val() == '') {
		$('#checkDiv').html('비밀번호 입력');	
	} else if($('#pwd').val() != $('#repwd').val()) {
		$('#checkDiv').html('비밀번호가 맞지 않습니다');		
	} else {
		$.ajax({
			type: 'post',
			url: '/miniWeb/member/infoUpdate.do',
			data: $('form[name="updateForm"]').serialize(), // name=값&id=값&~~~~
			success: function(){
				alert('회원정보 수정 완료');
				location.href = '/miniWeb/index.do';
			},
			error: function(e){
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

