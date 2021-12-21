package com.ruoyi.drdc.service;

import java.util.List;
import com.ruoyi.drdc.domain.CGjZsqk;

/**
 * 高教-招生情况Service接口
 * 
 * @author ruoyi
 * @date 2021-12-21
 */
public interface ICGjZsqkService 
{
    /**
     * 查询高教-招生情况
     * 
     * @param zsqkId 高教-招生情况主键
     * @return 高教-招生情况
     */
    public CGjZsqk selectCGjZsqkByZsqkId(Long zsqkId);

    /**
     * 查询高教-招生情况列表
     * 
     * @param cGjZsqk 高教-招生情况
     * @return 高教-招生情况集合
     */
    public List<CGjZsqk> selectCGjZsqkList(CGjZsqk cGjZsqk);

    /**
     * 新增高教-招生情况
     * 
     * @param cGjZsqk 高教-招生情况
     * @return 结果
     */
    public int insertCGjZsqk(CGjZsqk cGjZsqk);

    /**
     * 修改高教-招生情况
     * 
     * @param cGjZsqk 高教-招生情况
     * @return 结果
     */
    public int updateCGjZsqk(CGjZsqk cGjZsqk);

    /**
     * 批量删除高教-招生情况
     * 
     * @param zsqkIds 需要删除的高教-招生情况主键集合
     * @return 结果
     */
    public int deleteCGjZsqkByZsqkIds(Long[] zsqkIds);

    /**
     * 删除高教-招生情况信息
     * 
     * @param zsqkId 高教-招生情况主键
     * @return 结果
     */
    public int deleteCGjZsqkByZsqkId(Long zsqkId);
}
