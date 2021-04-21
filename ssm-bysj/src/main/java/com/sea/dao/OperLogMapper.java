package com.sea.dao;

import com.sea.pojo.OperLog;

import java.util.List;

public interface OperLogMapper {

    List<OperLog> queryOperLog();

    boolean addOperLog(OperLog operLog);
}
