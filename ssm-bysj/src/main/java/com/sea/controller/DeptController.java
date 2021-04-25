package com.sea.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sea.pojo.Dept;
import com.sea.service.DeptService;
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
@RequestMapping("/dept")
public class DeptController {
    @Autowired
    private DeptService deptService;

    @RequestMapping("/list")
    public String list(@RequestParam(required = false) String deptName
            ,@RequestParam(required = false) String pageIndex
            , Model model){
        int pageNum;
        if (pageIndex==null){
            pageNum = 1 ;
        }else {
            pageNum = Integer.parseInt(pageIndex);
        }
        PageHelper.startPage(pageNum, 6);
        List<Dept> deptList = deptService.queryDept(deptName);
        PageInfo<Dept> pageInfo = new PageInfo<>(deptList);

        model.addAttribute("list",pageInfo.getList());
        model.addAttribute("deptList",deptList);
        model.addAttribute("totalCount",pageInfo.getTotal());
        model.addAttribute("currentPageNo",pageInfo.getPageNum());
        model.addAttribute("totalPageCount",pageInfo.getPages());
        return "dept/deptlist";
    }
    @RequestMapping("/deptlist")
    @ResponseBody
    public List<Dept> deptlist(@RequestParam(required = false) String deptName,
                               Model model){

        List<Dept> deptList = deptService.queryDept(deptName);
        return deptList;
    }

    @RequestMapping("/view")
    public String view(@RequestParam(required = false) Integer deptId,Model model){
        Dept dept = deptService.queryDeptById(deptId);
        model.addAttribute("dept",dept);
        return "dept/deptview";
    }

    @RequestMapping("/delete")
    @ResponseBody
    public String del(@RequestParam(required = false) int deptId) throws JsonProcessingException {

        Map<String, String> map = new HashMap<>();
        ObjectMapper mapper = new ObjectMapper();

        int num = deptService.checkDeptExistUser(deptId);

        if (num < 1){
            deptService.delDept(deptId);
            map.put("delResult","true");
            return mapper.writeValueAsString(map);
        }else if (num >= 1){
            map.put("delResult","exist");
            map.put("num",String.valueOf(num));
            return mapper.writeValueAsString(map);
        }
        map.put("delResult","false");
        return mapper.writeValueAsString(map);
    }

    @RequestMapping("/add")
    public String add(Dept dept,Model model){

        boolean result = deptService.addDept(dept);
        if (result){
            return "redirect:/dept/list";
        }
        model.addAttribute("delResult","false");
        return "dept/deptadd";
    }

    @RequestMapping("/deptCode")
    @ResponseBody
    public String update(@RequestParam(required = false) String deptCode) throws JsonProcessingException {

        Map<String, String> map = new HashMap<>();
        if (deptCode != null && deptCode !=""){
            Dept dept = deptService.queryDeptCode(deptCode);
            if (dept != null){
                map.put("deptCode","exist");
            }else {
                map.put("deptCode","true");
            }
        }else {
            map.put("deptCode","error");
        }
        //json
        ObjectMapper mapper = new ObjectMapper();
        return mapper.writeValueAsString(map);
    }

    @RequestMapping("/update")
    public String update(@RequestParam(required = false) Integer deptId,Model model){
        Dept dept = deptService.queryDeptById(deptId);
        model.addAttribute("dept",dept);
        return "dept/deptmodify";
    }
    @RequestMapping("/updatedept")
    public String updateSuss(Dept dept,Model model){
        boolean result = deptService.updateDept(dept);
        if (result){
            model.addAttribute("ok","ok");
            return "redirect:/dept/list";
        }
        model.addAttribute("error","error");
        return "redirect:dept/update";
    }
}
