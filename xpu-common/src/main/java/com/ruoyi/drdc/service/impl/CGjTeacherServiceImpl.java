package com.ruoyi.drdc.service.impl;

import com.ruoyi.drdc.domain.CGjTeacher;
import com.ruoyi.drdc.mapper.CGjTeacherMapper;
import com.ruoyi.drdc.service.ICGjTeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 教师信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2021-12-05
 */
@Service
public class CGjTeacherServiceImpl implements ICGjTeacherService 
{
    @Autowired
    private CGjTeacherMapper cGjTeacherMapper;

    /**
     * 查询教师信息
     * 
     * @param teacherId 教师信息主键
     * @return 教师信息
     */
    @Override
    public CGjTeacher selectCGjTeacherByTeacherId(Long teacherId)
    {
        return cGjTeacherMapper.selectCGjTeacherByTeacherId(teacherId);
    }

    /**
     * 查询教师信息列表
     * 
     * @param cGjTeacher 教师信息
     * @return 教师信息
     */
    @Override
    public List<CGjTeacher> selectCGjTeacherList(CGjTeacher cGjTeacher)
    {
        return cGjTeacherMapper.selectCGjTeacherList(cGjTeacher);
    }

    /**
     * 新增教师信息
     * 
     * @param cGjTeacher 教师信息
     * @return 结果
     */
    @Override
    public int insertCGjTeacher(CGjTeacher cGjTeacher)
    {
        return cGjTeacherMapper.insertCGjTeacher(cGjTeacher);
    }

    /**
     * 修改教师信息
     * 
     * @param cGjTeacher 教师信息
     * @return 结果
     */
    @Override
    public int updateCGjTeacher(CGjTeacher cGjTeacher)
    {
        return cGjTeacherMapper.updateCGjTeacher(cGjTeacher);
    }

    /**
     * 批量删除教师信息
     * 
     * @param teacherIds 需要删除的教师信息主键
     * @return 结果
     */
    @Override
    public int deleteCGjTeacherByTeacherIds(Long[] teacherIds)
    {
        return cGjTeacherMapper.deleteCGjTeacherByTeacherIds(teacherIds);
    }

    /**
     * 删除教师信息信息
     * 
     * @param teacherId 教师信息主键
     * @return 结果
     */
    @Override
    public int deleteCGjTeacherByTeacherId(Long teacherId)
    {
        return cGjTeacherMapper.deleteCGjTeacherByTeacherId(teacherId);
    }
}
