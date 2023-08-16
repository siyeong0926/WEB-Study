<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/member/login.css">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	//로그인 버튼 클리 메서드
	$(".login_button").click(function(){
		//alert("로그인 버튼 실행");
		
		$("#login_form").attr("action", "/member/login");
		$("#login_form").submit();
	})
	
});

</script>
</head>
<body>

<div class="wrapper">
	<div class="wrap">
	<form id="login_form" method="post">
		<div class="logo_wrap">
			<span>Book Mall</span>
		</div>
	
	
		<div class="login_wrap">
		
			<div class="id_wrap">
				<div class="id_input_box">
					<input class="id_input" name="member_id">
				</div>
			</div>
			
			<div class="pw_wrap">
				<div class="pw_input_box">
					<input class="pw_input" name="member_pw"  type="password">
				</div>
			</div>
			<c:if test = "${result ==0}">
			
				<div class = "login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>			
			
			</c:if>
			
			<div class="login_button_wrap">
				<input type="button" class="login_button" value="로그인" >
			</div>
			
		</div>

	</form>
		
		
	</div>
	<!-- wrap -->
	
</div>
<!-- wrapper -->

</body>
</html>