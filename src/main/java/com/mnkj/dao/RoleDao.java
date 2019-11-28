package com.mnkj.dao;

import com.mnkj.entity.Role;

import java.util.List;

public interface RoleDao {

    List<Role> getUserRoleByUserId(Long id);

    void addRole(String roleName);

    List<Role> selectRoleAll();

    Role findRoleById(Long id);

    void delRole(Long id);

    void delRoleAndPer(Long id);
}
