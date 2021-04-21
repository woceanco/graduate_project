package com.sea.service.impl;

import com.sea.common.Constants;
import com.sea.dao.DeptMapper;
import com.sea.pojo.Dept;
import com.sea.pojo.User;
import com.sea.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Service
public class DeptServiceImpl implements DeptService {

    @Autowired
    private DeptMapper deptMapper;

    private HttpServletRequest request;
    @Autowired
    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }
    @Override
    public List<Dept> queryDept(String deptName) {
        return deptMapper.queryDept(deptName);
    }

    @Override
    public Dept queryDeptById(int id) {
        return deptMapper.queryDeptById(id);
    }

    @Override
    public Dept queryDeptCode(String deptCode) {
        return deptMapper.queryDeptCode(deptCode);
    }

    @Override
    public boolean addDept(Dept dept) {
        User loginuser = (User) WebUtils.getSessionAttribute(request, Constants.USER_SESSION);
        dept.setStatus(0);
        dept.setCreateBy(loginuser.getLoginName());
        dept.setCreateTime(new Date());
        return deptMapper.addDept(dept);
    }

    @Override
    public boolean delDept(int id) {
        return deptMapper.delDept(id);
    }

    @Override
    public boolean updateDept(Dept dept) {
        User loginuser = (User) WebUtils.getSessionAttribute(request, Constants.USER_SESSION);
        dept.setUpdateBy(loginuser.getLoginName());
        dept.setUpdateTime(new Date());
        return deptMapper.updateDept(dept);
    }

    @Override
    public int checkDeptExistUser(int deptId) {
        return deptMapper.checkDeptExistUser(deptId);
    }
}
