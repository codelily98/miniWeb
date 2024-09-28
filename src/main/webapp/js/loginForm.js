$(function(){
	$(document).on('click', '#gomain', function(){
		location.href="../index.do";
	});
	
	// 로그인 버튼 클릭 이벤트
	$('#loginbtn').on('click', function(){
		$('#checkpwd').empty();				
		
		if ($('#id').val() == '')
			$('#checkpwd').html("<span style='color: red; font-size: 10pt; font-weight: bold;'>아이디를 입력해주세요.</span>");
		else if ($('#pwd').val() == '')
			$('#checkpwd').html("<span style='color: red; font-size: 10pt; font-weight: bold;'>비밀번호를 입력해주세요.</span>");
		else {
			$.ajax({
				type: 'post',
				url : '/miniWeb/member/login.do',
				data : $('#loginForm').serialize(),
				datatype: 'text',
				success: function(response){
					let result = response.trim();
					if(result != 'fail') {
						location.href="../index.do";				
					} else {
						$("#checkPwd").html("<span style='color: red; font-size: 10pt; font-weight: bold;'>아이디 또는 비밀번호를 확인해주세요.</span>");
					}
				},
				error: function(e) {
					console.log(e);
				}
			});
		}	
	});
	
	$(function() {
	     // 아이디 찾기 SweetAlert2 모달
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
	                    <input type="button" id="checkemail" class="emailvertify" value="인증번호 발송">
	                 </div>
	                 <div class="inputwrap">
	                    <input type="text" id="ckechnum" name="ckechnum" placeholder="인증번호" required="required">
	                    <div id="checknumberDiv"></div>
	                 </div>
	                 <div class="btnwrap">
	                    <input type="button" id="checkemailnum" class="emailvertify" value="인증번호 확인">
	                 </div>
	                 <div id="result"></div>
					 <div id="combtn"></div>
	              </form>
	           `,
	           showCancelButton: true,
	           confirmButtonText: '아이디 찾기',
	           cancelButtonText: '취소',
	           customClass: {
	              confirmButton: 'custom-confirm-btn',
	              cancelButton: 'custom-cancel-btn'
	           },
	           preConfirm: () => {
	              const name = $('#name').val();
	              const email = $('#email').val();
	              const checkemail = $('#checkemail').val();
	              
	              if (!name || !email || !checkemail) {
	                 Swal.showValidationMessage('모든 필드를 입력하세요.');
	                 return false;
	              }
	              
	              // AJAX 요청: 아이디 찾기
	              return new Promise((resolve) => {
	                 $.ajax({
	                    url: '/miniWeb/member/searchId.do',
	                    type: 'POST',
	                    data: {
	                       name: name,
	                       email: email
	                    },
	                    success: function(response) {
	                       let result = response.trim();
	                       if (result != 'fail') {
	                          $('#checknumberDiv').html("당신의 아이디는<span style='color: red;'>" + result + "</span>입니다.");
	                       } else {
	                          $('#checknumberDiv').html("<span style='color: red;'>등록된 정보로 가입된 아이디가 없습니다.</span>");
	                       }
	                    },
	                    error: function() {
	                       Swal.showValidationMessage('서버 오류가 발생했습니다.');
						   resolve();
	                    }
	                 });
	              });
	           }
	        });
	        
	        // 인증번호 발송 버튼 클릭 이벤트
	        $(document).on('click', '#checkemail', function() {
	           const email = $('#email').val();
	           if (!email) {
	              Swal.showValidationMessage('이메일을 입력하세요.');
	              return;
	           }
	           
	           // AJAX 요청: 인증번호 발송
	           $.ajax({
	              url: '/miniWeb/sendAuthCode',
	              type: 'POST',
	              data: {
	                 email: email
	              },
	              success: function(response) {
	                 $("#checknumberDiv").html(response);
	              },
	              error: function() {
	                 $('#checknumberDiv').html("<span style='color: red;'>서버 오류가 발생했습니다.</span>");
	              }
	           });
	        });
	        
	        // 인증번호 확인 버튼 클릭 이벤트
	        $(document).on('click', '#checkemailnum', function() {
	           const ckechnum = $('#ckechnum').val();
	           const email = $('#email').val();

	           if (!ckechnum) {
	              Swal.showValidationMessage('인증번호를 입력하세요.');
	              return;
	           }

	           // AJAX 요청: 인증번호 확인
	           $.ajax({
	              url: '/miniWeb/verifyAuthCode', // 인증번호 확인 URL
	              type: 'POST',
	              data: {
	                 email: email,
	                 ckechnum: ckechnum
	              },
	              success: function(response) {
	                 $('#checknumberDiv').html(response);
	              },
					error: function() {
						$('#checknumberDiv').html("<span style='color: red;'>서버 오류가 발생했습니다.</span>");
					}
				});
			});
		});
	});
	
     // 아이디 찾기 SweetAlert2 모달
     $("#searchPwd").click(function() {
        Swal.fire({
           title: '비밀번호 찾기',
           html: `
              <form id="findidForm">
                 <div class="inputwrap">
                    <input type="text" id="modalid" name="modalid" placeholder="아이디" required="required">
                    <div id="nameDiv"></div>
                 </div>
				 <div class="inputwrap">
                     <input type="text" id="name" name="name" placeholder="이름" required="required">
                     <div id="nameDiv"></div>
                  </div>
                 <div class="inputwrap">
                    <input type="text" id="email" name="email" placeholder="이메일" required="required">
                    <div id="emailDiv"></div>
                 </div>
                 <div class="btnwrap">
                    <input type="button" id="checkemail" class="emailvertify" value="인증번호 발송">
                 </div>
                 <div class="inputwrap">
                    <input type="text" id="ckechnum" name="ckechnum" placeholder="인증번호" required="required">
                    <div id="checknumberDiv"></div>
                 </div>
                 <div class="btnwrap">
                    <input type="button" id="checkemailnum" class="emailvertify" value="인증번호 확인">
                 </div>
                 <div id="result"></div>
              </form>
           `,
           showCancelButton: true,
           confirmButtonText: '비밀번호 찾기',
           cancelButtonText: '취소',
           customClass: {
              confirmButton: 'custom-confirm-btn',
              cancelButton: 'custom-cancel-btn'
           },
           preConfirm: () => {
              const id = $('#modalid').val();
			  const name = $('#name').val();
              const email = $('#email').val();
              const checkemail = $('#checkemail').val();
              
              if (!id || !name || !email || !checkemail) {
                 Swal.showValidationMessage('모든 필드를 입력하세요.');
                 return false;
              }
              
              // AJAX 요청: 아이디 찾기
              return new Promise((resolve) => {
                 $.ajax({
                    url: '/miniWeb/member/searchPwd.do',
                    type: 'POST',
                    data: {
                       id: id,
					   name: name,
                       email: email
                    },
                    success: function(response) {
                       let result = response.trim();
                       if (result != 'fail') {
                          $('#checknumberDiv').html("당신의 비밀번호는<span style='color: red;'>" + result + "</span>입니다.");
                       } else {
                          $('#checknumberDiv').html("<span style='color: red;'>등록된 정보로 가입된 아이디가 없습니다.</span>");
                       }
                    },
                    error: function() {
                       Swal.showValidationMessage('서버 오류가 발생했습니다.');
					   resolve();
                    }
                 });
              });
           }
        });
        
        // 인증번호 발송 버튼 클릭 이벤트
        $(document).on('click', '#checkemail', function() {
           const email = $('#email').val();
           if (!email) {
              Swal.showValidationMessage('이메일을 입력하세요.');
              return;
           }
           
           // AJAX 요청: 인증번호 발송
           $.ajax({
              url: '/miniWeb/sendAuthCode',
              type: 'POST',
              data: {
                 email: email
              },
              success: function(response) {
                 $("#checknumberDiv").html(response);
              },
              error: function() {
                 $('#checknumberDiv').html("<span style='color: red;'>서버 오류가 발생했습니다.</span>");
              }
           });
        });
        
        // 인증번호 확인 버튼 클릭 이벤트
        $(document).on('click', '#checkemailnum', function() {
           const ckechnum = $('#ckechnum').val();
           const email = $('#email').val();

           if (!ckechnum) {
              Swal.showValidationMessage('인증번호를 입력하세요.');
              return;
           }

           // AJAX 요청: 인증번호 확인
           $.ajax({
              url: '/miniWeb/verifyAuthCode', // 인증번호 확인 URL
              type: 'POST',
              data: {
                 email: email,
                 ckechnum: ckechnum
              },
              success: function(response) {
                 $('#checknumberDiv').html(response);
              },
				error: function() {
					$('#checknumberDiv').html("<span style='color: red;'>서버 오류가 발생했습니다.</span>");
				}
			});
		});
	});

});
