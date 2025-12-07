package com.dqy.service.Impl;

import com.dqy.mapper.HospitalizationMapper;
import com.dqy.pojo.Hospitalization;
import com.dqy.service.HospitalizationService;
import com.dqy.util.SqlSessionUtil;
import org.apache.ibatis.session.SqlSession;
import java.util.List;

public class HospitalizationServiceImpl implements HospitalizationService {
    @Override
    public boolean addHospitalization(Hospitalization hospitalization) {
        SqlSession session = SqlSessionUtil.getSession();
        HospitalizationMapper mapper = session.getMapper(HospitalizationMapper.class);
        int res = mapper.insertHospitalization(hospitalization);
        session.commit();
        session.close();
        return res > 0;
    }

    @Override
    public List<Hospitalization> getHospitalizationsByUserId(Integer userId) {
        SqlSession session = SqlSessionUtil.getSession();
        HospitalizationMapper mapper = session.getMapper(HospitalizationMapper.class);
        List<Hospitalization> list = mapper.selectByUserId(userId);
        session.close();
        return list;
    }

    @Override
    public Hospitalization getHospitalizationById(Integer id) {
        SqlSession session = SqlSessionUtil.getSession();
        HospitalizationMapper mapper = session.getMapper(HospitalizationMapper.class);
        Hospitalization hospitalization = mapper.selectById(id);
        session.close();
        return hospitalization;
    }

    @Override
    public boolean updateHospitalization(Hospitalization hospitalization) {
        SqlSession session = SqlSessionUtil.getSession();
        HospitalizationMapper mapper = session.getMapper(HospitalizationMapper.class);
        int res = mapper.updateHospitalization(hospitalization);
        session.commit();
        session.close();
        return res > 0;
    }

    @Override
    public boolean deleteHospitalization(Integer id) {
        SqlSession session = SqlSessionUtil.getSession();
        HospitalizationMapper mapper = session.getMapper(HospitalizationMapper.class);
        int res = mapper.deleteHospitalization(id);
        session.commit();
        session.close();
        return res > 0;
    }

    @Override
    public List<Hospitalization> getAllHospitalizations() {
        SqlSession session = SqlSessionUtil.getSession();
        HospitalizationMapper mapper = session.getMapper(HospitalizationMapper.class);
        List<Hospitalization> list = mapper.selectAll();
        session.close();
        return list;
    }
    
    @Override
    public boolean updateHospitalizationStatus(Integer id, String status) {
        SqlSession session = SqlSessionUtil.getSession();
        HospitalizationMapper mapper = session.getMapper(HospitalizationMapper.class);
        int res = mapper.updateHospitalizationStatus(id, status);
        session.commit();
        session.close();
        return res > 0;
    }
} 