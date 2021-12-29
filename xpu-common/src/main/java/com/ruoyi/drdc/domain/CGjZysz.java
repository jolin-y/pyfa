package com.ruoyi.drdc.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import com.ruoyi.common.core.domain.entity.SysDept;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 专业设置2对象 c_gj_zysz
 * 
 * @author ruoyi
 * @date 2021-12-28
 */
public class CGjZysz extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 专业id(序号) */
    private Long zyId;

    /** 部门id */
    @Excel(name = "部门id")
    private Long deptId;

    /** 专业名称 */
    @Excel(name = "专业名称")
    private String zyName;

    /** 专业代码 */
    @Excel(name = "专业代码")
    private String xyzyZydm;

    /** 专业设置年份 */
    @Excel(name = "专业设置年份")
    private String zyCreatYear;

    /** 学科门类(字典) */
    @Excel(name = "学科门类(字典)")
    private String xkml;

    /** 专业类别(字典) */
    @Excel(name = "专业类别(字典)")
    private String zylb;

    /** 备注信息(字典) */
    @Excel(name = "备注信息(字典)")
    private String remarks;

    /** 显示顺序 */
    private Integer orderNum;

    /** 部门对象 */
    private SysDept dept;

    public void setZyId(Long zyId) 
    {
        this.zyId = zyId;
    }

    public Long getZyId() 
    {
        return zyId;
    }
    public void setDeptId(Long deptId) 
    {
        this.deptId = deptId;
    }

    public Long getDeptId() 
    {
        return deptId;
    }
    public void setZyName(String zyName) 
    {
        this.zyName = zyName;
    }

    public String getZyName() 
    {
        return zyName;
    }
    public void setXyzyZydm(String xyzyZydm) 
    {
        this.xyzyZydm = xyzyZydm;
    }

    public String getXyzyZydm() 
    {
        return xyzyZydm;
    }
    public void setZyCreatYear(String zyCreatYear) 
    {
        this.zyCreatYear = zyCreatYear;
    }

    public String getZyCreatYear() 
    {
        return zyCreatYear;
    }
    public void setXkml(String xkml) 
    {
        this.xkml = xkml;
    }

    public String getXkml() 
    {
        return xkml;
    }
    public void setZylb(String zylb) 
    {
        this.zylb = zylb;
    }

    public String getZylb() 
    {
        return zylb;
    }
    public void setRemarks(String remarks) 
    {
        this.remarks = remarks;
    }

    public String getRemarks() 
    {
        return remarks;
    }
    public void setOrderNum(Integer orderNum) 
    {
        this.orderNum = orderNum;
    }

    public Integer getOrderNum() 
    {
        return orderNum;
    }

    public SysDept getDept()
    {
        return dept;
    }

    public void setDept(SysDept dept)
    {
        this.dept = dept;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("zyId", getZyId())
            .append("deptId", getDeptId())
            .append("zyName", getZyName())
            .append("xyzyZydm", getXyzyZydm())
            .append("zyCreatYear", getZyCreatYear())
            .append("xkml", getXkml())
            .append("zylb", getZylb())
            .append("remarks", getRemarks())
            .append("orderNum", getOrderNum())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("dept", getDept())
            .toString();
    }
}
