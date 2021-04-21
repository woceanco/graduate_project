package com.sea.service;

import com.sea.pojo.Role;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoleService {

    List<Role> queryRole(String roleName);

    Role queryRoleById(@Param("roleId") Integer roleId);

    Role queryRoleByKey(@Param("roleKey") String roleKey);

    boolean addRole(Role role);

    boolean delRole(@Param("roleId") int id);

    boolean updateRole(Role role);
}
