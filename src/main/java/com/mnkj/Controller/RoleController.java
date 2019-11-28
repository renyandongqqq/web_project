package com.mnkj.Controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mnkj.entity.Permission;
import com.mnkj.entity.Role;
import com.mnkj.service.PremissionService;
import com.mnkj.service.RoleService;
import com.mnkj.service.ShiroService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller

public class RoleController {
    static final Logger logger = LoggerFactory.getLogger(JobController.class);
    @Resource
    RoleService roleService;
    @Resource
    PremissionService premissionService;
    @Resource
    ShiroService shiroservice;

    //查询角色列表
    @RequestMapping(value="admin/html/admin-role",method = RequestMethod.GET)
    public String roleList(Model model,
                           @RequestParam(defaultValue = "1") Integer pageNo,
                           @RequestParam(defaultValue = "8") Integer pageSize){
        PageHelper.startPage(pageNo, pageSize);
        List<Role> roleList = roleService.selectRoleAll();
        PageInfo<Role> page = new PageInfo<Role>(roleList);
        model.addAttribute("roleList",roleList);
        model.addAttribute("page",page);
        return "html/admin-role";
    }

    //添加角色
    @RequestMapping( value="/addRole",method=RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> addRole(Role role){
        Map<String,Object> result = new HashMap<>();
        try{
            roleService.addRole(role.getRoleName());
            result.put("message","成功");
            result.put("code",0);
        }catch(Exception e){
            logger.error(e.getMessage(), e);
            result.put("code",-1);
            result.put("message", e.getMessage());
        }

        return result;
    }
    @RequestMapping("admin/html/role-add")
    public String roleAdd(Model model,Long id){
        if(id==null){
            return "html/role-add";
        }
        Role role = roleService.findRoleById(id);
        List<Permission> pList = premissionService.findRule(id);
        model.addAttribute("perList",pList);
        model.addAttribute("role",role);
        return "html/role-add";
    }
    @RequestMapping(value="/delRole",method=RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> delRole(Long id){
        Map<String,Object> result = new HashMap<>();
        try{
            roleService.delRole(id);
            result.put("message","成功");
            result.put("code",0);
        }catch (Exception e){
            logger.error(e.getMessage(), e);
            result.put("code",-1);
            result.put("message", e.getMessage());
        }

           return result;
    }
}
