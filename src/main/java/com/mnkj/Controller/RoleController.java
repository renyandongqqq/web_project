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
import javax.servlet.http.HttpServletRequest;
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
    //打开角色添加框
    @RequestMapping("admin/html/role-add")
    public String roleAdd(){
        return "html/role-add";
    }

    //打开权限选择框
    @RequestMapping("admin/html/role-rule")
    public String addRule(Model model,Long id){

        List<Permission> perList = premissionService.findRuleByRoleId(id);
        List<Permission> perListAll = premissionService.selectPerAll();
        model.addAttribute("perList",perList);
        model.addAttribute("perListAll",perListAll);
        model.addAttribute("id",id);
        return "html/role-rule";
    }

     @RequestMapping(value = "/editRoleAndRule")
     @ResponseBody
     public Map<String,Object> editRoleAndRule (@RequestParam("ruleIdList") List<Long> ruleIdList ,@RequestParam("roleId") Long roleId){
        Map<String,Object> result = new HashMap<>();
         try{
                //读取该角色权限
               List<Permission> listResourcesRole = premissionService.findRuleByRoleId(roleId);
               Long[] resourcesIdArray = new Long [listResourcesRole.size()];

               for(int i=0;i<listResourcesRole.size();i++){
                  resourcesIdArray[i] = listResourcesRole.get(i).getId();
               }
                //判断该角色是否已经配置权限 大于0说明已经分配过权限了
               if(resourcesIdArray.length>0){
                   premissionService.delRoleAndRule(roleId,resourcesIdArray);
               }

               if(ruleIdList.size() > 0 && ruleIdList.get(0) != -999) {
                   roleService.editRoleAndRule(roleId, ruleIdList.toArray(new Long[0]));
               }
               result.put("message","成功");
               result.put("code",0);
         }catch (Exception e){
             logger.error(e.getMessage(), e);
             result.put("code",-1);
             result.put("message", e.getMessage());
         }
         return result;
     }

    //删除角色，同时要删除角色关联的权限
    @RequestMapping(value="/delRole",method=RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> delRole( Long id){
        Map<String,Object> result = new HashMap<>();

        try{
            //删除角色信息
            roleService.delRole(id);
            //通过读取该角色权限并且删除该角色关联的权限
            List<Permission> listResourcesRole = premissionService.findRuleByRoleId(id);
            Long[] resourcesIdArray = new Long [listResourcesRole.size()];

            for(int i=0;i<listResourcesRole.size();i++){
                resourcesIdArray[i] = listResourcesRole.get(i).getId();
            }
            //判断该角色是否已经配置权限 大于0说明已经分配过权限了 需要删除权限
            if(resourcesIdArray.length>0){
                premissionService.delRoleAndRule(id,resourcesIdArray);
            }
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
