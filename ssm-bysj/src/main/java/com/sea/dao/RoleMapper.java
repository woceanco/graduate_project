package com.sea.dao;

import com.sea.pojo.Role;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RoleMapper {

    List<Role> queryRole(@Param("roleName") String roleName);

    Role queryRoleById(@Param("roleId") Integer roleId);

    Role queryRoleByKey(@Param("roleKey") String roleKey);

    boolean addRole(Role role);

    boolean delRole(@Param("roleId") int id);

    boolean updateRole(Role role);
}
