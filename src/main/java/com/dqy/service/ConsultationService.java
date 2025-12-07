package com.dqy.service;

import com.dqy.pojo.Consultation;
import com.dqy.vo.ConsultationSearchVO;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;

/**
 * @author 付鑫喆
 * Date 2025/7/18 7:41
 */
public interface ConsultationService {
    // 分页获取预约记录，带患者姓名，支持多条件查询（doctorId、startDate、endDate）
    PageInfo<Consultation> getConsultationsWithPatientInfo(@Param("searchVO") ConsultationSearchVO searchVO,@Param("pagenum") int pageNum,@Param("pagesize") int pageSize);
}
