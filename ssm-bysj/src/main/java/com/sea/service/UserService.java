package com.sea.service;

import com.sea.pojo.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import java.util.List;


public interface UserService {

    List<User> queryUser(@Param("userName") String userName,@Param("postId") Integer postId);

    boolean addUser(User user);

    boolean updateUser(User user);

    boolean delUser(int id);

    User queryById(int id);

    User queryByLoginName(@Param("loginName") String loginName);

    boolean updatePassword(String loginName, String password);

    int selectUserId();
}
