package com.dqy.service.Impl;

import com.dqy.mapper.ConsultationMapper;
import com.dqy.pojo.Consultation;
import com.dqy.service.ConsultationService;
import com.dqy.util.SqlSessionUtil;
import com.dqy.vo.ConsultationSearchVO;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.session.SqlSession;

import java.util.List;


public class ConsulationServiceImpl implements ConsultationService {

    @Override
    public PageInfo<Consultation> getConsultationsWithPatientInfo(ConsultationSearchVO searchVO, int pageNum, int pageSize) {
        SqlSession sqlSession = SqlSessionUtil.getSession();
        PageInfo<Consultation> pageInfo = null;
        try {
            // 获取 SqlSession 并创建 Mapper 对象
            ConsultationMapper consultationMapper = SqlSessionUtil.getMapper(ConsultationMapper.class);

            // 设置分页参数
            PageHelper.startPage(pageNum, pageSize);
            // 调用 Mapper 查询
            List<Consultation> appointments = consultationMapper.findConsultationsWithPatientInfoByConditions(searchVO);
            // 封装分页结果
            pageInfo = new PageInfo<>(appointments);
            return pageInfo;
        } catch (Exception e) {
            // 捕获异常，记录日志或抛出自定义异常
            throw new RuntimeException("Failed to fetch appointments with patient info: " + e.getMessage(), e);
        } finally {
            // 释放 SqlSession 资源
            SqlSessionUtil.closeSession();
        }
    }
}
