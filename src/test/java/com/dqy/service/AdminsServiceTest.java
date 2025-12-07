package com.dqy.service;

import com.dqy.pojo.Admins;
import com.dqy.service.Impl.AdminsServiceImpl;
import org.junit.Test;

/**
 * @author 杜青云
 * Date  2025/7/8 上午10:38
 */
public class AdminsServiceTest {
    @Test
    public void login() {
        AdminsService adminsService = new AdminsServiceImpl();
        Admins admin = adminsService.login("admin","12345");
        System.out.println((admin == null? "登录失败" : "登录成功"));
    }
}
