package com.dqy.service.Impl;

import com.dqy.mapper.AppointmentMapper;
import com.dqy.pojo.Appointment;
import com.dqy.service.AppointmentService;
import com.dqy.util.SqlSessionUtil;
import org.apache.ibatis.session.SqlSession;
import java.util.List;

public class AppointmentServiceImpl implements AppointmentService {
    @Override
    public boolean addAppointment(Appointment appointment) {
        SqlSession session = SqlSessionUtil.getSession();
        AppointmentMapper mapper = session.getMapper(AppointmentMapper.class);
        int res = mapper.insertAppointment(appointment);
        session.commit();
        session.close();
        return res > 0;
    }

    @Override
    public List<Appointment> getAppointmentsByUserId(Integer userId) {
        SqlSession session = SqlSessionUtil.getSession();
        AppointmentMapper mapper = session.getMapper(AppointmentMapper.class);
        List<Appointment> list = mapper.selectByUserId(userId);
        session.close();
        return list;
    }

    @Override
    public Appointment getAppointmentById(Integer id) {
        SqlSession session = SqlSessionUtil.getSession();
        AppointmentMapper mapper = session.getMapper(AppointmentMapper.class);
        Appointment appointment = mapper.selectById(id);
        session.close();
        return appointment;
    }

    @Override
    public boolean updateAppointment(Appointment appointment) {
        SqlSession session = SqlSessionUtil.getSession();
        AppointmentMapper mapper = session.getMapper(AppointmentMapper.class);
        int res = mapper.updateAppointment(appointment);
        session.commit();
        session.close();
        return res > 0;
    }

    @Override
    public boolean deleteAppointment(Integer id) {
        SqlSession session = SqlSessionUtil.getSession();
        AppointmentMapper mapper = session.getMapper(AppointmentMapper.class);
        int res = mapper.deleteAppointment(id);
        session.commit();
        session.close();
        return res > 0;
    }

    @Override
    public List<Appointment> getAllAppointments() {
        SqlSession session = SqlSessionUtil.getSession();
        AppointmentMapper mapper = session.getMapper(AppointmentMapper.class);
        List<Appointment> list = mapper.selectAll();
        session.close();
        return list;
    }
} 