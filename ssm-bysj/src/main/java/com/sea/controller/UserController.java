package com.sea.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sea.aop.LoggerAnno;
import com.sea.dao.UserRoleMapper;
import com.sea.pojo.Post;
import com.sea.pojo.Role;
import com.sea.pojo.User;
import com.sea.pojo.UserRole;
import com.sea.service.PostService;
import com.sea.service.RoleService;
import com.sea.service.UserService;
import lombok.extern.java.Log;
import org.apache.ibatis.annotations.Mapper;
import org.slf4j.Logger;
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
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private PostService postService;
    @Autowired
    private UserRoleMapper userRoleMapper;

    @LoggerAnno(operatorType = "查询员工列表")
    @RequestMapping("/list")
    public String list(@RequestParam(required = false) String userName,
                       @RequestParam(required = false) Integer postId,
                       @RequestParam(required = false) String pageIndex
                                , Model model){
        int pageNum;
        /*int postid;
        postid = Integer.parseInt(postId);*/
        if (pageIndex==null){
            pageNum = 1 ;
        }else {
            pageNum = Integer.parseInt(pageIndex);
        }
        PageHelper.startPage(pageNum, 8);
        List<User> user = userService.queryUser(userName,postId);
        List<Post> postList = postService.queryPost(null);
        PageInfo<User> pageInfo = new PageInfo<>(user);

        model.addAttribute("list",pageInfo.getList());
        model.addAttribute("postList",postList);
        model.addAttribute("userName",userName);
        model.addAttribute("postId",postId);
        model.addAttribute("totalCount",pageInfo.getTotal());
        model.addAttribute("currentPageNo",pageInfo.getPageNum());
        model.addAttribute("totalPageCount",pageInfo.getPages());

        return "user/userlist";
    }

    @LoggerAnno(operatorType = "查看员工详细信息")
    @RequestMapping("/view")
    public String view(@RequestParam(required = false) Integer userId,Model model){
        User user = userService.queryById(userId);
        model.addAttribute("user",user);
        return "user/userview";
    }

    @LoggerAnno(operatorType = "删除员工")
    @RequestMapping("/delete")
    @ResponseBody
    public String delete(@RequestParam(required = false) Integer uid) throws JsonProcessingException {

        ObjectMapper mapper = new ObjectMapper();
        Map<String, String> map = new HashMap<>();
        boolean result = userService.delUser(uid);
        boolean res = userRoleMapper.deleteById(uid);
        if (result){
            map.put("delResult","true");
            //return "user/userlist";
            return mapper.writeValueAsString(map);
        }
        map.put("delResult","false");
        return mapper.writeValueAsString(map);
    }

    @LoggerAnno(operatorType = "添加员工")
    @RequestMapping("/add")
    public String add(User user,Model model){
        UserRole userRole = new UserRole();

        user.setPassword("123456");
        boolean result = userService.addUser(user);
        if (result){
            userRole.setUserId(userService.selectUserId());
            userRole.setRoleId(user.getRoleId());
            userRoleMapper.addUserRole(userRole);

            model.addAttribute("result",true);
            return "redirect:/user/list";
        }
        model.addAttribute("result",false);
        return "user/useradd";
    }

    @RequestMapping("/update")
    public String update(@RequestParam(required = false) Integer userId,Model model){
        User user = userService.queryById(userId);
        UserRole userRole = userRoleMapper.selectUserRole(userId);
        user.setRoleId(userRole.getRoleId());
        model.addAttribute("user",user);
        return "user/usermodify";
    }

    @LoggerAnno(operatorType = "更新员工信息")
    @RequestMapping("/updateuser")
    public String updateSuss(User user,Model model){
        UserRole userRole = new UserRole();
        userRole.setUserId(user.getUserId());
        userRole.setRoleId(user.getRoleId());
        userRoleMapper.updateUserRole(userRole);

        boolean result = userService.updateUser(user);
        if (result){
            model.addAttribute("result",true);
            return "redirect:/user/list";
        }
        model.addAttribute("result",false);
        return "redirect:user/update";
    }
}
