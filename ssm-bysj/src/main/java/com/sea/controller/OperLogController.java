package com.sea.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sea.pojo.OperLog;
import com.sea.service.OperLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/operlog")
public class OperLogController {

    @Autowired
    private OperLogService operLogService;

    @RequestMapping("/list")
    public String getLog(Model model,@RequestParam(required = false) String pageIndex){
        int pageNum;
        if (pageIndex==null){
            pageNum = 1 ;
        }else {
            pageNum = Integer.parseInt(pageIndex);
        }

        PageHelper.startPage(pageNum, 8);
        List<OperLog> operLogList = operLogService.queryOperLog();
        PageInfo<OperLog> pageInfo = new PageInfo<>(operLogList);
        model.addAttribute("operLogList",operLogList);
        model.addAttribute("totalCount",pageInfo.getTotal());
        model.addAttribute("currentPageNo",pageInfo.getPageNum());
        model.addAttribute("totalPageCount",pageInfo.getPages());
        return "log/oper";
    }
}
