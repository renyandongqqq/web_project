package com.mnkj.service;

import com.mnkj.entity.Role;

import java.util.List;


public interface RoleService {

    void addRole(String roleName);

    List<Role> selectRoleAll();

    Role findRoleById(Long id);

    void delRole(Long id);

    void delRoleAndPer(Long id);

    void editRoleAndRule(Long roleId, Long... resourcesIdArray);
}
