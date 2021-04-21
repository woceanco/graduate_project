package com.sea.service.impl;

import com.sea.dao.OperLogMapper;
import com.sea.pojo.OperLog;
import com.sea.service.OperLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service
public class OperLogServiceImpl implements OperLogService {

    @Autowired
    private OperLogMapper operLogMapper;

    @Override
    public List<OperLog> queryOperLog() {
        return operLogMapper.queryOperLog();
    }

    @Override
    public boolean addOperLog(OperLog operLog) {
        return operLogMapper.addOperLog(operLog);
    }
}
