package com.dqy.mapper;

import com.dqy.pojo.Admins;
import com.dqy.util.SqlSessionUtil;
import org.junit.Test;
/**
 * @author 杜青云
 * Date  2025/7/8 上午10:19
 */
public class AdminsMapperTest {
    @Test
    public void selectAdminByName() {
        AdminsMapper mapper = SqlSessionUtil.getMapper(AdminsMapper.class);
        Admins admin = mapper.selectAdminByName("admin");
        System.out.println(admin);
    }
}