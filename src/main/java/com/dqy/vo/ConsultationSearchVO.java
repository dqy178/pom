package com.dqy.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
*@author 付鑫喆
*Date 2025/7/18 7:28
*/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ConsultationSearchVO {
    private Date startDate;
    private Date endDate;
    private Integer doctorId;
}
