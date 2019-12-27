package com.mnkj.service;

import com.mnkj.entity.User;
import org.springframework.stereotype.Service;

import java.util.List;


public interface UserService {
    List<User> findUserAll();

    User findUserById(Long id);

    void saveOrEditUser(User user);

    void delUser(Long id);
}
