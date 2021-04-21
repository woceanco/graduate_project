package com.sea.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {

    private Integer userId;
    private Integer postId;
    private Integer deptId;
    private String loginName;
    private String userName;
    private String userType;
    private String email;
    private String phonenumber;
    private int sex;
    private String avatar;
    private String password;
    private Integer status;
    private Integer delFlag;
    private String createBy;
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createTime;
    private String updateBy;
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date updateTime;

    private String dept;
    private String post;
    private String roleName;
    private Integer roleId;

}
