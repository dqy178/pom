package com.dqy.mapper;

import com.dqy.pojo.Appointment;
import java.util.List;

public interface AppointmentMapper {
    int insertAppointment(Appointment appointment);
    List<Appointment> selectByUserId(Integer userId);
    Appointment selectById(Integer id);
    int updateAppointment(Appointment appointment);
    int deleteAppointment(Integer id);
    List<Appointment> selectAll();
} 