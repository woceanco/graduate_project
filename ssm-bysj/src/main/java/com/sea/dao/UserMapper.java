package com.sea.dao;

import com.sea.pojo.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper {

    List<User> queryUser(@Param("userName") String userName,@Param("postId") Integer postId);

    boolean addUser(User user);

    boolean delUser(@Param("userId") int id);

    boolean updateUser(User user);

    User queryById(@Param("userId") int id);

    User queryByLogin(@Param("loginName") String loginName);

    boolean updatePassword(@Param("loginName") String loginName,@Param("password") String password);

    int selectUserId();
}
