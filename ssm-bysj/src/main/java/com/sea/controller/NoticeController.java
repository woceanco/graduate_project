package com.sea.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sea.aop.LoggerAnno;
import com.sea.pojo.Notice;
import com.sea.pojo.User;
import com.sea.service.NoticeService;
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
@RequestMapping("/notice")
public class NoticeController {

    @Autowired
    private NoticeService noticeService;

    @RequestMapping("/list")
    public String list(Model model,@RequestParam(required = false) String pageIndex){

        int pageNum;
        if (pageIndex==null){
            pageNum = 1 ;
        }else {
            pageNum = Integer.parseInt(pageIndex);
        }
        PageHelper.startPage(pageNum, 8);
        List<Notice> noticeList = noticeService.queryNotice();
        PageInfo<Notice> pageInfo = new PageInfo<>(noticeList);

        model.addAttribute("noticeList",noticeList);
        model.addAttribute("totalCount",pageInfo.getTotal());
        model.addAttribute("currentPageNo",pageInfo.getPageNum());
        model.addAttribute("totalPageCount",pageInfo.getPages());

        return "notice/noticelist";
    }

    @RequestMapping("/info")
    public String info(Model model,@RequestParam(required = false) String pageIndex){

        int pageNum;
        if (pageIndex==null){
            pageNum = 1 ;
        }else {
            pageNum = Integer.parseInt(pageIndex);
        }
        PageHelper.startPage(pageNum, 8);
        List<Notice> noticeList = noticeService.queryNotice();
        PageInfo<Notice> pageInfo = new PageInfo<>(noticeList);

        model.addAttribute("noticeList",noticeList);
        model.addAttribute("totalCount",pageInfo.getTotal());
        model.addAttribute("currentPageNo",pageInfo.getPageNum());
        model.addAttribute("totalPageCount",pageInfo.getPages());

        return "notice/noticeinfo";
    }

    @RequestMapping("/view")
    public String view(@RequestParam(required = false) Integer noticeId, Model model){
        Notice notice = noticeService.queryNoticeById(noticeId);
        model.addAttribute("notice",notice);
        return "notice/noticeview";
    }

    @RequestMapping("/delete")
    @ResponseBody
    public String del(int noticeId,Model model) throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, String> map = new HashMap<>();
        boolean result = noticeService.delNotice(noticeId);
        if (result){
            map.put("delResult","true");
            return mapper.writeValueAsString(map);
        }
        map.put("delResult","false");
        return mapper.writeValueAsString(map);
    }

    @RequestMapping("/add")
    public String add(Notice notice,Model model){
        boolean result = noticeService.addNotice(notice);
        if (result){
            model.addAttribute("result",true);
            return "redirect:/notice/list";
        }
        model.addAttribute("result",false);
        return "notice/noticeadd";
    }

    @RequestMapping("/update")
    public String update(@RequestParam(required = false) Integer noticeId,Model model){
        Notice notice = noticeService.queryNoticeById(noticeId);
        model.addAttribute("notice",notice);
        return "notice/noticemodify";
    }

    @LoggerAnno(operatorType = "修改公告信息")
    @RequestMapping("/updatenotice")
    public String updateSuss(Notice notice,Model model){
        boolean result = noticeService.updateNotice(notice);
        if (result){
            model.addAttribute("result",true);
            return "redirect:/notice/list";
        }
        model.addAttribute("result",false);
        return "redirect:notice/update";
    }
}
