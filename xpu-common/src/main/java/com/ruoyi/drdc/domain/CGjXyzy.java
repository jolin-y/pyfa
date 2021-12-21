package com.ruoyi.drdc.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.annotation.Word;
import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.util.ArrayList;
import java.util.List;

/**
 * 学院专业对象 c_gj_xyzy
 * 
 * @author ruoyi
 * @date 2021-12-15
 */
//public class CGjXyzy extends TreeEntity
public class CGjXyzy extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 学院专业id(序号) */
    private Long xyzyId;

    /** 代码 */
    @Excel(name = "代码")
    private String xyzyDaima;

    /** 学院专业名称 */
    @Word
    @Excel(name = "学院专业名称")
    private String xyzyName;

    /** 学院简称 */
    @Excel(name = "学院简称")
    private String xyzyShortName;

    /** 专业代码 */
    @Excel(name = "专业代码")
    private String xyzyZydm;

    /** 学科门类 */
    @Word(dictType = "c_gj_xkml")
//    @Word(readConverterExp = "0=工学,1=艺术学,2=法学,3=理学,4=管理学,5=经济学,6=文学")
    @Excel(name = "学科门类")
    private String xkml;

    /** 专业类别 */
    @Word(dictType = "c_gj_zylb")
    @Excel(name = "专业类别")
    private String zylb;

    /** 备注信息 */
    @Word(dictType = "c_gj_remark")
//    @Word(readConverterExp = "0=新增,1=预警,2=停招,3=撤销,4=大类")
    @Excel(name = "备注信息")
    private String remarks;

    /** 年份 */
    @Excel(name = "专业创建年份")
    private String zyCreatYear;


    /** 父菜单名称 */
    private String parentName;

    /** 父菜单ID */
    private Long parentId;

    /** 显示顺序 */
    private Integer orderNum;

    /** 祖级列表 */
    private String ancestors;

    /** 子部门 */
    private List<CGjXyzy> children = new ArrayList<CGjXyzy>();

//    private int childNum;







    public void setXyzyId(Long xyzyId) 
    {
        this.xyzyId = xyzyId;
    }

    public Long getXyzyId() 
    {
        return xyzyId;
    }
    public void setXyzyDaima(String xyzyDaima)
    {
        this.xyzyDaima = xyzyDaima;
    }

    public String getXyzyDaima()
    {
        return xyzyDaima;
    }
    public void setXyzyName(String xyzyName) 
    {
        this.xyzyName = xyzyName;
    }

    public String getXyzyName() 
    {
        return xyzyName;
    }
    public void setXyzyShortName(String xyzyShortName)
    {
        this.xyzyShortName = xyzyShortName;
    }

    public String getXyzyShortName()
    {
        return xyzyShortName;
    }
    public void setXyzyZydm(String xyzyZydm)
    {
        this.xyzyZydm = xyzyZydm;
    }

    public String getXyzyZydm()
    {
        return xyzyZydm;
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

    public void setZyCreatYear(String zyCreatYear)
    {
        this.zyCreatYear = zyCreatYear;
    }

    public String getZyCreatYear()
    {
        return zyCreatYear;
    }


    public String getParentName()
    {
        return parentName;
    }

    public void setParentName(String parentName)
    {
        this.parentName = parentName;
    }

    public Long getParentId()
    {
        return parentId;
    }

    public void setParentId(Long parentId)
    {
        this.parentId = parentId;
    }

    public Integer getOrderNum()
    {
        return orderNum;
    }

    public void setOrderNum(Integer orderNum)
    {
        this.orderNum = orderNum;
    }

    public String getAncestors()
    {
        return ancestors;
    }

    public void setAncestors(String ancestors)
    {
        this.ancestors = ancestors;
    }

    public List<CGjXyzy> getChildren()
    {

        return children;
    }

    public void setChildren(List<CGjXyzy> children)
    {
        this.children = children;
    }


//    public int getChildNum()
//    {
//        return childNum;
//    }
//    public void setChildNum(int childNum)
//    {
//        this.childNum = childNum;
//    }



    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("xyzyId", getXyzyId())
            .append("parentId", getParentId())
            .append("ancestors", getAncestors())
            .append("xyzyDaima", getXyzyDaima())
            .append("xyzyName", getXyzyName())
            .append("xyzyShortName", getXyzyShortName())
            .append("xyzyZydm", getXyzyZydm())
            .append("orderNum", getOrderNum())
            .append("xkml", getXkml())
            .append("zylb", getZylb())
            .append("remarks", getRemarks())
            .append("zyCreatYear", getZyCreatYear())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
