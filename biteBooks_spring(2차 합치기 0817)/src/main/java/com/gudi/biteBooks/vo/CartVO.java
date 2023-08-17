package com.gudi.biteBooks.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//장바구니 테이블
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CartVO {
    int c_no = 0;
    int m_id = 0;
    int ep_no = 0;
    int b_no = 0;
    String c_type = null;
}
