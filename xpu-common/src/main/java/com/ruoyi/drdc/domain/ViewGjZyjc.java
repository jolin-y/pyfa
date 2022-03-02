package com.ruoyi.drdc.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.annotation.Word;
import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 专业监测对象 view_gj_zyjc
 * 
 * @author ruoyi
 * @date 2022-01-04
 */
public class ViewGjZyjc extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 专业id(序号) */
    private Long zyId;

    /** 部门id */
    private Long deptId;

    /** 专业名称 */
    @Word
    @Excel(name = "专业名称")
    private String zyName;

    /** 部门名称 */
    @Word
    @Excel(name = "部门名称")
    private String deptName;

    /** 专业代码 */
    @Excel(name = "专业代码")
    private String xyzyZydm;

    /** 显示顺序 */
    private Integer orderNum;

    /** 学科门类 */
    @Word(dictType = "c_gj_xkml")
    @Excel(name = "学科门类")
    private String xkml;

    /** 专业类别 */
    @Word(dictType = "c_gj_zylb")
    @Excel(name = "专业类别")
    private String zylb;

    /** 备注信息 */
    @Word(dictType = "c_gj_remark")
    @Excel(name = "备注信息")
    private String remarks;

    /** 专业设置年份 */
    @Excel(name = "专业设置年份")
    private String zyCreatYear;

    /** 专任教师与学生id */
    private Long zrjsyxsId;

    /** 教师数量 */
    @Excel(name = "教师数量")
    private Long teacherNum;

    /** 高级职称数量 */
    @Excel(name = "高级职称数量")
    private Long gjzcNum;

    /** 学生数量 */
    @Excel(name = "学生数量")
    private Long studentNum;

    /** 招生情况id */
    private Long zsqkId;

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

    /** 毕业与就业id */
    private Long byyjyId;

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
    public void setDeptName(String deptName) 
    {
        this.deptName = deptName;
    }

    public String getDeptName() 
    {
        return deptName;
    }
    public void setXyzyZydm(String xyzyZydm) 
    {
        this.xyzyZydm = xyzyZydm;
    }

    public String getXyzyZydm() 
    {
        return xyzyZydm;
    }
    public void setOrderNum(Integer orderNum) 
    {
        this.orderNum = orderNum;
    }

    public Integer getOrderNum() 
    {
        return orderNum;
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
    public void setZrjsyxsId(Long zrjsyxsId) 
    {
        this.zrjsyxsId = zrjsyxsId;
    }

    public Long getZrjsyxsId() 
    {
        return zrjsyxsId;
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
    public void setZsqkId(Long zsqkId) 
    {
        this.zsqkId = zsqkId;
    }

    public Long getZsqkId() 
    {
        return zsqkId;
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
    public void setByyjyId(Long byyjyId) 
    {
        this.byyjyId = byyjyId;
    }

    public Long getByyjyId() 
    {
        return byyjyId;
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
            .append("zyId", getZyId())
            .append("deptId", getDeptId())
            .append("zyName", getZyName())
            .append("deptName", getDeptName())
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
            .append("zrjsyxsId", getZrjsyxsId())
            .append("teacherNum", getTeacherNum())
            .append("gjzcNum", getGjzcNum())
            .append("studentNum", getStudentNum())
            .append("zsqkId", getZsqkId())
            .append("zsjhNum", getZsjhNum())
            .append("sjlqNum", getSjlqNum())
            .append("fbqk", getFbqk())
            .append("dyzylqNum", getDyzylqNum())
            .append("sjbdNum", getSjbdNum())
            .append("byyjyId", getByyjyId())
            .append("byl", getByl())
            .append("xwsyl", getXwsyl())
            .append("bysNum", getBysNum())
            .append("ccjyl", getCcjyl())
            .append("gcjyl", getGcjyl())
            .append("byYear", getByYear())
            .toString();
    }
}
