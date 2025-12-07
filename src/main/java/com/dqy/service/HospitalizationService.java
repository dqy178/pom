package com.dqy.service;

import com.dqy.pojo.Hospitalization;
import java.util.List;

public interface HospitalizationService {
    boolean addHospitalization(Hospitalization hospitalization);
    List<Hospitalization> getHospitalizationsByUserId(Integer userId);
    Hospitalization getHospitalizationById(Integer id);
    boolean updateHospitalization(Hospitalization hospitalization);
    boolean deleteHospitalization(Integer id);
    List<Hospitalization> getAllHospitalizations();
    boolean updateHospitalizationStatus(Integer id, String status);
} 