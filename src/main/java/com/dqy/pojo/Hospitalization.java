package com.dqy.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.math.BigDecimal;
@Data@AllArgsConstructor@NoArgsConstructor
public class Hospitalization {
    private Integer id;
    private Integer userId;
    private Integer doctorId;
    private Date admissionTime;
    private Date dischargeTime;
    private String roomNo;
    private BigDecimal totalAmount;
    private String status;
    private Date createTime;

    private Integer hospitalizationId;
    private Integer patientId;
    private String roomNumber;
    private BigDecimal cost;
    private Status paymentStatus;
    private Boolean isInsured;
    private Status hospitalizationStatus;
    private Patients patient;
    public enum Status {
        paid, unpaid, partially_paid, admitted, discharged, in_progress
    }

} 