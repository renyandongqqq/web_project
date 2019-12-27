package com.mnkj.Controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mnkj.entity.Role;
import com.mnkj.entity.User;
import com.mnkj.service.RoleService;
import com.mnkj.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller

public class UserController {
    static final Logger logger = LoggerFactory.getLogger(UserController.class);
    @Resource
    RoleService roleService;
    @Resource
    UserService userService;


    //跳转到用户添加页面
    @RequestMapping("admin/admin/userInfo")
    public String userInfo(Model model,
                           @RequestParam(defaultValue = "1") Integer pageNo,
                           @RequestParam(defaultValue = "8") Integer pageSize){
        PageHelper.startPage(pageNo, pageSize);
        List<User> userList= userService.findUserAll();
        PageInfo<User> page = new PageInfo<User>(userList);
        model.addAttribute("userList", userList);
        model.addAttribute("page",page);
        return "admin/userInfo";
    }
    //打开用户添加框
    @RequestMapping("admin/admin/saveUser")
    public String saveUser(Model model){
        List<Role> roleList = roleService.selectRoleAll();
        model.addAttribute("roleList",roleList);
        return "admin/editUser";
    }
    //打开用户编辑框
    @RequestMapping("admin/admin/editUser")
    public String editUser(Model model,Long id){
        User user = userService.findUserById(id);
        List<Role> roleList = roleService.selectRoleAll();
        model.addAttribute("roleList",roleList);
        model.addAttribute("user",user);
        return "admin/editUser";
    }

    //添加或保存用户
    @RequestMapping(value = "saveOrEditUser",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> saveOrEditUser (User user){
        Map<String,Object> result = new HashMap<>();
        try{
            userService.saveOrEditUser(user);
            result.put("message","成功");
            result.put("code",0);
        }catch (Exception e){
            logger.error(e.getMessage(), e);
            result.put("code",-1);
            result.put("message", e.getMessage());
        }
        return result;
    }
    //删除用户
    @RequestMapping(value = "delUser",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> delUser(Long id){
        Map<String,Object> result = new HashMap<>();
        try{
            userService.delUser(id);
            result.put("message","成功");
            result.put("code",0);
        }catch(Exception e){
            logger.error(e.getMessage(), e);
            result.put("code",-1);
            result.put("message", e.getMessage());
        }
        return  result;
    }
}
