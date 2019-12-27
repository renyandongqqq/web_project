package com.mnkj.service.impl;

import com.mnkj.dao.UserDao;
import com.mnkj.entity.User;
import com.mnkj.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Resource
    UserDao userDao;
    @Override
    public List<User> findUserAll() {
        return userDao.findUserAll();
    }

    @Override
    public User findUserById(Long id) {
        return userDao.findUserById(id);
    }

    @Override
    public void saveOrEditUser(User user) {
        if(user.getId()==null){
            userDao.saveUser(user);
        }else{
            User userDb = userDao.findUserById(user.getId());
            userDb.setNickname(user.getNickname());
            userDb.setPassword(user.getPassword());
            userDb.setRoleId(user.getRoleId());
            userDb.setUsername(user.getUsername());
            userDao.editUser(userDb);
        }

    }

    @Override
    public void delUser(Long id) {
        userDao.delUser(id);

    }
}
