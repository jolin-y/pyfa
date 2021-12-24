package com.ruoyi.drdc.service.impl;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.drdc.domain.CGjByyjy;
import com.ruoyi.drdc.mapper.CGjByyjyMapper;
import com.ruoyi.drdc.service.ICGjByyjyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 高教-毕业与就业Service业务层处理
 * 
 * @author ruoyi
 * @date 2021-12-21
 */
@Service
public class CGjByyjyServiceImpl implements ICGjByyjyService 
{
    @Autowired
    private CGjByyjyMapper cGjByyjyMapper;


    /**
     * 查询高教-毕业与就业
     * 
     * @param byyjyId 高教-毕业与就业主键
     * @return 高教-毕业与就业
     */
    @Override
    public CGjByyjy selectCGjByyjyByByyjyId(Long byyjyId)
    {
        return cGjByyjyMapper.selectCGjByyjyByByyjyId(byyjyId);
    }

    /**
     * 查询高教-毕业与就业列表
     * 
     * @param cGjByyjy 高教-毕业与就业
     * @return 高教-毕业与就业
     */
    @Override
    public List<CGjByyjy> selectCGjByyjyList(CGjByyjy cGjByyjy)
    {
        return cGjByyjyMapper.selectCGjByyjyList(cGjByyjy);
    }

    /**
     * 新增高教-毕业与就业
     * 
     * @param cGjByyjy 高教-毕业与就业
     * @return 结果
     */
    @Override
    public int insertCGjByyjy(CGjByyjy cGjByyjy)
    {
        cGjByyjy.setCreateTime(DateUtils.getNowDate());
        return cGjByyjyMapper.insertCGjByyjy(cGjByyjy);
    }

    /**
     * 修改高教-毕业与就业
     * 
     * @param cGjByyjy 高教-毕业与就业
     * @return 结果
     */
    @Override
    public int updateCGjByyjy(CGjByyjy cGjByyjy)
    {
        cGjByyjy.setUpdateTime(DateUtils.getNowDate());
        return cGjByyjyMapper.updateCGjByyjy(cGjByyjy);
    }

    /**
     * 批量删除高教-毕业与就业
     * 
     * @param byyjyIds 需要删除的高教-毕业与就业主键
     * @return 结果
     */
    @Override
    public int deleteCGjByyjyByByyjyIds(Long[] byyjyIds)
    {
        return cGjByyjyMapper.deleteCGjByyjyByByyjyIds(byyjyIds);
    }

    /**
     * 删除高教-毕业与就业信息
     * 
     * @param byyjyId 高教-毕业与就业主键
     * @return 结果
     */
    @Override
    public int deleteCGjByyjyByByyjyId(Long byyjyId)
    {
        return cGjByyjyMapper.deleteCGjByyjyByByyjyId(byyjyId);
    }
}
