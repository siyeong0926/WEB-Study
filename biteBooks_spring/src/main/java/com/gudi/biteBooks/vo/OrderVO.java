package com.gudi.biteBooks.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//주문테이블
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class OrderVO {
    int m_id = 0;
    int ep_no = 0;
    int b_no = 0;
    int o_no = 0;
    String o_date = null;
    int o_count = 0;
}
