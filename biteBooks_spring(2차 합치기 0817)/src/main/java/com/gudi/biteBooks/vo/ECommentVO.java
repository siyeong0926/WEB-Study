package com.gudi.biteBooks.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//상품 댓글 테이블
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ECommentVO {
    int ec_no = 0;
    int o_no = 0;
    int m_id = 0;
    int ep_no = 0;
    int b_no = 0;
    String ec_content = null;
    String ec_cdate = null;
    String ec_udate = null;
    int ec_point = 0;
}
