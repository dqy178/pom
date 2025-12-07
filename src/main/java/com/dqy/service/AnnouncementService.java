package com.dqy.service;

import com.dqy.pojo.Announcement;
import com.dqy.pojo.Titles;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * @author 杜青云
 * Date  2025/7/17 下午6:15
 */
public interface AnnouncementService {
        void addAnnouncement(Announcement announcement);
        void delAnnouncementByNo(Integer announcementId);
        List<Announcement> selectAll();
        PageInfo<Announcement> selectAll(Integer pageNum, Integer pageSize);
}
