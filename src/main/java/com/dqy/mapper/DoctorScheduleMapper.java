package com.dqy.mapper;

import com.dqy.pojo.DoctorSchedule;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DoctorScheduleMapper {
    List<DoctorSchedule> selectAllScheduleByDocId(@Param("id") int id);
}
