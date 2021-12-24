package com.ruoyi.drdc.mapper;

import com.ruoyi.common.core.domain.entity.CGjXyzy;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 学院专业Mapper接口
 * 
 * @author ruoyi
 * @date 2021-12-15
 */
public interface CGjXyzyMapper 
{
    /**
     * 查询学院专业
     * 
     * @param xyzyId 学院专业主键
     * @return 学院专业
     */
    public CGjXyzy selectCGjXyzyByXyzyId(Long xyzyId);

    /**
     * 查询学院专业列表
     * 
     * @param cGjXyzy 学院专业
     * @return 学院专业集合
     */
    public List<CGjXyzy> selectCGjXyzyList(CGjXyzy cGjXyzy);

    /**
     * 新增学院专业
     * 
     * @param cGjXyzy 学院专业
     * @return 结果
     */
    public int insertCGjXyzy(CGjXyzy cGjXyzy);

    /**
     * 修改学院专业
     * 
     * @param cGjXyzy 学院专业
     * @return 结果
     */
    public int updateCGjXyzy(CGjXyzy cGjXyzy);

    /**
     * 删除学院专业
     * 
     * @param xyzyId 学院专业主键
     * @return 结果
     */
    public int deleteCGjXyzyByXyzyId(Long xyzyId);

    /**
     * 批量删除学院专业
     * 
     * @param xyzyIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCGjXyzyByXyzyIds(Long[] xyzyIds);




    List<CGjXyzy> selectCGjXyzyByXyzyDaima(CGjXyzy cGjXyzy);

    /**
     * 根据ID查询所有子毕业要求
     *
     * @param xyzyId 毕业要求ID
     * @return 毕业要求列表
     */
    public List<CGjXyzy> selectChildrenXyzyById(Long xyzyId);

    /**
     * 修改子元素关系
     *
     * @param xyzys 子元素
     * @return 结果
     */
    public int updateXyzyChildren(@Param("xyzys") List<CGjXyzy> xyzys);



}
