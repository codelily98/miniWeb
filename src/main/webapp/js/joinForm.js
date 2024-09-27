// 아이디 유효성 검사 - blur에서 실행
$('#id').on('keyup blur', function(){
    var id = $('#id').val();
    $('#check1').html('');
    if(!id){
        $('#check1').html('<span style="color: red; font-weight: bold;">먼저 아이디를 입력해주세요.</span>');
    } else {
        $.ajax({
            type: 'post',
            url: '/miniWeb/member/checkId.do',
            data: {'id': id},
            dataType: 'text',
            success: function(data){
                if(data.trim() == 'exist'){
                    $('#check1').html('<span style="color: red; font-weight: bold;">사용 불가능한 아이디.</span>');
                } else {
                    $('#check1').html('<span style="color: blue; font-weight: bold;">사용 가능한 아이디.</span>');
                    $('#checkid').val(id);
                }
            },
            error: function(e){
                console.log(e);
            }
        });
    }
});

// 비밀번호와 비밀번호 확인 필드 모두에 keyup과 blur 이벤트 적용
$('#pwd, #repwd').on('keyup blur', function() {
	var pwd = $('#pwd').val();
    var repwd = $('#repwd').val();
    
    $('#check1').html(''); // 기존 메시지 초기화
    
    if (!pwd || !repwd) {
        $('#check1').html('<span style="color: red; font-weight: bold;">비밀번호를 입력하세요.</span>');
    } else if (pwd !== repwd) {
        $('#check1').html('<span style="color: red; font-weight: bold;">비밀번호가 일치하지 않습니다.</span>');
    } else {
        $('#check1').html('<span style="color: blue; font-weight: bold;">비밀번호가 일치합니다.</span>');
    }
});

// 닉네임 유효성 검사 - blur에서 실행
$('#nickname').on('keyup blur', function(){
    var nickname = $('#nickname').val();
    $('#check1').html('');
    if(!nickname){
        $('#check1').html('<span style="color: red; font-weight: bold;">먼저 닉네임을 입력해주세요.</span>');
    } else {
        $.ajax({
            type: 'post',
            url: '/miniWeb/member/checkNick.do',
            data: {'nickname': nickname},
            dataType: 'text',
            success: function(data){
                if(data.trim() == 'exist'){
                    $('#check1').html('<span style="color: red; font-weight: bold;">사용 불가능한 닉네임.</span>');
                } else {
                    $('#check1').html('<span style="color: blue; font-weight: bold;">사용 가능한 닉네임.</span>');
                    $('#checknick').val(nickname);
                }
            },
            error: function(e){
                console.log(e);
            }
        });
    }
});

// 이메일 유효성 검사 등 추가 가능
$(document).ready(function () {
    // 인증번호 발송 버튼 클릭 시
    $("#emailcheck").click(function () {
        var email = $("#email").val();
        if (email) {
            $.ajax({
                url: "/miniWeb/sendAuthCode",
                type: "POST",
                data: { email: email },
                success: function (response) {
                    $("#check2").html(response);
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
    $("#emailchecknum").click(function () {
        var email = $("#email").val();
        var ckechnum = $("#ckechnum").val();
        if (ckechnum) {
            $.ajax({
                url: "/miniWeb/verifyAuthCode",
                type: "POST",
                data: { email: email, ckechnum: ckechnum },
                success: function (response) {
                    $("#check2").html(response);
					
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

// 회원가입 버튼 클릭 시 최종 확인 후 제출
$('#joinbtn').click(function(){
    var nickname = $('#nickname').val();
    var name = $('#name').val();
    var pwd = $('#pwd').val();
    var repwd = $('#repwd').val();
    var id = $('#id').val();
    var gender = $("input[name='gender']:checked").val();
    var email = $('#email').val();
    var checkid = $('#checkid').val();
    var checknick = $('#checknick').val();
    
    $('#check1').html('');
    $('#check2').html('');
	
    if (!id) {
        $('#check1').html('<span style="color: red; font-weight: bold;">아이디 입력해주세요.</span>');
    } else if (id != checkid) {
        $('#check1').html('<span style="color: red; font-weight: bold;">아이디 중복체크를 해주세요</span>');
    } else if (!pwd) {
        $('#check1').html('<span style="color: red; font-weight: bold;">비밀번호 입력해주세요.</span>');
    } else if (pwd != repwd) {
        $('#check1').html('<span style="color: red; font-weight: bold;">비밀번호가 일치하지 않습니다.</span>');
    } else if (!nickname) {
        $('#check1').html('<span style="color: red; font-weight: bold;">닉네임 입력해주세요.</span>');
    } else if (nickname != checknick) {
        $('#check1').html('<span style="color: red; font-weight: bold;">닉네임 중복체크를 해주세요</span>');
    } else if (!name) {
        $('#check1').html('<span style="color: red; font-weight: bold;">이름 입력해주세요.</span>');
    } else if (!gender) {
        $('#check1').html('<span style="color: red; font-weight: bold;">성별 입력해주세요.</span>');
    } else if (!email) {
        $('#check2').html('<span style="color: red; font-weight: bold;">이메일 입력해주세요.</span>');
    } else {
        // 폼 유효성 검사 통과 시 서버에 제출
        $.ajax({
            type: 'post',
            url: '/miniWeb/member/join.do',
            data: $('#joinForm').serialize(),
            dataType: 'text',
            success: function(){
                alert('회원가입이 완료되었습니다.');
                location.href = "/miniWeb/index.do";
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
            var addr = ''; // 주소 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') {
                addr = data.roadAddress;
            } else {
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

// 페이지 이동
$(function(){
    $("#gomain").click(function(){
        location.href="../index.do";
    });
});