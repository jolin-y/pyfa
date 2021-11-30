package com.ruoyi.pyfa.service;


import com.ruoyi.pyfa.domain.CPyByyq;

import java.util.List;

/**
 * 毕业要求Service接口
 * 
 * @author ruoyi
 * @date 2021-11-27
 */
public interface ICPyByyqService 
{
    /**
     * 查询毕业要求
     * 
     * @param byyqId 毕业要求主键
     * @return 毕业要求
     */
    public CPyByyq selectCPyByyqByByyqId(Long byyqId);

    /**
     * 查询毕业要求列表
     * 
     * @param cPyByyq 毕业要求
     * @return 毕业要求集合
     */
    public List<CPyByyq> selectCPyByyqList(CPyByyq cPyByyq);

    /**
     * 新增毕业要求
     * 
     * @param cPyByyq 毕业要求
     * @return 结果
     */
    public int insertCPyByyq(CPyByyq cPyByyq);

    /**
     * 修改毕业要求
     * 
     * @param cPyByyq 毕业要求
     * @return 结果
     */
    public int updateCPyByyq(CPyByyq cPyByyq);

    /**
     * 批量删除毕业要求
     * 
     * @param byyqIds 需要删除的毕业要求主键集合
     * @return 结果
     */
    public int deleteCPyByyqByByyqIds(Long[] byyqIds);

    /**
     * 删除毕业要求信息
     * 
     * @param byyqId 毕业要求主键
     * @return 结果
     */
    public int deleteCPyByyqByByyqId(Long byyqId);


//    /**
//     * 构建前端所需要树结构
//     *
//     * @param byyqs 毕业要求列表
//     * @return 树结构列表
//     */
//    public List<CPyByyq> buildByyqTree(List<CPyByyq> byyqs);
//
//    /**
//     * 构建前端所需要下拉树结构
//     *
//     * @param byyqs 毕业要求列表
//     * @return 下拉树结构列表
//     */
//    public List<TreeSelect> buildByyqTreeSelect(List<CPyByyq> byyqs);
//
//    /**
//     * 是否存在部门子节点
//     *
//     * @param byyqId 部门ID
//     * @return 结果
//     */
//    public boolean hasChildByByyqId(Long byyqId);
//
//    /**
//     * 校验部门名称是否唯一
//     *
//     * @param cPyByyq 部门信息
//     * @return 结果
//     */
//    public String checkByyqNameUnique(CPyByyq cPyByyq);


}
