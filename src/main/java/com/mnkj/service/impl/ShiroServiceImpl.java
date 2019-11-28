package com.mnkj.service.impl;

import com.mnkj.dao.PermissionDao;
import com.mnkj.dao.RoleDao;
import com.mnkj.dao.UserDao;
import com.mnkj.entity.Permission;
import com.mnkj.entity.Role;
import com.mnkj.entity.User;
import com.mnkj.service.ShiroService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class ShiroServiceImpl implements ShiroService {

    @Resource
    private UserDao userDao;
    @Resource
    private RoleDao roleDao;
    @Resource
    private PermissionDao permissionDao;

    public User getUserByUserName(String username) {
        //根据账号获取账号密码
        User userByUserName = userDao.getUserByUserName(username);
        return userByUserName;
    }

    public List<Permission> getPermissionsByUser(User user) {
        //获取到用户角色userRole
        List<Role> role = roleDao.getUserRoleByUserId(user.getId());
        List<Permission> perArrary = new ArrayList<>();

        if (role!=null&&role.size()!=0) {
            //根据roleid获取peimission
            for (Role i : role) {
                perArrary.addAll(permissionDao.getPermissionsByRoleId(i));
            }
        }

        System.out.println(perArrary);
        return perArrary;
    }

}
