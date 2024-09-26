//아이디 찾기 - 등록된 이름,이메일 확인
$(function(){
	$(document).ready(function() { //아이디 찾기 모달
	    // 모달 열기
	    $("#openModalBtn").click(function() {
	        $("#findIdModal").css("display", "block");
	    });

	    // 모달 닫기 (X 버튼)
	    $(".close").click(function() {
	        $("#findIdModal").css("display", "none");
	    });

	    // 모달 외부 클릭 시 닫기
	    $(window).click(function(event) {
	        if ($(event.target).is("#findIdModal")) {
	            $("#findIdModal").css("display", "none");
	        }
	    });
		
		$('#name, #email').on('blur', function(){
			name = $('#name').val();
			email = $('#email').val();
			
			$('#nameDiv').html(''); 
			$('#emailDiv').html(''); 
			
			if(!name) {
				$('#nameDiv').html('<font color = red>이름 입력</font>');		
			} else if(!email) {
				$('#emailDiv').html('<font color = red>이메일 입력</font>');	
			} else {
				$.ajax({
					type: 'post',
					url: '/miniWeb/member/searchId.do',
					data: $("#findidForm").serialize(),  
					dataType: 'text',
					success: function(data){
						if(data.trim() !='fail'){
						     $("#result").html("<span>당신의 아이디는 " + data.trim() + "입니다.</span>");
						}else
						 alert('이름 혹은 이메일로 가입된 아이디 정보가 없습니다.');
					},
					error: function(e){
						console.log(e);
					}
				});
			}
		});
	});
});