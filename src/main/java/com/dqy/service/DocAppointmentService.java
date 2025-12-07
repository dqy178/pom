package com.dqy.service;

import com.dqy.pojo.Appointments;
import com.dqy.pojo.Consultation;
import com.dqy.pojo.Hospitalization;
import com.dqy.pojo.Patients;
import com.dqy.vo.AppointmentSearchVO;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * @author 付鑫喆
 * Date 2025/7/17 22:16
 */
public interface DocAppointmentService {
    // 分页获取预约记录，带患者姓名，支持多条件查询（doctorId、startDate、endDate）
    PageInfo<Appointments> getAppointmentsWithPatientInfo(AppointmentSearchVO searchVO, int pageNum, int pageSize);

    // 通过 patient_id 获取患者信息
    Patients findPatientById(Integer patientId);

    // 更新指定预约记录的状态为 completed
    int updateAppointmentStatusToCompleted(Integer appointmentId);

    int insertHospitalization(Hospitalization hospitalization);
    int insertConsultation(Consultation consultation);
    // 通过 appointment_id 获取 doctor_id 和 patient_id
    Appointments findDoctorAndPatientByAppointmentId(Integer appointmentId);
}