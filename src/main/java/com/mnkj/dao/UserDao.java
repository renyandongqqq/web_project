package com.mnkj.dao;

import com.mnkj.entity.User;

import java.util.Set;

public interface UserDao {

    User getUserByUserName(String username);
}
