package com.mnkj.dao;

import com.mnkj.entity.Permission;
import com.mnkj.entity.Role;

import java.util.Collection;
import java.util.List;

public interface PermissionDao {

    List<Permission> getPermissionsByRoleId(Role roleId);

    void addPer(Permission permission);

    List<Permission> selectPerAll();

    void delRule(Long id);

    Permission findRuleById(Long id);

    void updateRule(Permission permissionDb);

    List<Permission> findRule(Long id);
}
