package com.sea.dao;

import com.sea.pojo.Notice;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface NoticeMapper {

    List<Notice> queryNotice();

    Notice queryNoticeById(@Param("noticeId") int noticeId);

    boolean addNotice(Notice notice);

    boolean delNotice(@Param("noticeId") int id);

    boolean updateNotice(Notice notice);
}
