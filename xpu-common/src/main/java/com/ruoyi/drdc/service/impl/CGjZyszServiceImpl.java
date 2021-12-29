package com.ruoyi.drdc.service.impl;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.drdc.domain.CGjZysz;
import com.ruoyi.drdc.mapper.CGjZyszMapper;
import com.ruoyi.drdc.service.ICGjZyszService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 专业设置2Service业务层处理
 * 
 * @author ruoyi
 * @date 2021-12-28
 */
@Service
public class CGjZyszServiceImpl implements ICGjZyszService 
{
    @Autowired
    private CGjZyszMapper cGjZyszMapper;

    /**
     * 查询专业设置2
     * 
     * @param zyId 专业设置2主键
     * @return 专业设置2
     */
    @Override
    public CGjZysz selectCGjZyszByZyId(Long zyId)
    {
        return cGjZyszMapper.selectCGjZyszByZyId(zyId);
    }

    /**
     * 查询专业设置2列表
     * 
     * @param cGjZysz 专业设置2
     * @return 专业设置2
     */
    @Override
    public List<CGjZysz> selectCGjZyszList(CGjZysz cGjZysz)
    {
        return cGjZyszMapper.selectCGjZyszList(cGjZysz);
    }

    /**
     * 新增专业设置2
     * 
     * @param cGjZysz 专业设置2
     * @return 结果
     */
    @Override
    public int insertCGjZysz(CGjZysz cGjZysz)
    {
        cGjZysz.setCreateTime(DateUtils.getNowDate());
        return cGjZyszMapper.insertCGjZysz(cGjZysz);
    }

    /**
     * 修改专业设置2
     * 
     * @param cGjZysz 专业设置2
     * @return 结果
     */
    @Override
    public int updateCGjZysz(CGjZysz cGjZysz)
    {
        cGjZysz.setUpdateTime(DateUtils.getNowDate());
        return cGjZyszMapper.updateCGjZysz(cGjZysz);
    }

    /**
     * 批量删除专业设置2
     * 
     * @param zyIds 需要删除的专业设置2主键
     * @return 结果
     */
    @Override
    public int deleteCGjZyszByZyIds(Long[] zyIds)
    {
        return cGjZyszMapper.deleteCGjZyszByZyIds(zyIds);
    }

    /**
     * 删除专业设置2信息
     * 
     * @param zyId 专业设置2主键
     * @return 结果
     */
    @Override
    public int deleteCGjZyszByZyId(Long zyId)
    {
        return cGjZyszMapper.deleteCGjZyszByZyId(zyId);
    }

    /**
     * 查询所有专业
     *
     * @return 专业列表
     */
    @Override
    public List<CGjZysz> selectCGjZyszAll()
    {
        return cGjZyszMapper.selectCGjZyszAll();
    }



    /**
     * 根据用户ID获取岗位选择框列表
     *
     * @param zsqkId 用户ID
     * @return 选中岗位ID列表
     */
    @Override
    public List<Integer> selectCGjZyszListByZsqkId(Long zsqkId)
    {
        return cGjZyszMapper.selectCGjZyszListByZsqkId(zsqkId);
    }
}
