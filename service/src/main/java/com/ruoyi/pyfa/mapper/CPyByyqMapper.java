package com.ruoyi.pyfa.mapper;


import com.ruoyi.pyfa.domain.CPyByyq;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 毕业要求Mapper接口
 * 
 * @author ruoyi
 * @date 2021-11-27
 */
public interface CPyByyqMapper 
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
     * 删除毕业要求
     * 
     * @param byyqId 毕业要求主键
     * @return 结果
     */
    public int deleteCPyByyqByByyqId(Long byyqId);

    /**
     * 批量删除毕业要求
     * 
     * @param byyqIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCPyByyqByByyqIds(Long[] byyqIds);



    /**
     * 根据ID查询所有子毕业要求
     *
     * @param byyqId 毕业要求ID
     * @return 毕业要求列表
     */
    public List<CPyByyq> selectChildrenByyqById(Long byyqId);

    /**
     * 修改子元素关系
     *
     * @param byyqs 子元素
     * @return 结果
     */
    public int updateByyqChildren(@Param("byyqs") List<CPyByyq> byyqs);


    
    /**
     * 是否存在子节点
     *
     * @param byyqId 毕业要求ID
     * @return 结果
     */
    public int hasChildByByyqId(Long byyqId);

    /**
     * 校验毕业要求名称是否唯一
     *
     * @param byyqName 毕业要求名称
     * @param parentId 父毕业要求ID
     * @return 结果
     */
    public CPyByyq checkByyqNameUnique(@Param("byyqName") String byyqName, @Param("parentId") Long parentId);
    
}
