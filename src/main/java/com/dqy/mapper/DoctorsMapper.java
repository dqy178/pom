package com.dqy.mapper;

import com.dqy.pojo.Doctors;
import com.dqy.vo.DoctorSearchVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author 杜青云
 * Date  2025/7/9 下午3:24
 */
public interface DoctorsMapper {
    void addDoctor(Doctors doctors);
    Doctors selectDoctor(String jobNumber);
    void delDoctor(Integer doctorId);
    List<Doctors> selectDoctorAll(DoctorSearchVo searchVo);
    Doctors selectDoctorByname(String username);
    Doctors selectDoctorByid(int userid);
    void EditInfoByid(@Param("id") int id,
                             @Param("phone") String phone,
                             @Param("email") String email,
                             @Param("introduction") String introduction);
    void updatePasswdById(@Param("id") int userid,@Param("passwd") String firstpasswd);
}
