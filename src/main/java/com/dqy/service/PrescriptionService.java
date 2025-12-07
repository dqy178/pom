package com.dqy.service;

import com.dqy.pojo.Prescription;
import java.util.List;

public interface PrescriptionService {
    boolean addPrescription(Prescription prescription);
    List<Prescription> getPrescriptionsByUserId(Integer userId);
    Prescription getPrescriptionById(Integer id);
    boolean updatePrescription(Prescription prescription);
    boolean deletePrescription(Integer id);
    List<Prescription> getAllPrescriptions();
    boolean updatePrescriptionStatus(Integer id, String status);
} 