package com.ruoyi.pyfa.service.impl;


import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.pyfa.domain.CPyGoal;
import com.ruoyi.pyfa.mapper.CPyGoalMapper;
import com.ruoyi.pyfa.service.ICPyGoalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
 * 培养目标表Service业务层处理
 * 
 * @author ruoyi
 * @date 2021-11-11
 */
@Service
public class CPyGoalServiceImpl implements ICPyGoalService
{
    @Autowired
    private CPyGoalMapper cPyGoalMapper;

    /**
     * 查询培养目标表
     * 
     * @param goalId 培养目标表主键
     * @return 培养目标表
     */
    @Override
    public CPyGoal selectCPyGoalByGoalId(Long goalId)
    {
        return cPyGoalMapper.selectCPyGoalByGoalId(goalId);
    }


    /**
     * 培养方案id 查询培养目标表
     *
     * @param pyfaId 培养目标表 培养方案id
     * @return 培养目标表
     */
    @Override
    public CPyGoal selectCPyGoalByPyfaId(Long pyfaId)
    {
        return cPyGoalMapper.selectCPyGoalByPyfaId(pyfaId);
    }


    /**
     * 查询培养目标表列表
     * 
     * @param cPyGoal 培养目标表
     * @return 培养目标表
     */
    @Override
    public List<CPyGoal> selectCPyGoalList(CPyGoal cPyGoal)
    {
        return cPyGoalMapper.selectCPyGoalList(cPyGoal);
    }

    /**
     * 新增培养目标表
     * 
     * @param cPyGoal 培养目标表
     * @return 结果
     */
    @Override
    public int insertCPyGoal(CPyGoal cPyGoal)
    {
        return cPyGoalMapper.insertCPyGoal(cPyGoal);
    }

    /**
     * 修改培养目标表
     * 
     * @param cPyGoal 培养目标表
     * @return 结果
     */
    @Override
    public int updateCPyGoal(CPyGoal cPyGoal)
    {
        cPyGoal.setUpdateTime(DateUtils.getNowDate());
        return cPyGoalMapper.updateCPyGoal(cPyGoal);
    }

    /**
     * 批量删除培养目标表
     * 
     * @param goalIds 需要删除的培养目标表主键
     * @return 结果
     */
    @Override
    public int deleteCPyGoalByGoalIds(Long[] goalIds)
    {
        return cPyGoalMapper.deleteCPyGoalByGoalIds(goalIds);
    }

    /**
     * 删除培养目标表信息
     * 
     * @param goalId 培养目标表主键
     * @return 结果
     */
    @Override
    public int deleteCPyGoalByGoalId(Long goalId)
    {
        return cPyGoalMapper.deleteCPyGoalByGoalId(goalId);
    }
}
