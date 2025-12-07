package com.dqy.service;

import com.dqy.pojo.Departments;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * @author 杜青云
 * Date  2025/7/8 下午3:50
 */
public interface DepartmentsService {
    PageInfo<Departments> getDepartments(Integer pageNum, Integer pageSize);
    void addDepartment(Departments departments);
    List<Departments> getDepartmentsBySecond();
    List<Departments> getDepartmentAll();
    void delDepartment(Integer departmentId);
}
