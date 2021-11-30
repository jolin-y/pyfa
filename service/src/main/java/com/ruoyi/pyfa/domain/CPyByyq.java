package com.ruoyi.pyfa.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.TreeEntity;

/**
 * 毕业要求对象 c_py_byyq
 * 
 * @author ruoyi
 * @date 2021-11-27
 */
public class CPyByyq extends TreeEntity
{
    private static final long serialVersionUID = 1L;

    /** 毕业要求id */
    private Long byyqId;

    /** 毕业要求名称 */
    @Excel(name = "毕业要求名称")
    private String byyqName;

    /** 毕业要求内容 */
    @Excel(name = "毕业要求内容")
    private String byyqContent;

//    /** 父部门ID */
//    private Long parentId;
//
//    /** 祖级列表 */
//    private String ancestors;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;

    public void setByyqId(Long byyqId) 
    {
        this.byyqId = byyqId;
    }

    public Long getByyqId() 
    {
        return byyqId;
    }
    public void setByyqName(String byyqName) 
    {
        this.byyqName = byyqName;
    }

    public String getByyqName() 
    {
        return byyqName;
    }
    public void setByyqContent(String byyqContent) 
    {
        this.byyqContent = byyqContent;
    }

    public String getByyqContent() 
    {
        return byyqContent;
    }
    public void setDelFlag(String delFlag) 
    {
        this.delFlag = delFlag;
    }

    public String getDelFlag() 
    {
        return delFlag;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("byyqId", getByyqId())
            .append("parentId", getParentId())
            .append("ancestors", getAncestors())
            .append("byyqName", getByyqName())
            .append("byyqContent", getByyqContent())
            .append("orderNum", getOrderNum())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
