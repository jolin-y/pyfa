package com.ruoyi.drdc.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.drdc.mapper.CGjZsqkMapper;
import com.ruoyi.drdc.domain.CGjZsqk;
import com.ruoyi.drdc.service.ICGjZsqkService;

/**
 * 高教-招生情况Service业务层处理
 * 
 * @author ruoyi
 * @date 2021-12-21
 */
@Service
public class CGjZsqkServiceImpl implements ICGjZsqkService 
{
    @Autowired
    private CGjZsqkMapper cGjZsqkMapper;

    /**
     * 查询高教-招生情况
     * 
     * @param zsqkId 高教-招生情况主键
     * @return 高教-招生情况
     */
    @Override
    public CGjZsqk selectCGjZsqkByZsqkId(Long zsqkId)
    {
        return cGjZsqkMapper.selectCGjZsqkByZsqkId(zsqkId);
    }

    /**
     * 查询高教-招生情况列表
     * 
     * @param cGjZsqk 高教-招生情况
     * @return 高教-招生情况
     */
    @Override
    public List<CGjZsqk> selectCGjZsqkList(CGjZsqk cGjZsqk)
    {
        return cGjZsqkMapper.selectCGjZsqkList(cGjZsqk);
    }

    /**
     * 新增高教-招生情况
     * 
     * @param cGjZsqk 高教-招生情况
     * @return 结果
     */
    @Override
    public int insertCGjZsqk(CGjZsqk cGjZsqk)
    {
        cGjZsqk.setCreateTime(DateUtils.getNowDate());
        return cGjZsqkMapper.insertCGjZsqk(cGjZsqk);
    }

    /**
     * 修改高教-招生情况
     * 
     * @param cGjZsqk 高教-招生情况
     * @return 结果
     */
    @Override
    public int updateCGjZsqk(CGjZsqk cGjZsqk)
    {
        cGjZsqk.setUpdateTime(DateUtils.getNowDate());
        return cGjZsqkMapper.updateCGjZsqk(cGjZsqk);
    }

    /**
     * 批量删除高教-招生情况
     * 
     * @param zsqkIds 需要删除的高教-招生情况主键
     * @return 结果
     */
    @Override
    public int deleteCGjZsqkByZsqkIds(Long[] zsqkIds)
    {
        return cGjZsqkMapper.deleteCGjZsqkByZsqkIds(zsqkIds);
    }

    /**
     * 删除高教-招生情况信息
     * 
     * @param zsqkId 高教-招生情况主键
     * @return 结果
     */
    @Override
    public int deleteCGjZsqkByZsqkId(Long zsqkId)
    {
        return cGjZsqkMapper.deleteCGjZsqkByZsqkId(zsqkId);
    }
}
