package com.ruoyi.pyfa.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 培养方案对象 c_fangan
 * 
 * @author ruoyi
 * @date 2021-10-31
 */
public class CFangan extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    private String id;

    /** 年份 */
    @Excel(name = "年份")
    private String year;

    /** 培养目标 */
    @Excel(name = "培养目标")
    private String goal;

    /** 培养目标 */
    @Excel(name = "负责人")
    private String charge;


    public void setId(String id) 
    {
        this.id = id;
    }

    public String getId() 
    {
        return id;
    }
    public void setYear(String year) 
    {
        this.year = year;
    }

    public String getYear() 
    {
        return year;
    }
    public void setGoal(String goal) 
    {
        this.goal = goal;
    }

    public String getGoal() 
    {
        return goal;
    }

    public void setCharge(String charge)
    {
        this.charge = charge;
    }
    public String getCharge()
    {
        return charge;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("year", getYear())
            .append("goal", getGoal())
            .append("charge", getCharge())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
