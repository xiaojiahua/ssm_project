package com.java.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Invitatiton {
    private int id;
    private String title;
    private String summary;
    private String author;
    private String creatdate;
}
