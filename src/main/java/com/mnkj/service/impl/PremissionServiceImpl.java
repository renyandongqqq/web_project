package com.mnkj.service.impl;

import com.mnkj.dao.PermissionDao;
import com.mnkj.entity.Permission;
import com.mnkj.service.PremissionService;
import org.apache.commons.lang.Validate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.HashMap;
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
    public List<Permission> findRuleByRoleId(Long id) {
        return permissionDao.findRuleByRoleId(id);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public void delRoleAndRule(Long roleId, Long... resourcesIdArray) {
        Validate.notNull(roleId, "[Validate failed] - roleId argument is required; it must not be null");
        Validate.notNull(resourcesIdArray,
                "[Validate failed] - resourcesIdArray argument is required; it must not be null");
        permissionDao.delRoleAndRule(new HashMap<String, Object>(){
            private static final long serialVersionUID = 1L;
            {
                put("roleId", roleId);
                put("resourcesIdArray", Arrays.asList(resourcesIdArray));
            }
        });
    }
}
