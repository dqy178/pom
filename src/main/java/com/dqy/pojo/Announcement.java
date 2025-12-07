package com.dqy.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @author 杜青云
 * Date  2025/7/17 下午5:32
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Announcement {
    private Integer announcementId;
    private String title;
    private String content;
    private Date creationTime;
    private String creator;
}
