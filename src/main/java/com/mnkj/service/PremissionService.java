package com.mnkj.service;

import com.mnkj.entity.Permission;

import java.util.List;

public interface PremissionService {

    void addPer(Permission permission);

    List<Permission> selectPerAll();

    void delRule(Long id);

    Permission findRuleById(Long id);

    List<Permission> findRuleByRoleId(Long id);

    void delRoleAndRule(Long roleId, Long... resourcesIdArray);
}
