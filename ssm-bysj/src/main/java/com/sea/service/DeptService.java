package com.sea.service;

import com.sea.pojo.Dept;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DeptService {

    List<Dept> queryDept(String deptName);

    Dept queryDeptById( int id);

    Dept queryDeptCode(String deptCode);

    boolean addDept(Dept dept);

    boolean delDept(@Param("deptId") int id);

    boolean updateDept(Dept dept);

    int checkDeptExistUser(int deptId);
}
