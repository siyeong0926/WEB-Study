package com.gudi.biteBooks.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MailVO {
        private String address;
        private String title;
        private String message;
}
