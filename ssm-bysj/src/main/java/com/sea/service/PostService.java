package com.sea.service;

import com.sea.pojo.Post;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PostService {

    List<Post> queryPost(String postName);

    boolean addPost(Post post);

    boolean delPost(int id);

    Post queryPostById(int id);

    Post queryPostCode(String queryPostCode);

    boolean updatePost(Post post);
}
