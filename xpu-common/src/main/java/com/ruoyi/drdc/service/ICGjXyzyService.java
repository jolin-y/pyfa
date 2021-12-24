package com.ruoyi.drdc.service;

import com.ruoyi.common.core.domain.TreeSelect;
import com.ruoyi.common.core.domain.entity.CGjXyzy;

import java.util.List;

/**
 * 学院专业Service接口
 * 
 * @author ruoyi
 * @date 2021-12-15
 */
public interface ICGjXyzyService 
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
     * 批量删除学院专业
     * 
     * @param xyzyIds 需要删除的学院专业主键集合
     * @return 结果
     */
    public int deleteCGjXyzyByXyzyIds(Long[] xyzyIds);

    /**
     * 删除学院专业信息
     * 
     * @param xyzyId 学院专业主键
     * @return 结果
     */
    public int deleteCGjXyzyByXyzyId(Long xyzyId);



    /**
     * 查询
     *
     * @param cGjXyzy 学院专业代码
     * @return 学院专业
     */
//    public CGjXyzy selectCGjXyzyByXyzyDaima(String xyzyDaima);
    public List<CGjXyzy> selectCGjXyzyByXyzyDaima(CGjXyzy cGjXyzy);


//    public List<CGjXyzy> getChildList(List<CGjXyzy> list, CGjXyzy t);




    /**
     * 构建前端所需要树结构
     *
     * @param depts 部门列表
     * @return 树结构列表
     */
    public List<CGjXyzy> buildXyzyTree(List<CGjXyzy> cGjXyzys);

    /**
     * 构建前端所需要下拉树结构
     *
     * @param cGjXyzys 部门列表
     * @return 下拉树结构列表
     */
    public List<TreeSelect> buildXyzyTreeSelect(List<CGjXyzy> cGjXyzys);
}
