package com.gudi.biteBooks.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//대여 테이블
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class RentalVO {
    int r_no = 0;
    int p_no = 0;
    int o_no = 0;
    int m_id = 0;
    int ep_no = 0;
    int b_no = 0;
    String r_sdate = null;
    String r_edate = null;
}