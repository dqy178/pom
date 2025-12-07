package com.dqy.mapper;

import com.dqy.pojo.Hospitalization;
import java.util.List;

public interface HospitalizationMapper {
    int insertHospitalization(Hospitalization hospitalization);
    List<Hospitalization> selectByUserId(Integer userId);
    Hospitalization selectById(Integer id);
    int updateHospitalization(Hospitalization hospitalization);
    int deleteHospitalization(Integer id);
    List<Hospitalization> selectAll();
    int updateHospitalizationStatus(Integer id, String status);
} 