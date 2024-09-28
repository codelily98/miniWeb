let seq = $('td[data-seq]').data('seq');
let pwd = $('#pwd').val();

$('#deleteBtn').click(function(){
	let password = prompt('비밀번호를 입력하세요.');
	if(password == pwd){
		$.ajax({
			type:'post',
			url:'./boardDelete.do',
			data:{'seq':seq},
			dataType:'text',
			success:function(data){
				alert('글을 삭제하였습니다.');
				location.href = './boardForm.do?pg=1';
			},
			error:function(e){
				alert('글을 삭제하는데 실패했습니다.');
				console.log(e);
			}
		});
	}
	else{
		alert('비밀번호가 일치하지 않습니다.');
	}
});