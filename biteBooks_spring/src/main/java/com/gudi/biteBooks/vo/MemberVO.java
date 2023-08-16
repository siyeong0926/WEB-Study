package com.gudi.biteBooks.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//회원테이블
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MemberVO {
    int m_id = 0;
    String m_email  = null;
    String m_pw = null;
    String m_name   = null;
    String m_nickname   = null;
    String m_birth  = null;
    String m_signup = null;
    String m_admin  = null;
    String m_phone  = null;
    String salt = null;
}
