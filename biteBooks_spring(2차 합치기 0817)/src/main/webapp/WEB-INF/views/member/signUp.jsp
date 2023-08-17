<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>바이트 북스</title>
	<%@ include file="../common/bootstrap_common.jsp" %>
	<link rel="stylesheet" type="text/css" href="/resources/css/signUp.css">
</head>
<body>
<script src="/resources/js/signUp.js"></script>
<%@ include file="../common/introHeader.jsp" %>
<section class="bg-white">
		<div class="container py-4">
            <div class="row align-items-center justify-content-between">
				<header>SignUp</header>
	            </div>
	            <form id="signupForm" action="/member/memberInsert" method="post">
					<div class="form-group">
						<label for="inputEmail" class="form-label mt-4 bold">이메일 <span class="star">*</span></label>
						<div class="input-group">
							<input type="text" class="form-control" id="inputEmail" name="m_email" aria-describedby="emailHelp" placeholder="이메일을 입력해주세요">
							<button class="btn btn-email" type="button" id="checkEmail" disabled>이메일 본인확인</button>
						</div>
						<div class="invalid-feedback" id="invalid-feedback-email">이메일 형식이 잘못되었습니다.</div>
					</div>
                <div class="form-group">
               		<label for="inputName" class="form-label mt-4 bold">이름 <span class="star">*</span></label>
                    <input type="text" class="form-control" id="inputName" name="m_name" aria-describedby="emailHelp" placeholder="이름을 입력해주세요">
                </div>

				<div class="form-group">
					<label for="inputNickname" class="form-label mt-4 bold">닉네임 <span class="star">*</span></label>
					<input type="text" class="form-control" id="inputNickname" name="m_nickname" placeholder="닉네임을 입력해주세요">
					<div class="valid-feedback" id="valid-feedback-nickname">사용 가능한 닉네임입니다.</div>
					<div class="invalid-feedback" id="invalid-feedback-nickname">닉네임을 다시 입력해주세요.</div>
				</div>
                
				<div class="form-group has-danger">
				    <label class="form-label mt-4 bold" for="inputPassword">비밀번호 <span class="star">*</span></label>
				    <input type="password" class="form-control" id="inputPassword" name="m_pw" placeholder="비밀번호를 입력해주세요.">
					<div id="valid-password-message" class="valid-feedback">
						사용 가능한 비밀번호입니다.
					</div>
					<div id="invalid-feedback-password" class="invalid-feedback">
						<div id="length-warning">8자리 ~ 20자리 이내로 입력해주세요.</div>
						<div id="korean-warning">비밀번호에 한글을 사용 할 수 없습니다.</div>
						<div id="space-warning">비밀번호는 공백 없이 입력해주세요.</div>
						<div id="mix-warning">영문, 숫자, 특수문자를 혼합하여 입력해주세요.</div>
					</div>
				</div>

				<div class="form-group has-danger" id="confirmPasswordContainer">
				    <label class="form-label mt-4 bold" for="confirmPassword">비밀번호 재확인 <span class="star">*</span></label>
				    <input type="password" class="form-control" id="confirmPassword" disabled>
				    <div class="valid-feedback">비밀번호가 일치합니다.</div>
				    <div class="invalid-feedback">비밀번호가 일치하지 않습니다.</div>
				</div>

                <div class ="bir_wrap">
                	<label class="form-label mt-4 bold">생년월일 <span class="star">*</span></label>
                	<div class="bir_yy">
                		<span class="ps_box">
                			<input type="text" class="form-control" id="yy" placeholder="년(4자)" maxlength="4">
                		</span>
                	</div>
                	<div class="bir_mm">
                		<span class="ps_box focus">
			                <select class="form-select" id="mm" >
						        <option>월</option>
						        <option>1</option>
						        <option>2</option>
						        <option>3</option>
						        <option>4</option>
						        <option>5</option>
						        <option>6</option>
						        <option>7</option>
						        <option>8</option>
						        <option>9</option>
						        <option>10</option>
						        <option>11</option>
						        <option>12</option>
						     </select>
                		</span>
                	</div>
                	<div class="bir_dd">
                		<span class="ps_box">
                			<input type ="text" class="form-control" id ="dd" placeholder="일" maxlength="2">
                		</span>
                	</div>
                </div>
					<div class="line"></div>
				<input type="hidden" id="m_birth" name="m_birth">
				<div class="d-grid gap-2">
                    <button class="btn btn-signup" type="submit" id="signup-button" disabled>회원가입</button>
                </div>
            </form>
        </div>
    </section>
</body>
</html>