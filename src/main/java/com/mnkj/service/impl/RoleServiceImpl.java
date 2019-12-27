package com.mnkj.service.impl;

import com.mnkj.dao.RoleDao;
import com.mnkj.entity.Role;
import com.mnkj.service.RoleService;
import org.apache.commons.lang.Validate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.HashMap;
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

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public void editRoleAndRule(Long roleId, Long... resourcesIdArray) {
        Validate.notNull(roleId, "[Validate failed] - roleId argument is required; it must not be null");
        Validate.notNull(resourcesIdArray,
                "[Validate failed] - resourcesIdArray argument is required; it must not be null");
        roleDao.editRoleAndRule(new HashMap<String, Object>() {
            private static final long serialVersionUID = 1L;
            {
                put("roleId", roleId);
                put("resourcesIdArray", Arrays.asList(resourcesIdArray));
            }
        });
    }

}
