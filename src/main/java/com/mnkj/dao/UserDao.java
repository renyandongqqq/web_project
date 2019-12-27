package com.mnkj.dao;

import com.mnkj.entity.User;

import java.util.List;
import java.util.Set;

public interface UserDao {

    User getUserByUserName(String username);

    List<User> findUserAll();

    User findUserById(Long id);

    void saveUser(User user);

    void editUser(User userDb);

    void delUser(Long id);
}
