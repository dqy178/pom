package com.dqy.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class DoctorSchedule {
    private int scheduleId;
    private int doctorId;
    private Date date;
    private String shiftTime;
    private int departmentId;
    private int isAvailable;
    private int visitCount;
    private int sumCount;
}
