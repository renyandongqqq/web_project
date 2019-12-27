package com.mnkj.dao;

import com.mnkj.entity.Role;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface RoleDao {

    List<Role> getUserRoleByUserId(Long id);

    void addRole(String roleName);

    List<Role> selectRoleAll();

    Role findRoleById(Long id);

    void delRole(Long id);

    void delRoleAndPer(Long id);

    void editRoleAndRule(Map<String, Object> params);
}
