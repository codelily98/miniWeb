$(document).ready(function() {
	$('.show1').hide();
	$('.show2').hide();
	$('.show3').hide();
	
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
	
	$("#hideandshow").on('click', function(){
		// .hide 클래스가 적용된 요소를 숨김
        $('.hide3').hide();        
        // .show 클래스가 적용된 요소를 표시
        $('.show3').show();
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
			data: $('form[id="updateForm"]').serialize(),
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

$('#nickupdateBtn').click(function(){
   confirm('해당 요청은 즉시 저장되며 되돌릴 수 없습니다.\n정말 닉네임을 바꾸시겠습니까?');
   if(confirm){
      nickname = $('#nickname').val();
      id = $('#id').val();
      $.ajax({
         type:'post',
         url: '/miniWeb/member/nicknameUpdate.do',
         data: {
            'id':id,
            'nickname':nickname
         },
         success:function(){
            location.reload();
         },
         error:function(e){
            console.log(e);
         }
      })      
   }
});

//프로필 사진 수정
$('#profileBtn').click(function(){
	$('#profile').trigger('click');   //강제 이벤트 발생 -> image1 아이디에 해당하는 곳이 클릭되는 이벤트
});
$('#profile').on('change',function(){
	readURL(this);
   
	let formdata = new FormData($('#updateForm')[0]);
		$.ajax({
			type:'post',
			enctype:'multipart/form-data',
			processData:false,
			contentType: false,
			url:'/miniWeb/member/profileUpdate.do',
			data: formdata,
			success:function(){
            	alert('프로필 등록 완료');
            	location.reload();
			},
			error:function(e){
				console.log(e);
		}
	});
});

function readURL(input){
   var reader = new FileReader();
   reader.onload = function(e){
      $('.image').attr('src',e.target.result);   //e.targetr - 이벤트가 발생하는 요소를 반환해준다
   }
   reader.readAsDataURL(input.files[0]);
}

//관리자 권한 요청
$('#abtn').click(function(){
   adminCode = $('#adminCode').val();
   adminCodeCheck = $('#adminCodeCheck').val();
   id = $('#id').val();
   if(adminCode == adminCodeCheck){
      $.ajax({
         type:'post',
         url:'/miniWeb/member/adminAccess.do',
         data:{'id':id},
         success:function(){
            alert('관리자 권한 요청이 완료되었습니다.');
         },
         error:function(e){
            console.log(e);
            alert('서버 통신 실패');
         }
      });
   }
   else{
      alert('관리자 권한 요청 코드가 올바르지 않습니다.')
   }
});

// 이메일 유효성 검사 등 추가 가능
$(document).ready(function () {
    // 인증번호 발송 버튼 클릭 시
    $("#emailVertifyBtn").click(function () {
        var email = $("#email").val();
        if (email) {
            $.ajax({
                url: "/miniWeb/sendAuthCode",
                type: "POST",
                data: { email: email },
                success: function (response) {
               let result = response.split("|");
               
               $("#authCode").val(result[0]);
                    $("#checkwrap>div").html(result[1]);
                },
                error: function () {
                    alert("인증번호 발송에 실패했습니다.");
                }
            });
        } else {
            alert("이메일을 입력해주세요.");
        }
    });

    // 인증번호 확인 버튼 클릭 시
    $("#checkEmailBtn").click(function() {
		var email = $("#email").val();
		var chechnum = $('#chechnum').val();
		
		if (chechnum) {
			$.ajax({
				url: "/miniWeb/verifyAuthCode",
                type: "POST",
                data: { email: email, ckechnum: chechnum },
				dataType: 'text',
                success: function (response) {
					$("#checkwrap > div").html(response);
				},
                error: function () {
                    alert("인증번호 확인에 실패했습니다.");
                }
            });
        } else {
            alert("인증번호를 입력해주세요.");
        }
    });
});
// 수정 버튼 클릭 시 최종 확인 후 제출
$('#joinbtn').click(function(){
	var email = $('#email').val();
	var chechnum = $('#chechnum').val();
    var authCode = $('#authCode').val();
   
    $('#checkwrap > div').html('');
   
    if (!email) {
        $('#check2').html('<span style="color: red; font-weight: bold;">이메일 입력해주세요.</span>');
    } else if (!chechnum) {
		$('#check2').html('<span style="color: red; font-weight: bold;">인증번호를 입력해주세요.</span>');
	} else if (chechnum != authCode) {
		$('#check2').html('<span style="color: red; font-weight: bold;">이메일 인증을 해주세요</span>');
	} else {
        // 폼 유효성 검사 통과 시 서버에 제출
        $.ajax({
            type: 'post',
            url: '/miniWeb/member/infoUpdate.do',
            data: $('#updateForm').serialize(),
            dataType: 'text',
            success: function(){
                alert('회원정보수정이 완료되었습니다.');
                location.reload();
            },
            error: function(e){
                console.log(e);
            }
        });
    }
});