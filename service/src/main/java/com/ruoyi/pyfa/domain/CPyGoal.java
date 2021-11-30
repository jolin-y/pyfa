package com.ruoyi.pyfa.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 培养目标表对象 c_py_goal
 * 
 * @author ruoyi
 * @date 2021-11-11
 */
public class CPyGoal extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 培养目标id */
    private Long goalId;

    /** 培养方案id */
    @Excel(name = "培养方案id")
    private Long pyfaId;

    /** 描述信息 */
    @Excel(name = "描述信息")
    private String describe1;

    /** 指标点1 */
    @Excel(name = "指标点1")
    private String goal1;

    /** 指标点2 */
    @Excel(name = "指标点2")
    private String goal2;

    /** 指标点3 */
    @Excel(name = "指标点3")
    private String goal3;

    /** 指标点4 */
    @Excel(name = "指标点4")
    private String goal4;

    /** 指标点5 */
    @Excel(name = "指标点5")
    private String goal5;

    public void setGoalId(Long goalId) 
    {
        this.goalId = goalId;
    }

    public Long getGoalId() 
    {
        return goalId;
    }
    public void setPyfaId(Long pyfaId) 
    {
        this.pyfaId = pyfaId;
    }

    public Long getPyfaId() 
    {
        return pyfaId;
    }
    public void setDescribe(String describe1) 
    {
        this.describe1 = describe1;
    }

    public String getDescribe() 
    {
        return describe1;
    }
    public void setGoal1(String goal1) 
    {
        this.goal1 = goal1;
    }

    public String getGoal1() 
    {
        return goal1;
    }
    public void setGoal2(String goal2) 
    {
        this.goal2 = goal2;
    }

    public String getGoal2() 
    {
        return goal2;
    }
    public void setGoal3(String goal3) 
    {
        this.goal3 = goal3;
    }

    public String getGoal3() 
    {
        return goal3;
    }
    public void setGoal4(String goal4) 
    {
        this.goal4 = goal4;
    }

    public String getGoal4() 
    {
        return goal4;
    }
    public void setGoal5(String goal5) 
    {
        this.goal5 = goal5;
    }

    public String getGoal5() 
    {
        return goal5;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("goalId", getGoalId())
            .append("pyfaId", getPyfaId())
            .append("describe1", getDescribe())
            .append("goal1", getGoal1())
            .append("goal2", getGoal2())
            .append("goal3", getGoal3())
            .append("goal4", getGoal4())
            .append("goal5", getGoal5())
            .toString();
    }
}
