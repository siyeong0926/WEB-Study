package com.gudi.biteBooks.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//에피소드 테이블
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class EpisodeVO {
    int b_no = 0;
    int ep_no = 0;
    String ep_title = null;
    String ep_cdate = null;
    String ep_udate = null;
    String ep_view = null;
    int ep_rprice = 0;
    int ep_cprice = 0;
    String ep_content = null;
}
