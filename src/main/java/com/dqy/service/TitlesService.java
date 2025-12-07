package com.dqy.service;

import com.dqy.pojo.Departments;
import com.dqy.pojo.Titles;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * @author 杜青云
 * Date  2025/7/9 下午2:25
 */
public interface TitlesService {
    List<Titles> selectAll();
    void addTitle(Titles titles);
    void delTitleByNo(Integer id);
    void updateTitle(Titles titles);
    Titles selectTitlesByNo(Integer id);
//    PageInfo<Titles> getTitlesByName(Integer pageNum, Integer pageSize);
    PageInfo<Titles> selectAll(Integer pageNum, Integer pageSize);
}
