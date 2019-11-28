package com.mnkj.service.impl;

import com.mnkj.dao.RoleDao;
import com.mnkj.entity.Role;
import com.mnkj.service.RoleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {
    @Resource
    RoleDao roleDao;

    @Override
    public void addRole(String roleName) {
        roleDao.addRole(roleName);
    }

    @Override
    public List<Role> selectRoleAll() {
        return roleDao.selectRoleAll();
    }

    @Override
    public Role findRoleById(Long id) {
        return roleDao.findRoleById(id);
    }

    @Override
    public void delRole(Long id) {
        roleDao.delRole(id);
    }

    @Override
    public void delRoleAndPer(Long id) {
        roleDao.delRoleAndPer(id);
    }
}
