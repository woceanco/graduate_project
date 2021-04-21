package com.sea.dao;

import com.sea.pojo.UserRole;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRoleMapper {

    UserRole selectUserRole(@Param("userId") Integer userId);

    boolean addUserRole(UserRole userRole);

    boolean updateUserRole(UserRole userRole);

    boolean deleteById(@Param("userId") Integer userId);
}
