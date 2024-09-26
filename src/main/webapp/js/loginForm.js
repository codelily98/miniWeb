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
	
	//아이디 찾기 SweetAlert2 모달
    $(document).ready(function() {
        $("#seachId").click(function() {
            Swal.fire({
                title: '아이디 찾기',
                html: `
                    <form id="findidForm">
                        <div class="inputwrap">
                            <input type="text" id="name" name="name" placeholder="이름" required="required">
                            <div id="nameDiv"></div>
                        </div>
                        <div class="inputwrap">
                            <input type="text" id="email" name="email" placeholder="이메일" required="required">
                            <div id="emailDiv"></div>
                        </div>
						<div class="btnwrap">
							<input type="button" id="emailvertify" class="emailvertify" value="인증번호발송">
						</div>
                        <div class="inputwrap">
                            <input type="text" id="checknumber" name="checknumber" placeholder="인증번호" required="required">
                            <div id="checknumberDiv"></div>
                        </div>
                        <div id="result"></div>
                    </form>
                `,
                showCancelButton: true,
                confirmButtonText: '아이디 찾기',
				cancelButtonText: '취소',
				customClass: {
	                confirmButton: 'custom-confirm-btn',  // confirm 버튼에 커스텀 클래스를 지정
					cancelButton: 'custom-cancel-btn'	  // cancel 버튼에 커스텀 클래스를 지정
	            },
				didRender: () => {
				    // 인증번호 발송 버튼 클릭 이벤트
				    $('#emailvertify').click(function() {
				        const email = $('#email').val();
				        
				        if (!email) {
				            Swal.showValidationMessage('이메일을 입력하세요.');
				            return;
				        }
				
				        // AJAX 요청: 인증번호 발송
				        $.ajax({
				            url: '/miniWeb/member/emailverify.do',  // 인증번호 전송 URL
				            type: 'POST',
				            data: {
				                email: email
				            },
				            success: function(response) {
				                if (response.success) {
				                    Swal.fire({
				                        icon: 'success',
				                        title: '인증번호가 전송되었습니다.',
				                        text: '입력한 이메일 주소로 인증번호를 확인하세요.'
				                    });
				                } else {
				                    Swal.showValidationMessage('인증번호 전송에 실패했습니다.');
				                }
				            },
				            error: function() {
				                Swal.showValidationMessage('서버 오류가 발생했습니다.');
				            }
				        });
				    });
				},
            	preConfirm: () => {
                    const name = $('#name').val();
                    const email = $('#email').val();
                    const checknumber = $('#checknumber').val();
                    
                    if (!name || !email || !checknumber) {
                        Swal.showValidationMessage('모든 필드를 입력하세요.');
                        return false;
                    }
					// AJAX 요청
					return new Promise((resolve) => {
						$.ajax({
							url: '/miniWeb/member/searchId.do',  // 서버 URL
							type: 'POST',  // POST 방식
							data: {
								name: name,
								email: email,
								checknumber: checknumber
							},
							success: function(response) {
								// 서버에서 받은 응답 처리
								if (response.success) {
									resolve(response);  // 성공 시 resolve
								} else {
									Swal.showValidationMessage(response.message);  // 실패 시 메시지 표시
								}
							},
							error: function() {
								Swal.showValidationMessage('서버 오류가 발생했습니다.');
							}
						});
					});
				}
            }).then((result) => {
				if (result.isConfirmed) {
					// 인증 성공 시 결과 처리
			        Swal.fire({
			            title: '아이디 찾기 성공!',
			            text: '아이디는 ' + result.value.id + ' 입니다.',
			            icon: 'success'
			        });
			    }
			});
        });
    });
	
	//비밀번호 찾기 SweetAlert2 모달
	$("#searchPwd").click(function() {  // 비밀번호 찾기 모달 버튼
        Swal.fire({
            title: '비밀번호 찾기',
            html: `
                <form id="findPwdForm">
					<div class="inputwrap">
                        <input type="text" id="id" name="id" placeholder="아이디" required="required">
                        <div id="idDivPwd"></div>
                    </div>
                    <div class="inputwrap">
                        <input type="text" id="name" name="name" placeholder="이름" required="required">
                        <div id="nameDivPwd"></div>
                    </div>
                    <div class="inputwrap">
                        <input type="text" id="email" name="email" placeholder="이메일" required="required">
                        <div id="emailDivPwd"></div>
                    </div>
					<div class="btnwrap">
						<input type="button" id="emailvertify" class="emailvertify" value="인증번호발송">
					</div>
                    <div class="inputwrap">
                        <input type="text" id="checknumber" name="checknumber" placeholder="인증번호" required="required">
                        <div id="checknumberDiv"></div>
                    </div>
                    <div id="result"></div>
                </form>
            `,
            showCancelButton: true,
            confirmButtonText: '비밀번호 찾기',
			cancelButtonText: '취소',
			customClass: {
                confirmButton: 'custom-confirm-btn',  // confirm 버튼에 커스텀 클래스를 지정
				cancelButton: 'custom-cancel-btn'	  // cancel 버튼에 커스텀 클래스를 지정
            },
            didRender: () => {
                // 인증번호 발송 버튼 클릭 이벤트
                $('#emailVerify').click(function() {
                    const email = $('#email').val();
                    
                    if (!email) {
                        Swal.showValidationMessage('이메일을 입력하세요.');
                        return;
                    }
            
                    // AJAX 요청: 인증번호 발송
                    $.ajax({
                        url: '/miniWeb/member/emailVerify.do',  // 인증번호 전송 URL (비밀번호 찾기용)
                        type: 'POST',
                        data: {
                            email: email
                        },
                        success: function(response) {
                            if (response.success) {
                                Swal.fire({
                                    icon: 'success',
                                    title: '인증번호가 전송되었습니다.',
                                    text: '입력한 이메일 주소로 인증번호를 확인하세요.'
                                });
                            } else {
                                Swal.showValidationMessage('인증번호 전송에 실패했습니다.');
                            }
                        },
                        error: function() {
                            Swal.showValidationMessage('서버 오류가 발생했습니다.');
                        }
                    });
                });
            },
            preConfirm: () => {
				const id = $('#id').val();
                const name = $('#name').val();
                const email = $('#email').val();
                const checknumber = $('#checknumber').val();
                
                if (!id || !name || !email || !checknumber) {
                    Swal.showValidationMessage('모든 필드를 입력하세요.');
                    return false;
                }

                // AJAX 요청: 비밀번호 찾기
                return new Promise((resolve) => {
                    $.ajax({
                        url: '/miniWeb/member/searchPwd.do',  // 비밀번호 찾기 서버 URL
                        type: 'POST',
                        data: {
							id: id,
                            name: name,
                            email: email,
                            checknumber: checknumber
                        },
                        success: function(response) {
                            if (response.success) {
                                resolve(response);  // 성공 시 resolve
                            } else {
                                Swal.showValidationMessage(response.message);  // 실패 시 메시지 표시
                            }
                        },
                        error: function() {
                            Swal.showValidationMessage('서버 오류가 발생했습니다.');
                        }
                    });
                });
            }
        }).then((result) => {
            if (result.isConfirmed) {
                // 인증 성공 시 결과 처리
                Swal.fire({
                    title: '비밀번호 찾기 성공!',
                    text: '비밀번호는 ' + result.value.pwd + ' 입니다.',
                    icon: 'success'
                });
            }
        });
    });
});