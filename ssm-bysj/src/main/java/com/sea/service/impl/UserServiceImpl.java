package com.sea.service.impl;


import com.sea.common.Constants;
import com.sea.dao.UserMapper;
import com.sea.pojo.User;
import com.sea.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    private HttpServletRequest request;
    @Autowired
    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }

    public List<User> queryUser(String userName, Integer postId) {
        return userMapper.queryUser(userName,postId);
    }

    @Override
    public boolean addUser(User user) {
        User loginuser = (User) WebUtils.getSessionAttribute(request, Constants.USER_SESSION);
        user.setCreateTime(new Date());
        user.setCreateBy(loginuser.getLoginName());
        return userMapper.addUser(user);
    }

    @Override
    public boolean updateUser(User user) {
        User loginuser = (User) WebUtils.getSessionAttribute(request, Constants.USER_SESSION);
        user.setUpdateBy(loginuser.getLoginName());
        user.setUpdateTime(new Date());
        return userMapper.updateUser(user);
    }

    @Override
    public boolean delUser(int id) {
        return userMapper.delUser(id);
    }

    @Override
    public User queryById(int id) {
        return userMapper.queryById(id);
    }

    @Override
    public User queryByLogin(String loginName) {
        return userMapper.queryByLogin(loginName);
    }

    @Override
    public boolean updatePassword(String loginName,String password) {
        return userMapper.updatePassword(loginName,password);
    }

    @Override
    public int selectUserId() {
        return userMapper.selectUserId();
    }
}
