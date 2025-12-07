package com.dqy.service;

import com.dqy.pojo.Doctors;
import com.dqy.vo.DoctorSearchVo;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;

/**
 * @author 杜青云
 * Date  2025/7/9 下午4:06
 */
public interface DoctorsService {
    Doctors selectDoctor(String jobNumber);
    PageInfo<Doctors> getDoctorsByPageAndSearch(DoctorSearchVo searchVo, Integer pageNum, Integer pageSize);
    void addDoctor(Doctors doctor);
    void delDoctor(Integer doctorId);
            Doctors login(String username, String password);
    Doctors findByid(int userid);
    void editInfoByid(@Param("doctorId") int userid,
                      @Param("phone") String phone,
                      @Param("email") String email,
                      @Param("introduction") String introduction);
    void updatePasswdById(@Param("doctorId") int userid,@Param("firstpasswd") String firstpasswd);
    PageInfo findSchduleByid(@Param("id") int doctorid,@Param("i") int i,@Param("j") int j);
}
