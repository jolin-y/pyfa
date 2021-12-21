package com.ruoyi.drdc.service.impl;


import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.drdc.domain.CGjZrjsyxs;
import com.ruoyi.drdc.mapper.CGjZrjsyxsMapper;
import com.ruoyi.drdc.service.ICGjZrjsyxsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 高教-专任教师与学生Service业务层处理
 * 
 * @author ruoyi
 * @date 2021-12-21
 */
@Service
public class CGjZrjsyxsServiceImpl implements ICGjZrjsyxsService
{
    @Autowired
    private CGjZrjsyxsMapper cGjZrjsyxsMapper;

    /**
     * 查询高教-专任教师与学生
     * 
     * @param zrjsyxsId 高教-专任教师与学生主键
     * @return 高教-专任教师与学生
     */
    @Override
    public CGjZrjsyxs selectCGjZrjsyxsByZrjsyxsId(Long zrjsyxsId)
    {
        return cGjZrjsyxsMapper.selectCGjZrjsyxsByZrjsyxsId(zrjsyxsId);
    }

    /**
     * 查询高教-专任教师与学生列表
     * 
     * @param cGjZrjsyxs 高教-专任教师与学生
     * @return 高教-专任教师与学生
     */
    @Override
    public List<CGjZrjsyxs> selectCGjZrjsyxsList(CGjZrjsyxs cGjZrjsyxs)
    {
        return cGjZrjsyxsMapper.selectCGjZrjsyxsList(cGjZrjsyxs);
    }

    /**
     * 新增高教-专任教师与学生
     * 
     * @param cGjZrjsyxs 高教-专任教师与学生
     * @return 结果
     */
    @Override
    public int insertCGjZrjsyxs(CGjZrjsyxs cGjZrjsyxs)
    {
        cGjZrjsyxs.setCreateTime(DateUtils.getNowDate());
        return cGjZrjsyxsMapper.insertCGjZrjsyxs(cGjZrjsyxs);
    }

    /**
     * 修改高教-专任教师与学生
     * 
     * @param cGjZrjsyxs 高教-专任教师与学生
     * @return 结果
     */
    @Override
    public int updateCGjZrjsyxs(CGjZrjsyxs cGjZrjsyxs)
    {
        cGjZrjsyxs.setUpdateTime(DateUtils.getNowDate());
        return cGjZrjsyxsMapper.updateCGjZrjsyxs(cGjZrjsyxs);
    }

    /**
     * 批量删除高教-专任教师与学生
     * 
     * @param zrjsyxsIds 需要删除的高教-专任教师与学生主键
     * @return 结果
     */
    @Override
    public int deleteCGjZrjsyxsByZrjsyxsIds(Long[] zrjsyxsIds)
    {
        return cGjZrjsyxsMapper.deleteCGjZrjsyxsByZrjsyxsIds(zrjsyxsIds);
    }

    /**
     * 删除高教-专任教师与学生信息
     * 
     * @param zrjsyxsId 高教-专任教师与学生主键
     * @return 结果
     */
    @Override
    public int deleteCGjZrjsyxsByZrjsyxsId(Long zrjsyxsId)
    {
        return cGjZrjsyxsMapper.deleteCGjZrjsyxsByZrjsyxsId(zrjsyxsId);
    }
}
