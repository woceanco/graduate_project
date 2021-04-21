package com.sea.service;

import com.sea.pojo.OperLog;

import java.util.List;

public interface OperLogService {

    List<OperLog> queryOperLog();

    boolean addOperLog(OperLog operLog);

}
