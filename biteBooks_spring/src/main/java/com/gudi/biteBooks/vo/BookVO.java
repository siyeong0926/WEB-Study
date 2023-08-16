package com.gudi.biteBooks.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//Book 상품 테이블
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BookVO {
    int b_no = 0;
    String b_title = null;
    String b_author = null; 
    String b_publisher = null;
    String b_date = null;
    String b_thumbnail = null;
    String b_descript = null;
    String b_genre = null;
    String b_type = null;
}
