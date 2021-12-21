package com.ruoyi.drdc.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 高教-毕业与就业对象 c_gj_byyjy
 * 
 * @author ruoyi
 * @date 2021-12-21
 */
public class CGjByyjy extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 毕业与就业id */
    private Long byyjyId;

    /** 学院专业id */
    @Excel(name = "学院专业id")
    private Long xyzyId;

    /** 毕业率 */
    @Excel(name = "毕业率")
    private Long byl;

    /** 学位授予率 */
    @Excel(name = "学位授予率")
    private Long xwsyl;

    /** 毕业生数 */
    @Excel(name = "毕业生数")
    private Long bysNum;

    /** 初次就业率 */
    @Excel(name = "初次就业率")
    private Long ccjyl;

    /** 过程就业率 */
    @Excel(name = "过程就业率")
    private Long gcjyl;

    /** 毕业年份(届) */
    @Excel(name = "毕业年份(届)")
    private String byYear;

    public void setByyjyId(Long byyjyId) 
    {
        this.byyjyId = byyjyId;
    }

    public Long getByyjyId() 
    {
        return byyjyId;
    }
    public void setXyzyId(Long xyzyId) 
    {
        this.xyzyId = xyzyId;
    }

    public Long getXyzyId() 
    {
        return xyzyId;
    }
    public void setByl(Long byl) 
    {
        this.byl = byl;
    }

    public Long getByl() 
    {
        return byl;
    }
    public void setXwsyl(Long xwsyl) 
    {
        this.xwsyl = xwsyl;
    }

    public Long getXwsyl() 
    {
        return xwsyl;
    }
    public void setBysNum(Long bysNum) 
    {
        this.bysNum = bysNum;
    }

    public Long getBysNum() 
    {
        return bysNum;
    }
    public void setCcjyl(Long ccjyl) 
    {
        this.ccjyl = ccjyl;
    }

    public Long getCcjyl() 
    {
        return ccjyl;
    }
    public void setGcjyl(Long gcjyl) 
    {
        this.gcjyl = gcjyl;
    }

    public Long getGcjyl() 
    {
        return gcjyl;
    }
    public void setByYear(String byYear) 
    {
        this.byYear = byYear;
    }

    public String getByYear() 
    {
        return byYear;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("byyjyId", getByyjyId())
            .append("xyzyId", getXyzyId())
            .append("byl", getByl())
            .append("xwsyl", getXwsyl())
            .append("bysNum", getBysNum())
            .append("ccjyl", getCcjyl())
            .append("gcjyl", getGcjyl())
            .append("byYear", getByYear())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
