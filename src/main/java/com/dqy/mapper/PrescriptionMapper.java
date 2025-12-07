package com.dqy.mapper;

import com.dqy.pojo.Prescription;
import java.util.List;

public interface PrescriptionMapper {
    int insertPrescription(Prescription prescription);
    List<Prescription> selectByUserId(Integer userId);
    Prescription selectById(Integer id);
    int updatePrescription(Prescription prescription);
    int deletePrescription(Integer id);
    List<Prescription> selectAll();
    int updatePrescriptionStatus(Integer id, String status);
} 