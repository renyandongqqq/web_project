package com.mnkj.service.impl;

import com.mnkj.dao.PermissionDao;
import com.mnkj.entity.Permission;
import com.mnkj.service.PremissionService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class PremissionServiceImpl implements PremissionService {

    @Resource
    PermissionDao permissionDao;
    @Override
    public void addPer(Permission permission) {
        if(permission.getId()==null) {
            permissionDao.addPer(permission);
        }else{
            Permission permissionDb = permissionDao.findRuleById(permission.getId());
            permissionDb.setDescription(permission.getDescription());
            permissionDb.setUrl(permission.getUrl());
            permissionDao.updateRule(permissionDb);
        }
    }


    @Override
    public List<Permission> selectPerAll() {
        return permissionDao.selectPerAll() ;
    }

    @Override
    public void delRule(Long id) {
        permissionDao.delRule(id);
    }

    @Override
    public Permission findRuleById(Long id) {
        return permissionDao.findRuleById(id);
    }

    @Override
    public List<Permission> findRule(Long id) {
        return permissionDao.findRule(id);
    }
}
