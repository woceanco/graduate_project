package com.sea.service.impl;

import com.sea.common.Constants;
import com.sea.dao.RoleMapper;
import com.sea.pojo.Role;
import com.sea.pojo.User;
import com.sea.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleMapper roleMapper;

    private HttpServletRequest request;
    @Autowired
    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }


    @Override
    public List<Role> queryRole(String roleName) {
        return roleMapper.queryRole(roleName);
    }

    @Override
    public Role queryRoleById(Integer roleId) {
        return roleMapper.queryRoleById(roleId);
    }

    @Override
    public Role queryRoleByKey(String roleKey) {
        return roleMapper.queryRoleByKey(roleKey);
    }

    @Override
    public boolean addRole(Role role) {
        User loginuser = (User) WebUtils.getSessionAttribute(request, Constants.USER_SESSION);
        role.setStatus(0);
        role.setCreateBy(loginuser.getLoginName());
        role.setCreateTime(new Date());
        return roleMapper.addRole(role);
    }

    @Override
    public boolean delRole(int id) {
        return roleMapper.delRole(id);
    }

    @Override
    public boolean updateRole(Role role) {
        User loginuser = (User) WebUtils.getSessionAttribute(request, Constants.USER_SESSION);
        role.setUpdateBy(loginuser.getLoginName());
        role.setUpdateTime(new Date());
        return roleMapper.updateRole(role);
    }
}
