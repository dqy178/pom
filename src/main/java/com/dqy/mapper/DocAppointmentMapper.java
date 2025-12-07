package com.dqy.mapper;

import com.dqy.pojo.Appointments;
import com.dqy.pojo.Consultation;
import com.dqy.pojo.Hospitalization;
import com.dqy.pojo.Patients;
import com.dqy.vo.AppointmentSearchVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 * @author 付鑫喆
 * Date 2025/7/17 22:16
 */
public interface DocAppointmentMapper {
    // 查询指定医生的预约记录，带患者姓名
    List<Appointments> findAppointmentsWithPatientInfoByDoctorId(@Param("vo") AppointmentSearchVO vo);

    // 更新指定预约记录的状态为 completed
    int updateAppointmentStatusToCompleted(@Param("appointmentId") Integer appointmentId);

    // 通过 patient_id 查询预约记录，带患者姓名和身份证号
    Patients findPatientById(@Param("patientId") Integer patientId);
    int insertHospitalization(Hospitalization hospitalization);
    int insertConsultation(Consultation consultation);
    Appointments findDoctorAndPatientByAppointmentId(Integer appointmentId);
}