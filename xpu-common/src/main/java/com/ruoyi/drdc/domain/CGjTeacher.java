package com.ruoyi.drdc.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.annotation.Word;
import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 教师信息对象 c_gj_teacher
 * 
 * @author ruoyi
 * @date 2021-12-05
 */
public class CGjTeacher extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 工号 */
    @Word
    @Excel(name = "工号")
    private Long teacherId;

    /** 姓名 */
    @Word
    @Excel(name = "姓名")
    private String teacherName;

    /** 学历 */
    @Word(readConverterExp = "1=博士研究生,2=硕士研究生,3=大学本科")
    @Excel(name = "学历", readConverterExp = "1=博士研究生,2=硕士研究生,3=大学本科")
    private String degreeId;

    public void setTeacherId(Long teacherId) 
    {
        this.teacherId = teacherId;
    }

    public Long getTeacherId() 
    {
        return teacherId;
    }
    public void setTeacherName(String teacherName) 
    {
        this.teacherName = teacherName;
    }

    public String getTeacherName() 
    {
        return teacherName;
    }
    public void setDegreeId(String degreeId)
    {
        this.degreeId = degreeId;
    }

    public String getDegreeId()
    {
        return degreeId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("teacherId", getTeacherId())
            .append("teacherName", getTeacherName())
            .append("degreeId", getDegreeId())
            .toString();
    }
}
