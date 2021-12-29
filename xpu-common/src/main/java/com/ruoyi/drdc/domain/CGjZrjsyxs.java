package com.ruoyi.drdc.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import com.ruoyi.common.core.domain.entity.CGjXyzy;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 高教-专任教师与学生对象 c_gj_zrjsyxs
 * 
 * @author ruoyi
 * @date 2021-12-21
 */
public class CGjZrjsyxs extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 专任教师与学生id */
    private Long zrjsyxsId;

    /** 学院专业id */
    @Excel(name = "学院专业id")
    private Long xyzyId;

    /** 教师数量 */
    @Excel(name = "教师数量")
    private Long teacherNum;

    /** 高级职称数量 */
    @Excel(name = "高级职称数量")
    private Long gjzcNum;

    /** 学生数量 */
    @Excel(name = "学生数量")
    private Long studentNum;

    private CGjXyzy xyzy;

    public void setZrjsyxsId(Long zrjsyxsId) 
    {
        this.zrjsyxsId = zrjsyxsId;
    }

    public Long getZrjsyxsId() 
    {
        return zrjsyxsId;
    }
    public void setXyzyId(Long xyzyId) 
    {
        this.xyzyId = xyzyId;
    }

    public Long getXyzyId() 
    {
        return xyzyId;
    }
    public void setTeacherNum(Long teacherNum) 
    {
        this.teacherNum = teacherNum;
    }

    public Long getTeacherNum() 
    {
        return teacherNum;
    }
    public void setGjzcNum(Long gjzcNum) 
    {
        this.gjzcNum = gjzcNum;
    }

    public Long getGjzcNum() 
    {
        return gjzcNum;
    }
    public void setStudentNum(Long studentNum) 
    {
        this.studentNum = studentNum;
    }

    public Long getStudentNum() 
    {
        return studentNum;
    }


    public CGjXyzy getXyzy()
    {
        return xyzy;
    }

    public void setXyzy(CGjXyzy xyzy)
    {
        this.xyzy = xyzy;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("zrjsyxsId", getZrjsyxsId())
            .append("xyzyId", getXyzyId())
            .append("teacherNum", getTeacherNum())
            .append("gjzcNum", getGjzcNum())
            .append("studentNum", getStudentNum())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("xyzy", getXyzy())
            .toString();
    }
}
