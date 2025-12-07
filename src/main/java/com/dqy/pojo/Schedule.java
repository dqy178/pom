package com.dqy.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @author 杜青云
 * Date  2025/7/16 上午10:54
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Schedule {
    private Integer scheduleId;
    private Integer doctorId;
    private Date date;
    private String shiftTime;
    private Integer departmentId;
    private Integer isAvailable;
    private Integer visitCount;
    private Integer sumCount;
    private String remarks;
    private String doctorName; // 医生姓名
}
