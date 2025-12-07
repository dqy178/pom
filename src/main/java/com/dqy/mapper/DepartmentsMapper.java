package com.dqy.mapper;

import com.dqy.pojo.Departments;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author 杜青云
 * Date  2025/7/8 下午3:08
 */
public interface DepartmentsMapper {
    List<Departments> selectDepartmentsByLevel(Integer departmentLevel);
    List<Departments> selectByPid(Integer Pid);
    //添加新科室
    void addDepartment(Departments departments);
//    修改指定科室的路径
    void changePath(@Param("departmentPath") String departmentPath, @Param("departmentId") Integer departmentId);
    Departments selectById(Integer departmentId);
    void delDepartment(Integer departmentId);
}
