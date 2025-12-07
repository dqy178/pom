package com.dqy.mapper;

import com.dqy.pojo.User;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    // 注册用户
    int insertUser(User user);
    // 根据用户名查询用户
    User selectByUsername(String username);
    // 根据手机号查询用户
    User selectByPhone(String phone);
    // 用户登录
    User login(@Param("username") String username, @Param("password") String password);
    // 更新用户信息
    int updateUser(User user);
    // 更新用户头像
    int updateUserAvatar(@Param("id") Integer id, @Param("avatar") String avatar);
    // 根据id查询用户
    User selectById(Integer id);
    // 查询所有用户（可选）
    List<User> selectAll();
} 