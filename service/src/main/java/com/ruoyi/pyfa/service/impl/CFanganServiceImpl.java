package com.ruoyi.pyfa.service.impl;

import java.util.List;

import com.ruoyi.pyfa.domain.CFangan;
import com.ruoyi.pyfa.mapper.CFanganMapper;
import com.ruoyi.pyfa.service.ICFanganService;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;




/**
 * 培养方案Service业务层处理
 * 
 * @author ruoyi
 * @date 2021-10-31
 */
@Service
public class CFanganServiceImpl implements ICFanganService
{
//    @Autowired
    @Autowired(required=false)
    private CFanganMapper cFanganMapper;

    /**
     *
     * 查询培养方案
     * 
     * @param id 培养方案主键
     * @return 培养方案
     */
    @Override
    public CFangan selectCFanganById(String id)
    {
        return cFanganMapper.selectCFanganById(id);
    }

    /**
     * 查询培养方案列表
     * 
     * @param cFangan 培养方案
     * @return 培养方案
     */
    @Override
    public List<CFangan> selectCFanganList(CFangan cFangan)
    {
        return cFanganMapper.selectCFanganList(cFangan);
    }

    /**
     * 新增培养方案
     * 
     * @param cFangan 培养方案
     * @return 结果
     */
    @Override
    public int insertCFangan(CFangan cFangan)
    {
        return cFanganMapper.insertCFangan(cFangan);
    }

    /**
     * 修改培养方案
     * 
     * @param cFangan 培养方案
     * @return 结果
     */
    @Override
    public int updateCFangan(CFangan cFangan)
    {
        return cFanganMapper.updateCFangan(cFangan);
    }

    /**
     * 批量删除培养方案
     * 
     * @param ids 需要删除的培养方案主键
     * @return 结果
     */
    @Override
    public int deleteCFanganByIds(String[] ids)
    {
        return cFanganMapper.deleteCFanganByIds(ids);
    }

    /**
     * 删除培养方案信息
     * 
     * @param id 培养方案主键
     * @return 结果
     */
    @Override
    public int deleteCFanganById(String id)
    {
        return cFanganMapper.deleteCFanganById(id);
    }
}
