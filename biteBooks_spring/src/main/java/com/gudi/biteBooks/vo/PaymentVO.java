package com.gudi.biteBooks.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//결제테이블
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PaymentVO {
    int p_no = 0;
    int o_no = 0;
    int m_id = 0;
    int ep_no = 0;
    int b_no = 0;
    int p_price = 0;
    String p_type = null;
    String p_date = null;
}
