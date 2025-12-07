package com.dqy.mapper;

import com.dqy.pojo.Consultation;
import com.dqy.vo.ConsultationSearchVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author 付鑫喆
 * Date 2025/7/18 7:24
 */
public interface ConsultationMapper {
    List<Consultation> findConsultationsWithPatientInfoByConditions(@Param("vo") ConsultationSearchVO vo);
}
