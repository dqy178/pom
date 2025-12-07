package com.dqy.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @author 杜青云
 * Date  2025/7/8 下午3:05
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Departments {
    private Integer departmentId;
    private String departmentName;
    private Integer departmentPid;
    private Integer departmentLevel;
    private String departmentPath;//科室路径
    private String departmentDescription;

    private List<Departments> childList;
}
