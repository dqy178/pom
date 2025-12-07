package com.dqy.service.Impl;

import com.dqy.mapper.PrescriptionMapper;
import com.dqy.pojo.Prescription;
import com.dqy.service.PrescriptionService;
import com.dqy.util.SqlSessionUtil;
import org.apache.ibatis.session.SqlSession;
import java.util.List;

public class PrescriptionServiceImpl implements PrescriptionService {
    @Override
    public boolean addPrescription(Prescription prescription) {
        SqlSession session = SqlSessionUtil.getSession();
        PrescriptionMapper mapper = session.getMapper(PrescriptionMapper.class);
        int res = mapper.insertPrescription(prescription);
        session.commit();
        session.close();
        return res > 0;
    }

    @Override
    public List<Prescription> getPrescriptionsByUserId(Integer userId) {
        SqlSession session = SqlSessionUtil.getSession();
        PrescriptionMapper mapper = session.getMapper(PrescriptionMapper.class);
        List<Prescription> list = mapper.selectByUserId(userId);
        session.close();
        return list;
    }

    @Override
    public Prescription getPrescriptionById(Integer id) {
        SqlSession session = SqlSessionUtil.getSession();
        PrescriptionMapper mapper = session.getMapper(PrescriptionMapper.class);
        Prescription prescription = mapper.selectById(id);
        session.close();
        return prescription;
    }

    @Override
    public boolean updatePrescription(Prescription prescription) {
        SqlSession session = SqlSessionUtil.getSession();
        PrescriptionMapper mapper = session.getMapper(PrescriptionMapper.class);
        int res = mapper.updatePrescription(prescription);
        session.commit();
        session.close();
        return res > 0;
    }

    @Override
    public boolean deletePrescription(Integer id) {
        SqlSession session = SqlSessionUtil.getSession();
        PrescriptionMapper mapper = session.getMapper(PrescriptionMapper.class);
        int res = mapper.deletePrescription(id);
        session.commit();
        session.close();
        return res > 0;
    }

    @Override
    public List<Prescription> getAllPrescriptions() {
        SqlSession session = SqlSessionUtil.getSession();
        PrescriptionMapper mapper = session.getMapper(PrescriptionMapper.class);
        List<Prescription> list = mapper.selectAll();
        session.close();
        return list;
    }
    
    @Override
    public boolean updatePrescriptionStatus(Integer id, String status) {
        SqlSession session = SqlSessionUtil.getSession();
        PrescriptionMapper mapper = session.getMapper(PrescriptionMapper.class);
        int res = mapper.updatePrescriptionStatus(id, status);
        session.commit();
        session.close();
        return res > 0;
    }
} 