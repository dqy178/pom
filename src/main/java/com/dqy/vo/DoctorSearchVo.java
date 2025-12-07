package com.dqy.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author 杜青云
 * Date  2025/7/9 下午3:35
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class DoctorSearchVo {
    //科室ID，职称ID，医生姓名，工号
    private Integer departmentId;
    private Integer titleId;
    private String doctorName;
    private String jobNumber;

}
