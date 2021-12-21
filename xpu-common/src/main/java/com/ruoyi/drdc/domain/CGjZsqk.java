package com.ruoyi.drdc.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 高教-招生情况对象 c_gj_zsqk
 * 
 * @author ruoyi
 * @date 2021-12-21
 */
public class CGjZsqk extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 招生情况id */
    private Long zsqkId;

    /** 学院专业id */
    @Excel(name = "学院专业id")
    private Long xyzyId;

    /** 招生计划数 */
    @Excel(name = "招生计划数")
    private Long zsjhNum;

    /** 实际录取数 */
    @Excel(name = "实际录取数")
    private Long sjlqNum;

    /** 分班情况 */
    @Excel(name = "分班情况")
    private Long fbqk;

    /** 第一志愿录取数 */
    @Excel(name = "第一志愿录取数")
    private Long dyzylqNum;

    /** 实际报到数 */
    @Excel(name = "实际报到数")
    private Long sjbdNum;

    public void setZsqkId(Long zsqkId) 
    {
        this.zsqkId = zsqkId;
    }

    public Long getZsqkId() 
    {
        return zsqkId;
    }
    public void setXyzyId(Long xyzyId) 
    {
        this.xyzyId = xyzyId;
    }

    public Long getXyzyId() 
    {
        return xyzyId;
    }
    public void setZsjhNum(Long zsjhNum) 
    {
        this.zsjhNum = zsjhNum;
    }

    public Long getZsjhNum() 
    {
        return zsjhNum;
    }
    public void setSjlqNum(Long sjlqNum) 
    {
        this.sjlqNum = sjlqNum;
    }

    public Long getSjlqNum() 
    {
        return sjlqNum;
    }
    public void setFbqk(Long fbqk) 
    {
        this.fbqk = fbqk;
    }

    public Long getFbqk() 
    {
        return fbqk;
    }
    public void setDyzylqNum(Long dyzylqNum) 
    {
        this.dyzylqNum = dyzylqNum;
    }

    public Long getDyzylqNum() 
    {
        return dyzylqNum;
    }
    public void setSjbdNum(Long sjbdNum) 
    {
        this.sjbdNum = sjbdNum;
    }

    public Long getSjbdNum() 
    {
        return sjbdNum;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("zsqkId", getZsqkId())
            .append("xyzyId", getXyzyId())
            .append("zsjhNum", getZsjhNum())
            .append("sjlqNum", getSjlqNum())
            .append("fbqk", getFbqk())
            .append("dyzylqNum", getDyzylqNum())
            .append("sjbdNum", getSjbdNum())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
