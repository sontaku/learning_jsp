// 09_myform.js

var pwCheck = RegExp(/[^0-9]$/);
var nameCheck = RegExp(/^[가-힣]{2,6}$/);

$(function() {
	// 버튼 클릭시
	$('button').click(function() {
		// 사번 미입력시
		if( $('#empno').val().length == 0) {
			alert('사번을 입력해주세요.');
			return;
			
		// 사번 숫자 검증
		} else if( pwCheck.test( $('#empno').val() )  ) {
			alert('사번은 숫자로 입력해주세요.');
			return;
		// 사원명 한글 검증
		} else if( nameCheck($('#ename').val()) ) {
			alert('사원명은 한글로 입력해주세요.');
			return;
		// 사원명 글자수
		} else if( $('#ename').val().length > 5 ) {
			alert('사원명은 5글자 이내입니다.');
			return;
		}
		
		// 유효성 검사를 마치면 서버전송
		$('form').submit();
	})
})