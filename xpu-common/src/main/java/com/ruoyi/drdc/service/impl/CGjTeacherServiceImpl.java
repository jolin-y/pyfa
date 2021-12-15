package com.ruoyi.drdc.service.impl;

import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.drdc.domain.CGjTeacher;
import com.ruoyi.drdc.mapper.CGjTeacherMapper;
import com.ruoyi.drdc.service.ICGjTeacherService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
    private static final Logger log = LoggerFactory.getLogger(CGjTeacherServiceImpl.class);

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



    /**
     * 导入用户数据
     *
     * @param userList 用户数据列表
     * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
     * @param operName 操作用户
     * @return 结果
     */
    @Override
    public String importTeacher(List<CGjTeacher> userList, Boolean isUpdateSupport, String operName)
    {
        if (StringUtils.isNull(userList) || userList.size() == 0)
        {
            throw new ServiceException("导入用户数据不能为空！");
        }
        int successNum = 0;
        int failureNum = 0;
        StringBuilder successMsg = new StringBuilder();
        StringBuilder failureMsg = new StringBuilder();
//        String password = configService.selectConfigByKey("sys.user.initPassword");
        for (CGjTeacher user : userList)
        {
            try
            {
                // 验证是否存在这个用户
                CGjTeacher u = cGjTeacherMapper.selectCGjTeacherByTeacherId(user.getTeacherId());
                if (StringUtils.isNull(u))
                {
//                    user.setPassword(SecurityUtils.encryptPassword(password));

                    user.setCreateBy(operName);
                    this.insertCGjTeacher(user);
                    successNum++;
                    successMsg.append("<br/>" + successNum + "、账号 " + user.getTeacherId() + " 导入成功");
                }
                else if (isUpdateSupport)
                {
                    user.setUpdateBy(operName);
                    this.updateCGjTeacher(user);
                    successNum++;
                    successMsg.append("<br/>" + successNum + "、账号 " + user.getTeacherId() + " 更新成功");
                }
                else
                {
                    failureNum++;
                    failureMsg.append("<br/>" + failureNum + "、账号 " + user.getTeacherId() + " 已存在");
                }
            }
            catch (Exception e)
            {
                failureNum++;
                String msg = "<br/>" + failureNum + "、账号 " + user.getTeacherId() + " 导入失败：";
                failureMsg.append(msg + e.getMessage());
                log.error(msg, e);
            }
        }
        if (failureNum > 0)
        {
            failureMsg.insert(0, "很抱歉，导入失败！共 " + failureNum + " 条数据格式不正确，错误如下：");
            throw new ServiceException(failureMsg.toString());
        }
        else
        {
            successMsg.insert(0, "恭喜您，数据已全部导入成功！共 " + successNum + " 条，数据如下：");
        }
        return successMsg.toString();
    }


}
