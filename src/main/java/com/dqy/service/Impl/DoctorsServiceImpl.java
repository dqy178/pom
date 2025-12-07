package com.dqy.service.Impl;

import com.dqy.mapper.DoctorScheduleMapper;
import com.dqy.mapper.DoctorsMapper;
import com.dqy.pojo.DoctorSchedule;
import com.dqy.pojo.Doctors;
import com.dqy.service.DoctorsService;
import com.dqy.util.SqlSessionUtil;
import com.dqy.vo.DoctorSearchVo;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

/**
 * @author 杜青云
 * Date  2025/7/9 下午4:08
 */
public class DoctorsServiceImpl implements DoctorsService {
    @Override
    public Doctors selectDoctor(String jobNumber) {
        try {
            //获取mapper对象
            DoctorsMapper mapper = SqlSessionUtil.getMapper(DoctorsMapper.class);
            //调用查询方法
            Doctors doctors = mapper.selectDoctor(jobNumber);
            //返回查询结果
            return doctors;
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            SqlSessionUtil.closeSession();
        }
    }

    @Override
    public PageInfo<Doctors> getDoctorsByPageAndSearch(DoctorSearchVo searchVo, Integer pageNum, Integer pageSize) {
        try {
            //获取mapper对象
            DoctorsMapper mapper = SqlSessionUtil.getMapper(DoctorsMapper.class);
            //使用PageHelper设置页码
            PageHelper.startPage(pageNum, pageSize);
            //调用mapper中的查询方法
            List<Doctors> doctorsList = mapper.selectDoctorAll(searchVo);
            //创建PageInfo对象
            PageInfo<Doctors> pageInfo = new PageInfo<>(doctorsList);
            //返回PageInfo对象
            return pageInfo;
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            SqlSessionUtil.closeSession();
        }
    }

    @Override
    public void addDoctor(Doctors doctors) {
        try {
//            获取mapper对象
            DoctorsMapper mapper = SqlSessionUtil.getMapper(DoctorsMapper.class);
//            添加调用方法
            mapper.addDoctor(doctors);
            //提交事务
            SqlSessionUtil.commit();
        } catch (Exception e) {
            SqlSessionUtil.rollback();
            throw new RuntimeException(e);
        } finally {  //关闭SqlSession
            SqlSessionUtil.closeSession();
        }
    }

    @Override
    public void delDoctor(Integer doctorId) {
        try {
            //获取mapper对象
            DoctorsMapper mapper = SqlSessionUtil.getMapper(DoctorsMapper.class);
            //调用删除方法
            mapper.delDoctor(doctorId);
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
    @Override
    public Doctors login(String username, String password) {
        try {
//        创建DoctorsMapper对象
            DoctorsMapper mapper = SqlSessionUtil.getMapper(DoctorsMapper.class);
//        调用查询方法
            Doctors doctors = mapper.selectDoctorByname(username);
//        如果查询的Admins对象不为空，则判断密码是否正确，如果正确，返回Admins对象，否则返回null
            if (doctors!= null && doctors.getPassword().equals(password)) {
                return doctors;
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            SqlSessionUtil.closeSession();
        }
        return null;
    }



    @Override
    public Doctors findByid(int userid) {
        try {
            DoctorsMapper mapper = SqlSessionUtil.getMapper(DoctorsMapper.class);
            Doctors doctors = mapper.selectDoctorByid(userid);
            if (doctors!= null && doctors.getDoctorId() == userid) {
                return doctors;
            }
        }catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            SqlSessionUtil.closeSession();
        }
        return null;
    }

    @Override
    public void editInfoByid(int userid, String phone, String email, String introduction) {
        try {
            SqlSession sqlSession = SqlSessionUtil.getSession();
            DoctorsMapper mapper = SqlSessionUtil.getMapper(DoctorsMapper.class);
            mapper.EditInfoByid(userid,phone,email,introduction);
            sqlSession.commit();
        }catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            SqlSessionUtil.closeSession();
        }
    }

    @Override
    public void updatePasswdById(int userid, String firstpasswd) {
        try {
            SqlSession sqlSession = SqlSessionUtil.getSession();
            DoctorsMapper mapper = sqlSession.getMapper(DoctorsMapper.class);
            mapper.updatePasswdById(userid, firstpasswd);
            sqlSession.commit();
        }catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            SqlSessionUtil.closeSession();
        }
    }

    @Override
    public PageInfo findSchduleByid(int doctorid, int i, int j) {
        SqlSession sqlSession = SqlSessionUtil.getSession();
        DoctorScheduleMapper mapper = sqlSession.getMapper(DoctorScheduleMapper.class);
        PageHelper.startPage(i, j);
        List<DoctorSchedule> list = mapper.selectAllScheduleByDocId(doctorid);
        return new PageInfo(list);
    }

}