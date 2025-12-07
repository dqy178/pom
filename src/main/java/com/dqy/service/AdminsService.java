package com.dqy.service;

import com.dqy.pojo.Admins;

/**
 * @author 杜青云
 * Date  2025/7/8 上午10:32
 */
public interface AdminsService {
    Admins login(String username, String password);

}
