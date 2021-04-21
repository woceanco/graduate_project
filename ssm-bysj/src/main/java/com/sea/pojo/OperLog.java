package com.sea.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OperLog {

    private Integer operId;
    private String classname;;
    private String method;
    private String requestMethod;
    private String operatorType;
    private String operName;
    private String operUrl;
    private String operIp;
    private String jsonResult;
    private String operTime;

}
