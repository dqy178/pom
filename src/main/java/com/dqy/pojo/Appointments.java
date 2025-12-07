package com.dqy.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @author 付鑫喆
 * Date 2025/7/17 22:16
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Appointments {
    private Integer appointmentId;
    private Integer patientId;
    private Integer doctorId;
    private Date appointmentDate; // 日期，如 "2025-07-18"
    private String appointmentTime; // 时间，如 "14:30"
    private Status status; // 挂号状态
    private Date createTime; // 创建时间，映射数据库的 DATETIME

    private Patients patient; // 关联的患者信息

    // 挂号状态枚举，匹配数据库 ENUM 值
    public enum Status {
        booked,     // 已预约
        cancelled,  // 已预约
        completed   // 已完成
    }
}