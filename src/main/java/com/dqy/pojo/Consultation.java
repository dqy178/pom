package com.dqy.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

/**
 * @author 付鑫喆
 * Date 2025/7/17 22:37
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Consultation {
    private Integer consultationId;
    private Integer patientId;
    private Integer doctorId;
    private Timestamp consultationTime; // 就诊时间，映射数据库 TIMESTAMP 或 DATETIME
    private Boolean isHospitalRegistered; // 是否挂号住院
    private Boolean isHospitalized; // 是否住院
    private String medicalAdviceCase; // 医嘱或病例

    private Patients patient; // 关联的患者信息
}