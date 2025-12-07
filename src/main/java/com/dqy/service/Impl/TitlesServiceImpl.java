package com.dqy.service.Impl;

import com.dqy.mapper.DepartmentsMapper;
import com.dqy.mapper.TitlesMapper;
import com.dqy.pojo.Departments;
import com.dqy.pojo.Titles;
import com.dqy.service.TitlesService;
import com.dqy.util.SqlSessionUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author 杜青云
 * Date  2025/7/9 下午2:25
 */
public class TitlesServiceImpl implements TitlesService {

    @Override
    public List<Titles> selectAll() {
        try{
            //获取mapper对象
            TitlesMapper mapper = SqlSessionUtil.getMapper(TitlesMapper.class);
            //调用mapper中的查询方法
            List<Titles> titlesList = mapper.selectAll();
            //返回查询结果
            return titlesList;
        }catch (Exception e){
            throw new RuntimeException(e);
        }finally {
            SqlSessionUtil.closeSession();
        }
    }

    @Override
    public PageInfo<Titles> selectAll(Integer pageNum, Integer pageSize) {
        try {
            //获取mapper对象
            TitlesMapper mapper = SqlSessionUtil.getMapper(TitlesMapper.class);
            //使用PageHelper设置页码
            PageHelper.startPage(pageNum, pageSize);
            //调用mapper中的查询方法
            List<Titles> titlesList = mapper.selectAll();
            //创建PageInfo对象
            PageInfo<Titles> pageInfo = new PageInfo<>(titlesList);
            //返回PageInfo对象
            return pageInfo;
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            SqlSessionUtil.closeSession();
        }
    }

    @Override
    public void addTitle(Titles titles) {
            try {
                //获取mapper对象
                TitlesMapper mapper = SqlSessionUtil.getMapper(TitlesMapper.class);
                //调用添加方法
                mapper.addTitle(titles);
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
    public void delTitleByNo(Integer id) {
        try {
            //获取mapper对象
            TitlesMapper mapper = SqlSessionUtil.getMapper(TitlesMapper.class);
            //调用删除方法
            mapper.delTitleByNo(id);
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
    public void updateTitle(Titles titles) {
        try {
            //获取mapper对象
            TitlesMapper mapper = SqlSessionUtil.getMapper(TitlesMapper.class);
            //调用更新方法
            mapper.updateTitle(titles);
            //提交事务
            SqlSessionUtil.commit();
        }catch (Exception e) {
            //事物回滚
            SqlSessionUtil.rollback();
            throw new RuntimeException(e);
        }finally {
            //在finally部分，释放资源
            SqlSessionUtil.closeSession();
        }
    }

    @Override
    public Titles selectTitlesByNo(Integer id) {
            try {
                //获取mapper对象
                TitlesMapper mapper = SqlSessionUtil.getMapper(TitlesMapper.class);
                //调用查询方法
                Titles titles = mapper.selectTitlesByNo(id);
                //返回查询结果
                return titles;
            } catch (Exception e) {
                throw new RuntimeException(e);
            } finally {
                SqlSessionUtil.closeSession();
            }
        }

//    @Override
//    public PageInfo<Titles> getTitlesByName(Integer pageNum, Integer pageSize) {
//        try {
//            //创建StudentMapper对象
//            TitlesMapper mapper = SqlSessionUtil.getMapper(TitlesMapper.class);
//            //使用pageHelper设置查询当前页码和每页显示的条数
//            PageHelper.startPage(pageNum, pageSize);
//            //调用Mapper中的查询方法
//            List<Titles> titlesList = mapper.selectTitlesByName();
//            //创建PageInfo对象
//            PageInfo<Titles> pageInfo = new PageInfo<>(titlesList);
//            //返回查询结果
//            return pageInfo;
//        } catch (Exception e) {
//            throw new RuntimeException(e);
//        } finally {
//            SqlSessionUtil.closeSession();
//        }
//    }

}
