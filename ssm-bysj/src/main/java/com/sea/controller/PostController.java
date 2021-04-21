package com.sea.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sea.pojo.Post;
import com.sea.pojo.User;
import com.sea.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("post")
public class PostController {

    @Autowired
    private PostService postService;

    @RequestMapping("/list")
    public String list(@RequestParam(required = false) String postName
            ,@RequestParam(required = false) String pageIndex
            , Model model){
        int pageNum;
        if (pageIndex==null){
            pageNum = 1 ;
        }else {
            pageNum = Integer.parseInt(pageIndex);
        }
        PageHelper.startPage(pageNum, 6);
        List<Post> postList = postService.queryPost(postName);
        PageInfo<Post> pageInfo = new PageInfo<>(postList);

        model.addAttribute("list",pageInfo.getList());
        model.addAttribute("postList",postList);
        model.addAttribute("totalCount",pageInfo.getTotal());
        model.addAttribute("currentPageNo",pageInfo.getPageNum());
        model.addAttribute("totalPageCount",pageInfo.getPages());
        return "post/postlist";
    }
    @RequestMapping("/postlist")
    @ResponseBody
    public List<Post> postlist(@RequestParam(required = false) String postName,Model model){

        List<Post> postList = postService.queryPost(postName);
        return postList;
    }

    @RequestMapping("/view")
    public String view(@RequestParam(required = false) Integer postId,Model model){
        Post post = postService.queryPostById(postId);
        model.addAttribute("post",post);
        return "post/postview";
    }

    @RequestMapping("/delete")
    @ResponseBody
    public String delete(@RequestParam(required = false) int postId) throws JsonProcessingException {

        Map<String, String> map = new HashMap<>();
        ObjectMapper mapper = new ObjectMapper();

        Post post = postService.queryPostById(postId);
        boolean result = postService.delPost(postId);
        if (result){
            map.put("delResult","true");
            return mapper.writeValueAsString(map);
        }else if (post!=null){
            map.put("delResult","notexist");
            return mapper.writeValueAsString(map);
        }
        map.put("delResult","false");
        return mapper.writeValueAsString(map);
    }

    @RequestMapping("/add")
    public String add(Post post,Model model){

        boolean result = postService.addPost(post);

        if (result){
            //model.addAttribute("delResult","true");
            return "redirect:/post/list";
        }
        model.addAttribute("delResult","false");
        return "user/postadd";
    }

    @RequestMapping("/postCode")
    @ResponseBody
    public String update(@RequestParam(required = false) String postCode) throws JsonProcessingException {

        Map<String, String> map = new HashMap<>();
        if (postCode != null && postCode !=""){
            Post post = postService.queryPostCode(postCode);
            if (post != null){
                map.put("postCode","exist");
            }else {
                map.put("postCode","true");
            }
        }else {
            map.put("postCode","error");
        }
        //json
        ObjectMapper mapper = new ObjectMapper();
        return mapper.writeValueAsString(map);
    }

    @RequestMapping("/update")
    public String update(@RequestParam(required = false) Integer postId,Model model){
        Post post = postService.queryPostById(postId);
        model.addAttribute("post",post);
        return "post/postmodify";
    }
    @RequestMapping("/updatepost")
    public String updateSuss(Post post,Model model){
        boolean result = postService.updatePost(post);
        if (result){
            model.addAttribute("ok","ok");
            return "redirect:/post/list";
        }
        model.addAttribute("error","error");
        return "redirect:post/update";
    }
}
