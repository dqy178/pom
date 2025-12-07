package com.dqy.service.Impl;

import com.dqy.mapper.DepartmentsMapper;
import com.dqy.mapper.DepartmentsMapper;
import com.dqy.pojo.Departments;
import com.dqy.service.DepartmentsService;
import com.dqy.util.SqlSessionUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import java.util.Collections;
import java.util.List;

/**
 * @author 杜青云
 * Date  2025/7/8 下午3:52
 */
public class DepartmentsServiceImpl implements DepartmentsService {
    @Override
    public PageInfo<Departments> getDepartments(Integer pageNum, Integer pageSize) {
        try {
            //创建DepartmentsMapper对象
            DepartmentsMapper mapper = SqlSessionUtil.getMapper(DepartmentsMapper.class);
            //调用PageHelper.setStart()设置页码
            PageHelper.startPage(pageNum, pageSize);
            List<Departments> departmentsList = mapper.selectDepartmentsByLevel(1);
            PageInfo<Departments> pageInfo = new PageInfo<>(departmentsList);
            return pageInfo;
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            SqlSessionUtil.closeSession();

        }
    }

    @Override
    public void addDepartment(Departments departments) {
        try {
//            获取mapper对象
            DepartmentsMapper mapper = SqlSessionUtil.getMapper(DepartmentsMapper.class);
//            添加调用方法
            mapper.addDepartment(departments);
//            判断是否有父科室，有则获取父科室信息
            Departments parentDepartment = null;
            if(departments.getDepartmentPid()!= 0){
                parentDepartment = mapper.selectById(departments.getDepartmentPid());
            }
//            修改当前科室的path
//            设置path
            String path = (parentDepartment!=null?parentDepartment.getDepartmentPath():"") + "|" + departments.getDepartmentId()+"|";
            mapper.changePath(path, departments.getDepartmentId());
            SqlSessionUtil.commit();
        } catch (Exception e) {
            SqlSessionUtil.rollback();
            throw new RuntimeException(e);
        } finally {  //关闭SqlSession
            SqlSessionUtil.closeSession();
        }
    }

    @Override
    public List<Departments> getDepartmentsBySecond() {
        try{
            //获取mapper对象
            DepartmentsMapper mapper = SqlSessionUtil.getMapper(DepartmentsMapper.class);
            //调用根据等级查询的方法
            List<Departments> departmentsList = mapper.selectDepartmentsByLevel(2);
            //返回查询结果
            return departmentsList;
        }catch (Exception e){
            throw new RuntimeException(e);
        }finally {
            SqlSessionUtil.closeSession();
        }
    }

    @Override
    public List<Departments> getDepartmentAll() {
        try {
            //1 创建mapper对象
            DepartmentsMapper mapper = SqlSessionUtil.getMapper(DepartmentsMapper.class);
            //2 调用mapper中查询一级科室的方法
            List<Departments> departmentsList = mapper.selectDepartmentsByLevel(1);
            //3 遍历所有一级科室信息,查询对应的二级科室的信息
            for (Departments departments : departmentsList) {
                //查询对应的二级科室的信息
                List<Departments> childList = mapper.selectByPid(departments.getDepartmentId());
                //把二级科室的集合赋值给一级科室对象中的子科室集合
                departments.setChildList(childList);
            }
            return  departmentsList;
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            SqlSessionUtil.closeSession();
        }
    }

    @Override
    public void delDepartment(Integer departmentId) {
        try {
            //获取mapper对象
            DepartmentsMapper mapper = SqlSessionUtil.getMapper(DepartmentsMapper.class);
            //调用删除方法
            mapper.delDepartment(departmentId);
            //提交事务
            SqlSessionUtil.commit();
        } catch (Exception e) {
            //事物回滚
            SqlSessionUtil.rollback();
            throw new RuntimeException(e);
        } finally {
            //在finally部分，释放资源
            SqlSessionUtil.closeSession();
        }
    }
}
