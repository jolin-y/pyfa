package com.ruoyi.drdc.mapper;

import com.ruoyi.drdc.domain.CGjZysz;

import java.util.List;

/**
 * 专业设置2Mapper接口
 * 
 * @author ruoyi
 * @date 2021-12-28
 */
public interface CGjZyszMapper 
{
    /**
     * 查询专业设置2
     * 
     * @param zyId 专业设置2主键
     * @return 专业设置2
     */
    public CGjZysz selectCGjZyszByZyId(Long zyId);

    /**
     * 查询专业设置2列表
     * 
     * @param cGjZysz 专业设置2
     * @return 专业设置2集合
     */
    public List<CGjZysz> selectCGjZyszList(CGjZysz cGjZysz);

    /**
     * 新增专业设置2
     * 
     * @param cGjZysz 专业设置2
     * @return 结果
     */
    public int insertCGjZysz(CGjZysz cGjZysz);

    /**
     * 修改专业设置2
     * 
     * @param cGjZysz 专业设置2
     * @return 结果
     */
    public int updateCGjZysz(CGjZysz cGjZysz);

    /**
     * 删除专业设置2
     * 
     * @param zyId 专业设置2主键
     * @return 结果
     */
    public int deleteCGjZyszByZyId(Long zyId);

    /**
     * 批量删除专业设置2
     * 
     * @param zyIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCGjZyszByZyIds(Long[] zyIds);


    /**
     * 查询所有专业
     *
     * @return 专业列表
     */
    public List<CGjZysz> selectCGjZyszAll();

    /**
     * 根据用户ID获取专业选择框列表
     *
     * @param zsqkId 用户ID
     * @return 选中专业ID列表
     */
    public List<Integer> selectCGjZyszListByZsqkId(Long zsqkId);
}
