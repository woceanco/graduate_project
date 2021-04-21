package com.sea.pojo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Dept {

    private Integer deptId;
    private Integer deptCode;
    private String deptName;
    private String leader;
    private String phone;
    private String email;
    private Integer status;
    private String detail;
    private Integer delFlag;
    private String createBy;
    private Date createTime;
    private String updateBy;
    private Date updateTime;
}
