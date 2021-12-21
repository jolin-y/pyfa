package com.ruoyi.drdc.service;


import com.ruoyi.drdc.domain.CGjZrjsyxs;

import java.util.List;

/**
 * 高教-专任教师与学生Service接口
 * 
 * @author ruoyi
 * @date 2021-12-21
 */
public interface ICGjZrjsyxsService 
{
    /**
     * 查询高教-专任教师与学生
     * 
     * @param zrjsyxsId 高教-专任教师与学生主键
     * @return 高教-专任教师与学生
     */
    public CGjZrjsyxs selectCGjZrjsyxsByZrjsyxsId(Long zrjsyxsId);

    /**
     * 查询高教-专任教师与学生列表
     * 
     * @param cGjZrjsyxs 高教-专任教师与学生
     * @return 高教-专任教师与学生集合
     */
    public List<CGjZrjsyxs> selectCGjZrjsyxsList(CGjZrjsyxs cGjZrjsyxs);

    /**
     * 新增高教-专任教师与学生
     * 
     * @param cGjZrjsyxs 高教-专任教师与学生
     * @return 结果
     */
    public int insertCGjZrjsyxs(CGjZrjsyxs cGjZrjsyxs);

    /**
     * 修改高教-专任教师与学生
     * 
     * @param cGjZrjsyxs 高教-专任教师与学生
     * @return 结果
     */
    public int updateCGjZrjsyxs(CGjZrjsyxs cGjZrjsyxs);

    /**
     * 批量删除高教-专任教师与学生
     * 
     * @param zrjsyxsIds 需要删除的高教-专任教师与学生主键集合
     * @return 结果
     */
    public int deleteCGjZrjsyxsByZrjsyxsIds(Long[] zrjsyxsIds);

    /**
     * 删除高教-专任教师与学生信息
     * 
     * @param zrjsyxsId 高教-专任教师与学生主键
     * @return 结果
     */
    public int deleteCGjZrjsyxsByZrjsyxsId(Long zrjsyxsId);
}
