package com.gudi.biteBooks.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//qna테이블
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class QnaVO {
    int q_no = 0;
    int m_id = 0;
    String q_title = null;
    String q_content = null;
    String q_cdate = null;
    String q_udate = null;
    String q_category = null;
    String q_state = null;
}
