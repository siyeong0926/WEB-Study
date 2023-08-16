package com.gudi.biteBooks.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//좋아요 테이블
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class LikeVO {
    int l_no = 0;
    int m_id = 0;
    int b_no = 0;
}
