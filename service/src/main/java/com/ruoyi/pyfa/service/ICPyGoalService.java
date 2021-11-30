package com.ruoyi.pyfa.service;

import com.ruoyi.pyfa.domain.CPyGoal;

import java.util.List;

/**
 * 培养目标表Service接口
 * 
 * @author ruoyi
 * @date 2021-11-11
 */
public interface ICPyGoalService 
{
    /**
     * 查询培养目标表
     * 
     * @param goalId 培养目标表主键
     * @return 培养目标表
     */
    public CPyGoal selectCPyGoalByGoalId(Long goalId);

    /**
     * 培养方案id 查询培养目标表
     *
     * @param pyfaId 培养目标表培养方案id
     * @return 培养目标表
     */
    public CPyGoal selectCPyGoalByPyfaId(Long pyfaId);


    /**
     * 查询培养目标表列表
     * 
     * @param cPyGoal 培养目标表
     * @return 培养目标表集合
     */
    public List<CPyGoal> selectCPyGoalList(CPyGoal cPyGoal);

    /**
     * 新增培养目标表
     * 
     * @param cPyGoal 培养目标表
     * @return 结果
     */
    public int insertCPyGoal(CPyGoal cPyGoal);

    /**
     * 修改培养目标表
     * 
     * @param cPyGoal 培养目标表
     * @return 结果
     */
    public int updateCPyGoal(CPyGoal cPyGoal);

    /**
     * 批量删除培养目标表
     * 
     * @param goalIds 需要删除的培养目标表主键集合
     * @return 结果
     */
    public int deleteCPyGoalByGoalIds(Long[] goalIds);

    /**
     * 删除培养目标表信息
     * 
     * @param goalId 培养目标表主键
     * @return 结果
     */
    public int deleteCPyGoalByGoalId(Long goalId);
}
