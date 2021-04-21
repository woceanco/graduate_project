package com.sea.service.impl;

import com.sea.common.Constants;
import com.sea.dao.NoticeMapper;
import com.sea.pojo.Notice;
import com.sea.pojo.User;
import com.sea.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Service
public class NoticeServiceImpl implements NoticeService {

    @Autowired
    private NoticeMapper noticeMapper;
    private HttpServletRequest request;
    @Autowired
    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }

    @Override
    public List<Notice> queryNotice() {
        return noticeMapper.queryNotice();
    }

    @Override
    public Notice queryNoticeById(int noticeId) {
        return noticeMapper.queryNoticeById(noticeId);
    }

    @Override
    public boolean addNotice(Notice notice) {
        User loginuser = (User) WebUtils.getSessionAttribute(request, Constants.USER_SESSION);
        notice.setCreateBy(loginuser.getLoginName());
        notice.setCreateTime(new Date());
        return noticeMapper.addNotice(notice);
    }

    @Override
    public boolean delNotice(int id) {
        return noticeMapper.delNotice(id);
    }

    @Override
    public boolean updateNotice(Notice notice) {
        User loginuser = (User) WebUtils.getSessionAttribute(request, Constants.USER_SESSION);
        notice.setUpdateBy(loginuser.getLoginName());
        notice.setCreateTime(new Date());
        return noticeMapper.updateNotice(notice);
    }
}
