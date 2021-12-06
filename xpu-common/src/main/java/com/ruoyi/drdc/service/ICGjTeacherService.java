package com.ruoyi.drdc.service;

import com.ruoyi.drdc.domain.CGjTeacher;

import java.util.List;

/**
 * 教师信息Service接口
 * 
 * @author ruoyi
 * @date 2021-12-05
 */
public interface ICGjTeacherService 
{
    /**
     * 查询教师信息
     * 
     * @param teacherId 教师信息主键
     * @return 教师信息
     */
    public CGjTeacher selectCGjTeacherByTeacherId(Long teacherId);

    /**
     * 查询教师信息列表
     * 
     * @param cGjTeacher 教师信息
     * @return 教师信息集合
     */
    public List<CGjTeacher> selectCGjTeacherList(CGjTeacher cGjTeacher);

    /**
     * 新增教师信息
     * 
     * @param cGjTeacher 教师信息
     * @return 结果
     */
    public int insertCGjTeacher(CGjTeacher cGjTeacher);

    /**
     * 修改教师信息
     * 
     * @param cGjTeacher 教师信息
     * @return 结果
     */
    public int updateCGjTeacher(CGjTeacher cGjTeacher);

    /**
     * 批量删除教师信息
     * 
     * @param teacherIds 需要删除的教师信息主键集合
     * @return 结果
     */
    public int deleteCGjTeacherByTeacherIds(Long[] teacherIds);

    /**
     * 删除教师信息信息
     * 
     * @param teacherId 教师信息主键
     * @return 结果
     */
    public int deleteCGjTeacherByTeacherId(Long teacherId);
}
