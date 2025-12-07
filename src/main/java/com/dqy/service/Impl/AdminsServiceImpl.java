package com.dqy.service.Impl;

import com.dqy.mapper.AdminsMapper;
import com.dqy.pojo.Admins;
import com.dqy.service.AdminsService;
import com.dqy.util.SqlSessionUtil;

/**
 * @author 杜青云
 * Date  2025/7/8 上午10:34
 */
public class AdminsServiceImpl implements AdminsService {
    @Override
    public Admins login(String username, String password) {
        try {
//        创建AdimsMapper对象
            AdminsMapper mapper = SqlSessionUtil.getMapper(AdminsMapper.class);
//        调用查询方法
            Admins admins = mapper.selectAdminByName(username);
//        如果查询的Admins对象不为空，则判断密码是否正确，如果正确，返回Admins对象，否则返回null
            if (admins!= null && admins.getPassword().equals(password)) {
                return admins;
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            SqlSessionUtil.closeSession();
        }
        return null;
    }
}
