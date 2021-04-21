package com.sea.dao;

import com.sea.pojo.Dept;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DeptMapper {

    List<Dept> queryDept(@Param("deptName") String deptName);

    Dept queryDeptById(@Param("deptId") int id);

    Dept queryDeptCode(@Param("deptCode") String deptCode);

    boolean addDept(Dept dept);

    boolean delDept(@Param("deptId") int id);

    boolean updateDept(Dept dept);

    int checkDeptExistUser(@Param("deptId") int deptId);
}
