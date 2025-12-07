package com.dqy.mapper;

import com.dqy.pojo.Schedule;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface ScheduleMapper {
    List<Schedule> selectScheduleList(@Param("departmentId") Integer departmentId, @Param("date") Date date);
    void addSchedule(Schedule schedule);
    void updateSchedule(Schedule schedule);
    void deleteSchedule(Integer scheduleId);
    Schedule getScheduleById(Integer scheduleId);
}
