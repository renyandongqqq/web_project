package com.mnkj.Controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mnkj.entity.Permission;
import com.mnkj.service.PremissionService;
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
public class PremissionController {
    static final Logger logger = LoggerFactory.getLogger(JobController.class);
    @Resource
    PremissionService premissionService;

    //查询角色列表
    @RequestMapping(value="admin/html/admin-rule",method = RequestMethod.GET)
    public String roleList(Model model,
                           @RequestParam(defaultValue = "1") Integer pageNo,
                           @RequestParam(defaultValue = "6") Integer pageSize){
        PageHelper.startPage(pageNo, pageSize);
        List<Permission> perList = premissionService.selectPerAll();
        PageInfo<Permission> page = new PageInfo<Permission>(perList);
        model.addAttribute("perList",perList);
        model.addAttribute("page",page);
        return "html/admin-rule";
    }

    //添加权限
    @RequestMapping( value="/addPer",method= RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> addPer(Permission permission){
        Map<String,Object> result = new HashMap<>();
        try{
            premissionService.addPer(permission);
            result.put("message","成功");
            result.put("code",0);
        }catch(Exception e){
            logger.error(e.getMessage(), e);
            result.put("code",-1);
            result.put("message", e.getMessage());
        }

        return result;
    }

    /*
    * 删除权限  根据ID删除  POST请求
    *
    * */
    @RequestMapping(value = "/delRule",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> delRule(Long id){
        Map<String,Object> result = new HashMap<>();
        try{
            premissionService.delRule(id);
            result.put("message","成功");
            result.put("code",0);

        }catch (Exception e){
            logger.error(e.getMessage(), e);
            result.put("code",-1);
            result.put("message", e.getMessage());
        }
        return result;
    }

    /*
    *   添加权限要跳转的页面，初次添加不需要查询数据库，二次修改则需要
    * */

    @RequestMapping(value = "admin/html/rule-add",method = RequestMethod.GET)
    public String ruleAdd(Model model,Long id){
        if(id==null){
            return "html/rule-add";
        }else {
            Permission permission = premissionService.findRuleById(id);
            model.addAttribute("permission", permission);
        }
        return "html/rule-add";
    }
}
