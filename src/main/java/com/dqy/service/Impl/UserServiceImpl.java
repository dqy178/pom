package com.dqy.service.Impl;

import com.dqy.mapper.UserMapper;
import com.dqy.pojo.User;
import com.dqy.service.UserService;
import com.dqy.util.SqlSessionUtil;
import org.apache.ibatis.session.SqlSession;
import java.util.List;

public class UserServiceImpl implements UserService {
    @Override
    public boolean register(User user) {
        SqlSession session = SqlSessionUtil.getSession();
        UserMapper mapper = session.getMapper(UserMapper.class);
        User exist = mapper.selectByUsername(user.getUsername());
        if (exist != null) {
            session.close();
            return false; // 用户名已存在
        }
        int res = mapper.insertUser(user);
        session.commit();
        session.close();
        return res > 0;
    }

    @Override
    public User login(String username, String password) {
        SqlSession session = SqlSessionUtil.getSession();
        UserMapper mapper = session.getMapper(UserMapper.class);
        User user = mapper.login(username, password);
        session.close();
        return user;
    }

    @Override
    public User getUserByUsername(String username) {
        SqlSession session = SqlSessionUtil.getSession();
        UserMapper mapper = session.getMapper(UserMapper.class);
        User user = mapper.selectByUsername(username);
        session.close();
        return user;
    }

    @Override
    public User getUserByPhone(String phone) {
        SqlSession session = SqlSessionUtil.getSession();
        UserMapper mapper = session.getMapper(UserMapper.class);
        User user = mapper.selectByPhone(phone);
        session.close();
        return user;
    }

    @Override
    public boolean updateUser(User user) {
        SqlSession session = SqlSessionUtil.getSession();
        UserMapper mapper = session.getMapper(UserMapper.class);
        int res = mapper.updateUser(user);
        session.commit();
        session.close();
        return res > 0;
    }

    @Override
    public boolean updateUserAvatar(Integer id, String avatar) {
        SqlSession session = SqlSessionUtil.getSession();
        UserMapper mapper = session.getMapper(UserMapper.class);
        int res = mapper.updateUserAvatar(id, avatar);
        session.commit();
        session.close();
        return res > 0;
    }

    @Override
    public User getUserById(Integer id) {
        SqlSession session = SqlSessionUtil.getSession();
        UserMapper mapper = session.getMapper(UserMapper.class);
        User user = mapper.selectById(id);
        session.close();
        return user;
    }

    @Override
    public List<User> getAllUsers() {
        SqlSession session = SqlSessionUtil.getSession();
        UserMapper mapper = session.getMapper(UserMapper.class);
        List<User> list = mapper.selectAll();
        session.close();
        return list;
    }
} 