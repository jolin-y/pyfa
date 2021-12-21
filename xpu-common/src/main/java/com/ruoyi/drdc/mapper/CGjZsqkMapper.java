package com.ruoyi.drdc.mapper;

import java.util.List;
import com.ruoyi.drdc.domain.CGjZsqk;

/**
 * 高教-招生情况Mapper接口
 * 
 * @author ruoyi
 * @date 2021-12-21
 */
public interface CGjZsqkMapper 
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
     * 删除高教-招生情况
     * 
     * @param zsqkId 高教-招生情况主键
     * @return 结果
     */
    public int deleteCGjZsqkByZsqkId(Long zsqkId);

    /**
     * 批量删除高教-招生情况
     * 
     * @param zsqkIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCGjZsqkByZsqkIds(Long[] zsqkIds);
}
