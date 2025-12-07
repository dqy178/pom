package com.dqy.service.Impl;

import com.dqy.mapper.AnnouncementMapper;
import com.dqy.pojo.Announcement;
import com.dqy.service.AnnouncementService;
import com.dqy.util.SqlSessionUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * @author 杜青云
 * Date  2025/7/17 下午6:16
 */
public class AnnouncementServiceImpl implements AnnouncementService {

    @Override
    public List<Announcement> selectAll() {
        try{
            //获取mapper对象
            AnnouncementMapper mapper = SqlSessionUtil.getMapper(AnnouncementMapper.class);
            //调用mapper中的查询方法
            List<Announcement> announcementList = mapper.selectAll();
            //返回查询结果
            return announcementList;
        }catch (Exception e){
            throw new RuntimeException(e);
        }finally {
            SqlSessionUtil.closeSession();
        }
    }

    @Override
    public PageInfo<Announcement> selectAll(Integer pageNum, Integer pageSize) {
        try {
            //获取mapper对象
            AnnouncementMapper mapper = SqlSessionUtil.getMapper(AnnouncementMapper.class);
            //使用PageHelper设置页码
            PageHelper.startPage(pageNum, pageSize);
            //调用mapper中的查询方法
            List<Announcement> announcementList = mapper.selectAll();
            //创建PageInfo对象
            PageInfo<Announcement> pageInfo = new PageInfo<>(announcementList);
            //返回PageInfo对象
            return pageInfo;
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            SqlSessionUtil.closeSession();
        }
    }

    @Override
    public void addAnnouncement(Announcement announcement) {
        try {
            //获取mapper对象
            AnnouncementMapper mapper = SqlSessionUtil.getMapper(AnnouncementMapper.class);
            //调用添加方法
            mapper.addAnnouncement(announcement);
            //提交事务
            SqlSessionUtil.commit();
        } catch (Exception e) {
            //事物回滚
            SqlSessionUtil.rollback();
            throw new RuntimeException(e);
        } finally {
            //在finally部分，释放资源
            SqlSessionUtil.closeSession();
        }
    }

    @Override
    public void delAnnouncementByNo(Integer id) {
        try {
            //获取mapper对象
            AnnouncementMapper mapper = SqlSessionUtil.getMapper(AnnouncementMapper.class);
            //调用删除方法
            mapper.delAnnouncementByNo(id);
            //提交事务
            SqlSessionUtil.commit();
        } catch (Exception e) {
            //事物回滚
            SqlSessionUtil.rollback();
            throw new RuntimeException(e);
        } finally {
            //在finally部分，释放资源
            SqlSessionUtil.closeSession();
        }
    }


}
