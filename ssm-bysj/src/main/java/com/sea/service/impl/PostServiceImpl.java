package com.sea.service.impl;

import com.sea.common.Constants;
import com.sea.dao.PostMapper;
import com.sea.pojo.Post;
import com.sea.pojo.User;
import com.sea.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Service
public class PostServiceImpl implements PostService {

    @Autowired
    private PostMapper postMapper;
    private HttpServletRequest request;
    @Autowired
    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }

    @Override
    public List<Post> queryPost(String postName) {
        return postMapper.queryPost(postName);
    }

    @Override
    public boolean addPost(Post post) {
        User loginuser = (User) WebUtils.getSessionAttribute(request, Constants.USER_SESSION);
        post.setCreateBy(loginuser.getLoginName());
        post.setCreateTime(new Date());
        return postMapper.addPost(post);
    }

    @Override
    public boolean delPost(int id) {
        return postMapper.delPost(id);
    }

    @Override
    public Post queryPostById(int id) {
        return postMapper.queryPostById(id);
    }

    @Override
    public Post queryPostCode(String queryPostCode) {
        return postMapper.queryPostCode(queryPostCode);
    }

    @Override
    public boolean updatePost(Post post) {
        User loginuser = (User) WebUtils.getSessionAttribute(request, Constants.USER_SESSION);
        post.setUpdateBy(loginuser.getLoginName());
        post.setUpdateTime(new Date());
        return postMapper.updatePost(post);
    }
}
