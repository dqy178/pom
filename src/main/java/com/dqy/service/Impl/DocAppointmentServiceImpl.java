package com.dqy.service.Impl;

import com.dqy.mapper.DocAppointmentMapper;
import com.dqy.pojo.Appointments;
import com.dqy.pojo.Consultation;
import com.dqy.pojo.Hospitalization;
import com.dqy.pojo.Patients;
import com.dqy.service.DocAppointmentService;
import com.dqy.util.SqlSessionUtil;
import com.dqy.vo.AppointmentSearchVO;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.session.SqlSession;

import java.util.Collections;
import java.util.List;

/**
 * @author 付鑫喆
 * Date 2025/7/17 22:16
 */
public class DocAppointmentServiceImpl implements DocAppointmentService {
    @Override
    public PageInfo<Appointments> getAppointmentsWithPatientInfo(AppointmentSearchVO searchVO, int pageNum, int pageSize) {
        SqlSession sqlSession = null;
        PageInfo<Appointments> pageInfo = null;
        try {
            // 获取 SqlSession 并创建 Mapper 对象
            DocAppointmentMapper docAppointmentMapper = SqlSessionUtil.getMapper(DocAppointmentMapper.class);

            // 设置分页参数
            PageHelper.startPage(pageNum, pageSize);
            // 调用 Mapper 查询
            List<Appointments> appointments = docAppointmentMapper.findAppointmentsWithPatientInfoByDoctorId(searchVO);
            // 封装分页结果
            pageInfo = new PageInfo<>(appointments);
            return pageInfo;
        } catch (Exception e) {
            // 捕获异常，记录日志或抛出自定义异常
            throw new RuntimeException("Failed to fetch appointments with patient info: " + e.getMessage(), e);
        } finally {
            // 释放 SqlSession 资源
            SqlSessionUtil.closeSession();
        }
    }

    @Override
    public Patients findPatientById(Integer patientId) {
        SqlSession sqlSession = null;
        try {
            sqlSession = SqlSessionUtil.getSqlSession(true);
            DocAppointmentMapper docAppointmentMapper = sqlSession.getMapper(DocAppointmentMapper.class);
            Patients patient = docAppointmentMapper.findPatientById(patientId);
            System.out.println("Found patient for patientId " + patientId + ": " + patient);
            return patient;
        } catch (Exception e) {
            throw new RuntimeException("Failed to find patient: " + e.getMessage(), e);
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
    }



    @Override
    public int updateAppointmentStatusToCompleted(Integer appointmentId) {
        SqlSession sqlSession = null;
        try {
            sqlSession = SqlSessionUtil.getSqlSession(true); // 开启自动提交
            DocAppointmentMapper docAppointmentMapper = sqlSession.getMapper(DocAppointmentMapper.class);
            int rows = docAppointmentMapper.updateAppointmentStatusToCompleted(appointmentId);
            System.out.println("Rows updated for appointmentId " + appointmentId + ": " + rows);
            return rows;
        } catch (Exception e) {
            throw new RuntimeException("Failed to update appointment status: " + e.getMessage(), e);
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
    }

    @Override
    public int insertHospitalization(Hospitalization hospitalization) {
        SqlSession sqlSession = null;
        try {
            sqlSession = SqlSessionUtil.getSqlSession(true);
            DocAppointmentMapper docAppointmentMapper = sqlSession.getMapper(DocAppointmentMapper.class);
            int rows = docAppointmentMapper.insertHospitalization(hospitalization);
            System.out.println("Rows inserted for hospitalization: " + rows);
            return rows;
        } catch (Exception e) {
            throw new RuntimeException("Failed to insert hospitalization: " + e.getMessage(), e);
        } finally {
            if (sqlSession != null) {
                sqlSession.close(); // 直接关闭会话
            }
        }
    }

    @Override
    public int insertConsultation(Consultation consultation) {
        SqlSession sqlSession = null;
        try {
            sqlSession = SqlSessionUtil.getSqlSession(true);
            DocAppointmentMapper docAppointmentMapper = sqlSession.getMapper(DocAppointmentMapper.class);
            int rows = docAppointmentMapper.insertConsultation(consultation);
            System.out.println("Rows inserted for consultation: " + rows);
            return rows;
        } catch (Exception e) {
            throw new RuntimeException("Failed to insert consultation: " + e.getMessage(), e);
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
    }

    @Override
    public Appointments findDoctorAndPatientByAppointmentId(Integer appointmentId) {
        SqlSession sqlSession = null;
        try {
            sqlSession = SqlSessionUtil.getSqlSession(true);
            DocAppointmentMapper docAppointmentMapper = sqlSession.getMapper(DocAppointmentMapper.class);
            Appointments appointment = docAppointmentMapper.findDoctorAndPatientByAppointmentId(appointmentId);
            System.out.println("Found appointment for appointmentId " + appointmentId + ": " + appointment);
            return appointment;
        } catch (Exception e) {
            throw new RuntimeException("Failed to find doctor and patient by appointmentId: " + e.getMessage(), e);
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
    }
}