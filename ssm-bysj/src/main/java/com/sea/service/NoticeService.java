package com.sea.service;

import com.sea.pojo.Notice;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface NoticeService {

    List<Notice> queryNotice();

    Notice queryNoticeById(@Param("noticeId") int noticeId);

    boolean addNotice(Notice notice);

    boolean delNotice(@Param("noticeId") int id);

    boolean updateNotice(Notice notice);
}
