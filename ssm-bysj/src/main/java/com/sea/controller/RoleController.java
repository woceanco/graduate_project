package com.sea.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sea.pojo.Dept;
import com.sea.pojo.Role;
import com.sea.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("role")
public class RoleController {

    @Autowired
    private RoleService roleService;

    @RequestMapping("/list")
    public String list(@RequestParam(required = false) String roleName,Model model){
        PageHelper.startPage(1,8);
        List<Role> roleList = roleService.queryRole(roleName);
        PageInfo<Role> pageInfo = new PageInfo<>(roleList);
        for (Role role : roleList) {
            System.out.println(role);
        }

        model.addAttribute("roleList",roleList);
        model.addAttribute("totalCount",pageInfo.getTotal());
        model.addAttribute("currentPageNo",pageInfo.getPageNum());
        model.addAttribute("totalPageCount",pageInfo.getPages());

        return "role/rolelist";
    }

    @RequestMapping("/rolelist")
    @ResponseBody
    public List<Role> deptlist(@RequestParam(required = false) String roleName,
                               Model model){

        List<Role> roleList = roleService.queryRole(roleName);
        return roleList;
    }

    @RequestMapping("/delete")
    public String delete(Integer roleId,Model model) throws JsonProcessingException {

        ObjectMapper mapper = new ObjectMapper();
        Map<String, String> map = new HashMap<>();
        boolean result = roleService.delRole(roleId);
        if (result){
            map.put("delResult","true");
            return mapper.writeValueAsString(map);
        }
        map.put("delResult","false");
        return mapper.writeValueAsString(map);
    }

    @RequestMapping("/add")
    @ResponseBody
    public String add(Role role,Model model){
        boolean result = roleService.addRole(role);
        if (result){
            model.addAttribute("result",true);
            return "redirect:/role/list";
        }
        model.addAttribute("result",false);
        return "role/roleadd";
    }

    @RequestMapping("/update")
    public String update(@RequestParam(required = false) Integer roleId, Model model){
        Role role = roleService.queryRoleById(roleId);
        model.addAttribute("role",role);
        return "role/rolemodify";
    }
    @RequestMapping("/updaterole")
    public String updateSuss(Role role,Model model){
        boolean result = roleService.updateRole(role);
        if (result){
            model.addAttribute("result",true);
            return "redirect:/user/list";
        }
        model.addAttribute("result",false);
        return "redirect:user/update";
    }

    @RequestMapping("/roleKey")
    @ResponseBody
    public String update(@RequestParam(required = false) String roleKey) throws JsonProcessingException {

        Map<String, String> map = new HashMap<>();
        if (roleKey != null && roleKey !=""){
            Role role = roleService.queryRoleByKey(roleKey);
            if (role != null){
                map.put("roleKey","exist");
            }else {
                map.put("roleKey","true");
            }
        }else {
            map.put("roleKey","error");
        }
        //json
        ObjectMapper mapper = new ObjectMapper();
        return mapper.writeValueAsString(map);
    }
}
