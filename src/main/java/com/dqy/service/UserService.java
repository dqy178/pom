package com.dqy.service;

import com.dqy.pojo.User;
import java.util.List;

public interface UserService {
    boolean register(User user);
    User login(String username, String password);
    User getUserByUsername(String username);
    User getUserByPhone(String phone);
    boolean updateUser(User user);
    boolean updateUserAvatar(Integer id, String avatar);
    User getUserById(Integer id);
    List<User> getAllUsers();
} 