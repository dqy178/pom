package com.dqy.service;

import com.dqy.pojo.Schedule;
import com.github.pagehelper.PageInfo;

import java.util.Date;
import java.util.List;

/**
 * @author 杜青云
 * Date  2025/7/16 下午2:12
 */
public interface ScheduleService {
    PageInfo<Schedule> getScheduleList(Integer departmentId, Date date,Integer pageNum, Integer pageSize);
    void addSchedule(Schedule schedule);
    void updateSchedule(Schedule schedule);
    void deleteSchedule(Integer scheduleId);
    Schedule getScheduleById(Integer scheduleId);
}
