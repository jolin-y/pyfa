package com.ruoyi.drdc.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.drdc.mapper.ViewGjZyjcMapper;
import com.ruoyi.drdc.domain.ViewGjZyjc;
import com.ruoyi.drdc.service.IViewGjZyjcService;

/**
 * 专业监测Service业务层处理
 * 
 * @author ruoyi
 * @date 2021-12-23
 */
@Service
public class ViewGjZyjcServiceImpl implements IViewGjZyjcService 
{
    @Autowired
    private ViewGjZyjcMapper viewGjZyjcMapper;

    /**
     * 查询专业监测
     * 
     * @param xyzyId 专业监测主键
     * @return 专业监测
     */
    @Override
    public ViewGjZyjc selectViewGjZyjcByXyzyId(Long xyzyId)
    {
        return viewGjZyjcMapper.selectViewGjZyjcByXyzyId(xyzyId);
    }

    /**
     * 查询专业监测列表
     * 
     * @param viewGjZyjc 专业监测
     * @return 专业监测
     */
    @Override
    public List<ViewGjZyjc> selectViewGjZyjcList(ViewGjZyjc viewGjZyjc)
    {
        return viewGjZyjcMapper.selectViewGjZyjcList(viewGjZyjc);
    }

    /**
     * 新增专业监测
     * 
     * @param viewGjZyjc 专业监测
     * @return 结果
     */
    @Override
    public int insertViewGjZyjc(ViewGjZyjc viewGjZyjc)
    {
        viewGjZyjc.setCreateTime(DateUtils.getNowDate());
        return viewGjZyjcMapper.insertViewGjZyjc(viewGjZyjc);
    }

    /**
     * 修改专业监测
     * 
     * @param viewGjZyjc 专业监测
     * @return 结果
     */
    @Override
    public int updateViewGjZyjc(ViewGjZyjc viewGjZyjc)
    {
        viewGjZyjc.setUpdateTime(DateUtils.getNowDate());
        return viewGjZyjcMapper.updateViewGjZyjc(viewGjZyjc);
    }

    /**
     * 批量删除专业监测
     * 
     * @param xyzyIds 需要删除的专业监测主键
     * @return 结果
     */
    @Override
    public int deleteViewGjZyjcByXyzyIds(Long[] xyzyIds)
    {
        return viewGjZyjcMapper.deleteViewGjZyjcByXyzyIds(xyzyIds);
    }

    /**
     * 删除专业监测信息
     * 
     * @param xyzyId 专业监测主键
     * @return 结果
     */
    @Override
    public int deleteViewGjZyjcByXyzyId(Long xyzyId)
    {
        return viewGjZyjcMapper.deleteViewGjZyjcByXyzyId(xyzyId);
    }
}
