package com.dqy.mapper;

import com.dqy.pojo.Doctors;
import com.dqy.util.SqlSessionUtil;
import com.dqy.vo.DoctorSearchVo;
import org.junit.Test;

import java.util.List;

/**
 * @author 杜青云
 * Date  2025/7/9 下午3:43
 */
public class DoctorsMapperTest {
    @Test
    public void selectDoctor() {
        DoctorsMapper mapper = SqlSessionUtil.getMapper(DoctorsMapper.class);
        DoctorSearchVo searchVo = new DoctorSearchVo();
        searchVo.setDepartmentId(6);
        searchVo.setTitleId(2);
        List<Doctors> doctorsList = mapper.selectDoctorAll(searchVo);
        for(Doctors doctors : doctorsList){
            System.out.println(doctors);
        }
    }
}
