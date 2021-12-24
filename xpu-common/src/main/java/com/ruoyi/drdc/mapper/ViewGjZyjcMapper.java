package com.ruoyi.drdc.mapper;

import java.util.List;
import com.ruoyi.drdc.domain.ViewGjZyjc;

/**
 * 专业监测Mapper接口
 * 
 * @author ruoyi
 * @date 2021-12-23
 */
public interface ViewGjZyjcMapper 
{
    /**
     * 查询专业监测
     * 
     * @param xyzyId 专业监测主键
     * @return 专业监测
     */
    public ViewGjZyjc selectViewGjZyjcByXyzyId(Long xyzyId);

    /**
     * 查询专业监测列表
     * 
     * @param viewGjZyjc 专业监测
     * @return 专业监测集合
     */
    public List<ViewGjZyjc> selectViewGjZyjcList(ViewGjZyjc viewGjZyjc);

    /**
     * 新增专业监测
     * 
     * @param viewGjZyjc 专业监测
     * @return 结果
     */
    public int insertViewGjZyjc(ViewGjZyjc viewGjZyjc);

    /**
     * 修改专业监测
     * 
     * @param viewGjZyjc 专业监测
     * @return 结果
     */
    public int updateViewGjZyjc(ViewGjZyjc viewGjZyjc);

    /**
     * 删除专业监测
     * 
     * @param xyzyId 专业监测主键
     * @return 结果
     */
    public int deleteViewGjZyjcByXyzyId(Long xyzyId);

    /**
     * 批量删除专业监测
     * 
     * @param xyzyIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteViewGjZyjcByXyzyIds(Long[] xyzyIds);
}
