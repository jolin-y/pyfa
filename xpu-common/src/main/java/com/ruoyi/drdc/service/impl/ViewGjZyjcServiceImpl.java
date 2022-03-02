package com.ruoyi.drdc.service.impl;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.drdc.domain.ViewGjZyjc;
import com.ruoyi.drdc.mapper.ViewGjZyjcMapper;
import com.ruoyi.drdc.service.IViewGjZyjcService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 专业监测Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-01-04
 */
@Service
public class ViewGjZyjcServiceImpl implements IViewGjZyjcService 
{
    @Autowired
    private ViewGjZyjcMapper viewGjZyjcMapper;

    /**
     * 查询专业监测
     * 
     * @param zyId 专业监测主键
     * @return 专业监测
     */
    @Override
    public ViewGjZyjc selectViewGjZyjcByZyId(Long zyId)
    {
        return viewGjZyjcMapper.selectViewGjZyjcByZyId(zyId);
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
     * @param zyIds 需要删除的专业监测主键
     * @return 结果
     */
    @Override
    public int deleteViewGjZyjcByZyIds(Long[] zyIds)
    {
        return viewGjZyjcMapper.deleteViewGjZyjcByZyIds(zyIds);
    }

    /**
     * 删除专业监测信息
     * 
     * @param zyId 专业监测主键
     * @return 结果
     */
    @Override
    public int deleteViewGjZyjcByZyId(Long zyId)
    {
        return viewGjZyjcMapper.deleteViewGjZyjcByZyId(zyId);
    }
}
