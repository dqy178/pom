package com.dqy.mapper;

import com.dqy.pojo.Announcement;
import com.dqy.pojo.Announcement;

import java.util.List;

/**
 * @author 杜青云
 * Date  2025/7/17 下午5:39
 */
public interface AnnouncementMapper {
    List<Announcement> selectAll();
    void addAnnouncement(Announcement announcement);
    void delAnnouncementByNo(Integer announcementId);
    Announcement selectAnnouncementByNo(Integer announcementId);
}