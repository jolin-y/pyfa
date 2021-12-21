package com.ruoyi.drdc.mapper;

import java.util.List;
import com.ruoyi.drdc.domain.CGjByyjy;

/**
 * 高教-毕业与就业Mapper接口
 * 
 * @author ruoyi
 * @date 2021-12-21
 */
public interface CGjByyjyMapper 
{
    /**
     * 查询高教-毕业与就业
     * 
     * @param byyjyId 高教-毕业与就业主键
     * @return 高教-毕业与就业
     */
    public CGjByyjy selectCGjByyjyByByyjyId(Long byyjyId);

    /**
     * 查询高教-毕业与就业列表
     * 
     * @param cGjByyjy 高教-毕业与就业
     * @return 高教-毕业与就业集合
     */
    public List<CGjByyjy> selectCGjByyjyList(CGjByyjy cGjByyjy);

    /**
     * 新增高教-毕业与就业
     * 
     * @param cGjByyjy 高教-毕业与就业
     * @return 结果
     */
    public int insertCGjByyjy(CGjByyjy cGjByyjy);

    /**
     * 修改高教-毕业与就业
     * 
     * @param cGjByyjy 高教-毕业与就业
     * @return 结果
     */
    public int updateCGjByyjy(CGjByyjy cGjByyjy);

    /**
     * 删除高教-毕业与就业
     * 
     * @param byyjyId 高教-毕业与就业主键
     * @return 结果
     */
    public int deleteCGjByyjyByByyjyId(Long byyjyId);

    /**
     * 批量删除高教-毕业与就业
     * 
     * @param byyjyIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCGjByyjyByByyjyIds(Long[] byyjyIds);
}
