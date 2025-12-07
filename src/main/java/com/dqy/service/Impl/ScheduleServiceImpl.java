package com.dqy.service.Impl;

import com.dqy.mapper.DepartmentsMapper;
import com.dqy.mapper.ScheduleMapper;
import com.dqy.pojo.Departments;
import com.dqy.pojo.Schedule;
import com.dqy.service.ScheduleService;
import com.dqy.util.SqlSessionUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import java.util.Date;
import java.util.List;

public class ScheduleServiceImpl implements ScheduleService {
    @Override
    public PageInfo<Schedule> getScheduleList(Integer departmentId, Date date, Integer pageNum, Integer pageSize) {
        try {
            ScheduleMapper mapper = SqlSessionUtil.getMapper(ScheduleMapper.class);
            PageHelper.startPage(pageNum, pageSize);
            List<Schedule> list = mapper.selectScheduleList(departmentId, date);
            return new PageInfo<>(list);
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            SqlSessionUtil.closeSession();
        }
    }

    @Override
    public void addSchedule(Schedule schedule) {
        try {
            ScheduleMapper mapper = SqlSessionUtil.getMapper(ScheduleMapper.class);
            mapper.addSchedule(schedule);
            SqlSessionUtil.commit();
        } catch (Exception e) {
            SqlSessionUtil.rollback();
            throw new RuntimeException(e);
        } finally {
            SqlSessionUtil.closeSession();
        }
    }

    @Override
    public void updateSchedule(Schedule schedule) {
        try {
            ScheduleMapper mapper = SqlSessionUtil.getMapper(ScheduleMapper.class);
            mapper.updateSchedule(schedule);
            SqlSessionUtil.commit();
        } catch (Exception e) {
            SqlSessionUtil.rollback();
            throw new RuntimeException(e);
        } finally {
            SqlSessionUtil.closeSession();
        }
    }

    @Override
    public void deleteSchedule(Integer scheduleId) {
        try {
            ScheduleMapper mapper = SqlSessionUtil.getMapper(ScheduleMapper.class);
            mapper.deleteSchedule(scheduleId);
            SqlSessionUtil.commit();
        } catch (Exception e) {
            SqlSessionUtil.rollback();
            throw new RuntimeException(e);
        } finally {
            SqlSessionUtil.closeSession();
        }
    }

    @Override
    public Schedule getScheduleById(Integer scheduleId) {
        try {
            ScheduleMapper mapper = SqlSessionUtil.getMapper(ScheduleMapper.class);
            return mapper.getScheduleById(scheduleId);
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            SqlSessionUtil.closeSession();
        }
    }


} 