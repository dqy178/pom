package com.dqy.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

/**
 * @author 付鑫喆
 * Date 2025/7/17 22:16
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Patients {
    private Integer patientId;
    private String idCardNumber; // 身份证号
    private String password; // 密码
    private String pname; // 患者姓名，规范化字段名
    private String avatar; // 头像
    private String phone; // 联系电话
    private String email; // 邮箱
    private BigDecimal balance; // 余额，映射数据库 DECIMAL 类型
}