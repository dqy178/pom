package com.dqy.mapper;

import com.dqy.pojo.Departments;
import com.dqy.util.SqlSessionUtil;
import org.junit.Test;

import java.util.List;

/**
 * @author 杜青云
 * Date  2025/7/8 下午3:12
 */
public class DepartmentsMapperTest {
    @Test
    public void getDepartments() {
        DepartmentsMapper mapper = SqlSessionUtil.getMapper(DepartmentsMapper.class);
        List<Departments> departments = mapper.selectDepartmentsByLevel(1);
        for (Departments department : departments) {
            System.out.println(department);
            }
    }

    @Test  //添加并修改路径
    public void addDepartment() {
//        获取mapper对象
        DepartmentsMapper mapper = SqlSessionUtil.getMapper(DepartmentsMapper.class);
//        调用添加方法
        Departments departments = new Departments();
        departments.setDepartmentName("测试7-9-2");
        departments.setDepartmentPid(47);
        departments.setDepartmentLevel(2);
        departments.setDepartmentDescription("7-9-2测试科室");
        System.out.println("添加前的科室信息" + departments);
        mapper.addDepartment(departments);
        System.out.println("添加后的科室信息-->" + departments);

//        判断pid值不为0
        Departments depart = null;
        if (departments.getDepartmentPid() != 0) {
//            查询PID对应的科室信息
            depart = mapper.selectById(departments.getDepartmentPid());
        }
//        调用修改方法
//        设置当前科室的路径=父科室的路径+"|"+当前科室ID+"|"
        String departmentPath = (depart!= null ? depart.getDepartmentPath() : "") +"|" + departments.getDepartmentId()+"|";
        mapper.changePath(departmentPath, departments.getDepartmentId());
        SqlSessionUtil.commit();
        SqlSessionUtil.closeSession();

    }


}
