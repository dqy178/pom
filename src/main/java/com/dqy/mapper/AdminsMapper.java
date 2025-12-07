package com.dqy.mapper;

import com.dqy.pojo.Admins;


public interface AdminsMapper {
    Admins selectAdminByName(String username);
}
