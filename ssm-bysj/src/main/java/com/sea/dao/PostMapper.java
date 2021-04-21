package com.sea.dao;


import com.sea.pojo.Post;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PostMapper {

    List<Post> queryPost(@Param("postName") String postName);

    boolean addPost(Post post);

    boolean delPost(@Param("postId") int id);

    Post queryPostById(@Param("postId") int id);

    Post queryPostCode(@Param("postCode") String queryPostCode);

    boolean updatePost(Post post);
}
