package com.ruoyi.pyfa.service;

import com.ruoyi.pyfa.domain.CFangan;
import java.util.List;


/**
 * 培养方案Service接口
 * 
 * @author ruoyi
 * @date 2021-10-31
 */
public interface ICFanganService 
{
    /**
     * 查询培养方案
     *
     * @param id 培养方案主键
     * @return 培养方案
     */
    public CFangan selectCFanganById(String id);

    /**
     * 查询培养方案列表
     *
     * @param cFangan 培养方案
     * @return 培养方案集合
     */
    public List<CFangan> selectCFanganList(CFangan cFangan);

    /**
     * 新增培养方案
     *
     * @param cFangan 培养方案
     * @return 结果
     */
    public int insertCFangan(CFangan cFangan);

    /**
     * 修改培养方案
     *
     * @param cFangan 培养方案
     * @return 结果
     */
    public int updateCFangan(CFangan cFangan);

    /**
     * 批量删除培养方案
     *
     * @param ids 需要删除的培养方案主键集合
     * @return 结果
     */
    public int deleteCFanganByIds(String[] ids);

    /**
     * 删除培养方案信息
     *
     * @param id 培养方案主键
     * @return 结果
     */
    public int deleteCFanganById(String id);
}
