package com.gudi.biteBooks.logic;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gudi.biteBooks.dao.MemberDao;
import com.gudi.biteBooks.vo.MailVO;
import com.gudi.biteBooks.vo.MemberVO;

import javax.activation.FileDataSource;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;

@Service
@Transactional
public class MemberLogic {
    Logger logger = LoggerFactory.getLogger(MemberLogic.class);

    @Autowired
    ServletContext servletContext;

    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    private MemberDao memberDao = null;

    public List<Map<String, Object>> memberList(Map<String, Object> pMap) {
        logger.info("memberList");
        List<Map<String, Object>> mList = null;
        mList = memberDao.memberList(pMap);
        return mList;
    }

    public int memberInsert(Map<String, Object> pMap) {
        logger.info("memberInsert");
        int result = -1;
        result = memberDao.memberInsert(pMap);
        logger.info(String.valueOf(result));
        return result;
    }

    public int memberUpdate(Map<String, Object> pMap) {
        logger.info("memberUpdate");
        int result = -1;
        result = memberDao.memberUpdate(pMap);
        logger.info(String.valueOf(result));
        return result;
    }

    public int memberDelete(Map<String, Object> pMap) {
        logger.info("memberDelete");
        int result = -1;
        result = memberDao.memberDelete(pMap);
        logger.info("Logic"+String.valueOf(result));
        return result;
    }

    public int checkEmail(MemberVO mVO) {
        logger.info("checkEmail");
        int result = -1;
        result = memberDao.checkEmail(mVO);
        return result;
    }

    public int checkNickname(MemberVO mVO) {
        logger.info("checkNickname");
        int result = -1;
        result = memberDao.checkNickname(mVO);
        logger.info("result!!!!!!!! : " + result);
        return result;
    }

    public Map<String, Object> loginCheck(Map<String, Object> pMap) {
		logger.info("login");
		Map<String, Object> user = null;
		user = memberDao.loginCheck(pMap);
		
		return user;
	}

    public Map<String, Object> findEmail(Map<String, Object> pMap) {
        logger.info("이메일찾기 호출");
        Map<String, Object> email = null;
        email = memberDao.findEmail(pMap);
        return email;
    }

    
//////////////////////////////메일링 서비스//////////////////////////////////////////

    // 메일 내용을 생성하고 임시 비밀번호로 회원 비밀번호를 변경
    public MailVO createMailAndChangePassword(Map<String, Object> pMap) {
        int result = 0;
        String str = getTempPassword(); // 임시 비밀번호 생성
        pMap.put("m_pw", str); // 임시 비밀번호를 Map에 설정
        result = updatePassword(pMap);

        if(result > 0) {
            String userEmail = (String) pMap.get("m_email");
            // 메일 VO 생성
            MailVO mvo = new MailVO();
            mvo.setAddress(userEmail);
            mvo.setTitle("BOOKFLIX 임시비밀번호 안내 이메일");

            String htmlContent = "<div style='text-align:center;'>"
                    + "<h1><img src='cid:logo' alt='BOOKFLIX_Logo'></h1>"
                    + "<h3>임시 비밀번호 발급</h3>"
                    + "<h1>[ <strong style='color:#ff5c5c;'>" + str + "</strong> ]</h1>"
                    + "<h3>로그인 후에 비밀번호를 "+"<span style='color:red;'>변경</span>"+" 해주세요.</h3>"
                    + "</div>";

            mvo.setMessage(htmlContent);
            return mvo;
        }
        return null;
    }

    //임시 비밀번호로 업데이트
    public int updatePassword(Map<String, Object> pMap) {
        int result = -1;
        result = memberDao.updatePassword(pMap);
        logger.info("result!!!!!!!!!!!!!"+result);
        return result;
    }

    //랜덤함수로 임시비밀번호 구문 만들기
    public String getTempPassword(){
        char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
                'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };
        String str = "";

        // 문자 배열 길이의 값을 랜덤으로 10개를 뽑아 구문을 작성함
        int idx = 0;
        for (int i = 0; i < 10; i++) {
            idx = (int) (charSet.length * Math.random());
            str += charSet[idx];
        }
        return str;
    }
    
    // 메일보내기
    public void mailSend(MailVO mvo) {
        try {
            String LOGO_PATH = servletContext.getRealPath("/resources/img/headerLogo.png");
            FileDataSource fds = new FileDataSource(LOGO_PATH);
            MimeMessage mimeMessage = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "utf-8");
            helper.setTo(mvo.getAddress());
            helper.setSubject(mvo.getTitle());
            helper.setText(mvo.getMessage(), true);
            helper.setFrom("bookflix65@gmail.com");
            helper.setReplyTo("bookflix65@gmail.com");
            System.out.println("message: " + mimeMessage);
            helper.addInline("logo", fds);
            mailSender.send(mimeMessage);
            logger.info("전송 완료!!!!!!!!!");
        } catch (Exception e) {
            e.printStackTrace();
            logger.info("메일 전송 실패!!!!!!!!!!");
        }
    }
}
