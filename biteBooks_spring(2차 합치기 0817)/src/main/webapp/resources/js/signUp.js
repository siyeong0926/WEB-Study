window.addEventListener('DOMContentLoaded', (event) => {
    // Get the password and confirm password fields
    const inputNickname = document.getElementById('inputNickname');
    const inputPassword = document.getElementById('inputPassword');
    const confirmPassword = document.getElementById('confirmPassword');
    const inputEmail = document.getElementById('inputEmail');
    const checkEmail = document.getElementById('checkEmail');
    const signupButton = document.getElementById('signup-button');
    const invalidFeedbackPassword = document.getElementById('invalid-feedback-password');
    const invalidFeedbackEmail = document.getElementById('invalid-feedback-email');
    const invalidFeedbackNickname = document.getElementById('invalid-feedback-nickname');
    const validFeedbackNickname = document.getElementById('valid-feedback-nickname');
    const yy = document.getElementById('yy');
    const mm = document.getElementById('mm');
    const dd = document.getElementById('dd');
    const form = document.getElementById('signupForm');

    let isEmailValid = false;
    let isPasswordValid = false;
    let isConfirmPasswordValid = false;

    const checkPasswordMatch =()=> {
        const pw = inputPassword.value;
        const confirmPw = confirmPassword.value;

        if (pw === '' || confirmPw === '') {
            confirmPassword.setCustomValidity('');
            confirmPassword.classList.remove('is-invalid');
            confirmPassword.classList.remove('is-valid');
            isConfirmPasswordValid = false;
        } else if (pw !== confirmPw) {
            confirmPassword.setCustomValidity('비밀번호를 다시 확인해주세요.');
            confirmPassword.classList.add('is-invalid');
            confirmPassword.classList.remove('is-valid');
            isConfirmPasswordValid = false;
        } else {
            confirmPassword.setCustomValidity('');
            confirmPassword.classList.remove('is-invalid');
            confirmPassword.classList.add('is-valid');
            isConfirmPasswordValid = true;
        }
        updateSignupButton();
    }
    inputPassword.addEventListener('input', (e) => {
        validatePassword(e);
        checkPasswordMatch(); // 비밀번호 변경 시 재확인 비밀번호도 검사
        // 다른 로직...
    });
    inputEmail.addEventListener('input', () => {
        // Check if the email input field has a value
        if (inputEmail.value) {
            // If yes, remove the 'disabled' attribute from the button
            checkEmail.disabled = false;
            isEmailValid = true;
        } else {
            // If no, add the 'disabled' attribute to the button
            checkEmail.disabled = true;
            isEmailValid = false;
        }
    });

    const debounce=(func, wait)=> {
        let timeout;
        return function(...args) {
            clearTimeout(timeout);
            timeout = setTimeout(() => func.apply(this, args), wait);
        };
    }

    const validateEmail = (inputEmail) => {
        const pattern = /^([0-9a-zA-Z_.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
        const email = inputEmail.value;

        if (email === "") {
            inputEmail.classList.remove('is-invalid');
            inputEmail.classList.remove('is-valid');
            invalidFeedbackEmail.style.display = 'none'; // Hide invalid feedback
            checkEmail.disabled = true;
        } else if (!pattern.test(email)) {
            inputEmail.setCustomValidity("이메일 형식이 잘못되었습니다.");
            inputEmail.classList.add('is-invalid');
            inputEmail.classList.remove('is-valid');
            invalidFeedbackEmail.style.display = 'block'; // Show invalid feedback
            checkEmail.disabled = true;
        } else {
            inputEmail.setCustomValidity('');
            inputEmail.classList.remove('is-invalid');
            inputEmail.classList.add('is-valid');
            invalidFeedbackEmail.style.display = 'none'; // Hide invalid feedback
            checkEmail.disabled = false;
        }
        updateSignupButton();
    };

    inputNickname.addEventListener('input', debounce(() => {
        if (inputNickname.value === '') {
            document.getElementById('invalid-feedback-nickname').style.display = 'none';
            document.getElementById('valid-feedback-nickname').style.display = 'none';
            return; // Early return to exit the function
        }
        // AJAX 요청을 보냅니다.
        fetch('/member/checkNickname', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                m_nickname: inputNickname.value,
            }),
        })
            .then(response => response.json())
            .then(data => {
                if (data.check) {
                    validFeedbackNickname.style.display = 'none'; // valid feedback div 요소 숨기기
                    invalidFeedbackNickname.style.display = 'block'; // invalid feedback div 요소 보여주기
                    inputNickname.setCustomValidity("닉네임을 다시 입력해주세요.");
                } else {
                    validFeedbackNickname.style.display = 'block'; // valid feedback div 요소 보여주기
                    invalidFeedbackNickname.style.display = 'none'; // invalid feedback div 요소 숨기기
                    inputNickname.setCustomValidity("");
                }
            })
            .catch((error) => {
                console.error('Error:', error);
            });
    },500));

    const inputs = Array.from(document.querySelectorAll('input, select'));
    inputs.forEach((input, i) => {
        input.addEventListener('keyup', function(e) {
            if (e.key === 'Enter') {
                e.preventDefault();
                if (i + 1 < inputs.length) { // 다음 input이 있을 경우
                    inputs[i + 1].focus();
                } else { // 마지막 input에서 엔터를 누른 경우

                }
            }
        });
    });
    const handleFormSubmit = (e) => {
        const yy = document.getElementById('yy').value;
        const mm = document.getElementById('mm').value;
        const dd = document.getElementById('dd').value;
        const m_birth = yy + '-' + mm + '-' + dd;
        document.getElementById('m_birth').value = m_birth;

        // 추가적인 제출 로직 (예: AJAX 요청 등)
    };
    const validatePassword = (e) => {
        console.log("Password validation triggered.");
        const pw = e.target.value;
        const num = pw.search(/[0-9]/g);
        const eng = pw.search(/[a-z]/gi);
        const spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
        const checkKorean = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
        if (pw === '') {
            document.getElementById('valid-password-message').style.display = 'none';
            document.getElementById('length-warning').style.display = 'none';
            document.getElementById('korean-warning').style.display = 'none';
            document.getElementById('space-warning').style.display = 'none';
            document.getElementById('mix-warning').style.display = 'none';
            document.getElementById('invalid-feedback-password').style.display = 'none';
            return; // Early return to exit the function
        }
        // 각 경고 문구 선택
        const lengthWarning = document.getElementById('length-warning');
        const koreanWarning = document.getElementById('korean-warning');
        const spaceWarning = document.getElementById('space-warning');
        const mixWarning = document.getElementById('mix-warning');

        // 조건에 따라 문구 보이기/숨기기
        lengthWarning.style.display = (pw.length < 8 || pw.length > 20) ? 'block' : 'none';
        koreanWarning.style.display = checkKorean.test(pw) ? 'block' : 'none';
        spaceWarning.style.display = pw.search(/\s/) !== -1 ? 'block' : 'none';
        mixWarning.style.display = (num < 0 || eng < 0 || spe < 0) ? 'block' : 'none';

        // 어떤 문구가 보이면 invalid-feedback-password를 보이게 함
        if (pw.length < 8 || pw.length > 20 || checkKorean.test(pw) || pw.search(/\s/) !== -1 || (num < 0 || eng < 0 || spe < 0)) {
            document.getElementById('invalid-feedback-password').style.display = 'block';
            document.getElementById('valid-password-message').style.display = 'none';
            isPasswordValid = false;
            confirmPassword.disabled = true;
        } else {
            document.getElementById('invalid-feedback-password').style.display = 'none';
            document.getElementById('valid-password-message').style.display = 'block';
            isPasswordValid = true;
            confirmPassword.disabled = false;
        }
    };
    const updateSignupButton = () => {
        if (isEmailValid && isPasswordValid && isConfirmPasswordValid
            && yy.value && mm.value && dd.value) {
            signupButton.disabled = false;
        } else {
            signupButton.disabled = true;
        }
    }

    form.addEventListener('submit', (e) => {
        // 폼 제출 이벤트를 처리합니다.
        // 예를 들어, 모든 입력이 유효한지 확인한 후 제출을 진행하거나 중지할 수 있습니다.
        if (!isEmailValid || !isPasswordValid || !isConfirmPasswordValid) {
            e.preventDefault(); // 폼 제출 중지
            alert('모든 필드가 올바르게 입력되지 않았습니다.');
        }
    });
    // Add event listener for each input field
    inputEmail.addEventListener('input', () => validateEmail(inputEmail));
    inputPassword.addEventListener('input', validatePassword);
    confirmPassword.addEventListener('input', checkPasswordMatch);
    inputEmail.addEventListener('input', updateSignupButton);
    inputPassword.addEventListener('input', updateSignupButton);
    confirmPassword.addEventListener('input', updateSignupButton);
    yy.addEventListener('input', updateSignupButton);
    mm.addEventListener('change', updateSignupButton); // change 'input' to 'change' for select elements
    dd.addEventListener('input', updateSignupButton);
    document.getElementById('signupForm').addEventListener('submit', handleFormSubmit);
});
