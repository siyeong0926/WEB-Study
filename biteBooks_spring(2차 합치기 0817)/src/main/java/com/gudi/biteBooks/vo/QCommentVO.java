package com.gudi.biteBooks.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//qna댓글 테이블
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class QCommentVO {
    int qc_no = 0;
    int q_no = 0;
    int m_id = 0;
    String qc_content = null;
    String qc_cdate = null;
    String qc_udate = null;
}

