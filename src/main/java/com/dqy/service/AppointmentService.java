package com.dqy.service;

import com.dqy.pojo.Appointment;
import java.util.List;

public interface AppointmentService {
    boolean addAppointment(Appointment appointment);
    List<Appointment> getAppointmentsByUserId(Integer userId);
    Appointment getAppointmentById(Integer id);
    boolean updateAppointment(Appointment appointment);
    boolean deleteAppointment(Integer id);
    List<Appointment> getAllAppointments();
} 