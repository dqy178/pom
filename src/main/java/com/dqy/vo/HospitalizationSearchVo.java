package com.dqy.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author 杜青云
 * Date  2025/7/18 上午2:42
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class HospitalizationSearchVo {
    private Integer paymentStatus;
    private Integer patientId;
    private String patientName;
}
