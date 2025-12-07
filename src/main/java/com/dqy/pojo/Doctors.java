package com.dqy.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @author 杜青云
 * Date  2025/7/9 下午3:17
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Doctors {
    //doctor_id
    private Integer doctorId;
    //job_number
    private String jobNumber;
    //password
    private String password;
    //name
    private String name;
    //avatar //头像路径和名称
    private String avatar;
    //phone
    private String phone;
    //email
    private String email;
    //introduction
    private String introduction;
    //registration_fee
    private Double registrationFee;
    //entry_date
    private Date entryDate;
    //department_id
    private Integer departmentId;
    //professional_title_id
    private Integer professionalTitleId;
    //state
    private Integer state;

    private Departments departments;
    private Titles titles;
}
