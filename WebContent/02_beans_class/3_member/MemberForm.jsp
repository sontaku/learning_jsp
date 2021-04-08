<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript">
	function openWin() {
		var id = document.frm.id.value;
	/*
		window.open("CheckId_ajax.jsp?userId=" + id, "", "width=200, height=150");
		window.open("CheckId.jsp?userId=" + id, "", "width=200, height=150");
	*/
	}
	$(function() {
		$('input[value=중복확인]').click(function() {
			//alert('무야호')
			let param = $('input[name=id]').val()
			//alert(param);

			$.ajax({
				type : 'get',
				data : { userId : param	},
				url : "CheckId_ajax.jsp",
				dataType : 'text',
				success : parseData,
				error : function() {
					alert('에러발생');
				}
			});

			function parseData(data) {
				if (data.trim() == "YES") {
					$('#id_check').text('사용가능한 아이디입니다.');
					$('#id_check').show();
				} else {
					$('#id_check').text('이미 사용중인 아이디입니다.');
					$('#id_check').show();
				}
			}
		})
		$('input[value=회원가입]').click(function() {
			if($('#id_check').text() == '사용가능한 아이디입니다.') {
				
			} else if($('#id_check').text() == '이미 사용중인 아이디입니다.') {
				alert('사용가능한 아이디로 변경해주세요.');
				return;
			} else {
				alert('아이디 중복확인이 필요합니다.');
				return;
			}
		})
	})
	
</script>
<style type="text/css">
html, body {
	width: 100%;
	height: 100%;
	margin: 0;
	padding: 0;
}

form {
	width: 497px;
	margin: 0;
}

#id_check {
	float: left;
}
</style>
</head>
<body>

	<h1>회원가입서 작성하기</h1>

	<form action="InsertMember.jsp" method="post" name="frm">
		<table>
			<tr>
				<td width="100"><font color="blue">아이디</font></td>
				<td width="100"><input type="text" name="id"> <input
					type="button" value="중복확인" onclick="openWin()"><br /></td>
			</tr>
			<div class="check_font" id="id_check"></div>
			<tr>
				<td width="100"><font color="blue">비밀번호</font></td>
				<td width="100"><input type="password" name="password" /><br />
				</td>
			</tr>
			<tr>
				<td width="100"><font color="blue">비밀번호학인</font></td>
				<td width="100"><input type="password" name="repassword" /><br />
				</td>
			</tr>
			<tr>
				<td width="100"><font color="blue">이름</font></td>
				<td width="100"><input type="text" name="name" /><br /></td>
			</tr>
			<tr>
				<td width="100"><font color="blue">전화번호</font></td>
				<td><input type="text" size="15" name="tel" /> <br /></td>
			</tr>
			<tr>
				<td width="100"><font color="blue">주소</font></td>
				<td><input type="text" size="50" name="addr" /><br /></td>
			</tr>
			<tr>
				<td width="100">
					<!--로그인 버튼--> <input type="submit" value="회원가입">
				</td>
				<td width="100"><input type="reset" name="cancel" value="취소"><br />
				</td>
			</tr>
		</table>
	</form>



</body>
</html>
