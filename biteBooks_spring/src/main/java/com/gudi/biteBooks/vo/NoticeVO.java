package com.gudi.biteBooks.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//공지사항 테이블
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class NoticeVO {
    int n_no = 0;
    int m_id = 0;
    String n_title = null;
    String n_content = null;
    String n_cdate = null;
    String n_udate = null;
    int n_gubun = 0;
}
