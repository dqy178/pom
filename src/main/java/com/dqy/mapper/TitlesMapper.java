package com.dqy.mapper;

import com.dqy.pojo.Titles;

import java.util.List;

/**
 * @author 杜青云
 * Date  2025/7/9 下午2:22
 */
public interface TitlesMapper {
    List<Titles> selectAll();
    void addTitle(Titles titles);
    void delTitleByNo(Integer id);
    void updateTitle(Titles titles);
    Titles selectTitlesByNo(Integer id);

}
