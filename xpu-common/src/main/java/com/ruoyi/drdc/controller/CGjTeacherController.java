package com.ruoyi.drdc.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.drdc.domain.CGjTeacher;
import com.ruoyi.drdc.service.ICGjTeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 教师信息Controller
 * 
 * @author ruoyi
 * @date 2021-12-05
 */
@RestController
@RequestMapping("/drdc/teacherInfo")
public class CGjTeacherController extends BaseController
{
    @Autowired
    private ICGjTeacherService cGjTeacherService;

    /**
     * 查询教师信息列表
     */
    @PreAuthorize("@ss.hasPermi('drdc:teacherInfo:list')")
    @GetMapping("/list")
    public TableDataInfo list(CGjTeacher cGjTeacher)
    {
        startPage();
        List<CGjTeacher> list = cGjTeacherService.selectCGjTeacherList(cGjTeacher);
        return getDataTable(list);
    }

    /**
     * 导出教师信息列表
     */
    @PreAuthorize("@ss.hasPermi('drdc:teacherInfo:export')")
    @Log(title = "教师信息", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(CGjTeacher cGjTeacher)
    {
        List<CGjTeacher> list = cGjTeacherService.selectCGjTeacherList(cGjTeacher);
        ExcelUtil<CGjTeacher> util = new ExcelUtil<CGjTeacher>(CGjTeacher.class);
        return util.exportExcel(list, "教师信息数据");
    }

    /**
     * 获取教师信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('drdc:teacherInfo:query')")
    @GetMapping(value = "/{teacherId}")
    public AjaxResult getInfo(@PathVariable("teacherId") Long teacherId)
    {
        return AjaxResult.success(cGjTeacherService.selectCGjTeacherByTeacherId(teacherId));
    }

    /**
     * 新增教师信息
     */
    @PreAuthorize("@ss.hasPermi('drdc:teacherInfo:add')")
    @Log(title = "教师信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody CGjTeacher cGjTeacher)
    {
        return toAjax(cGjTeacherService.insertCGjTeacher(cGjTeacher));
    }

    /**
     * 修改教师信息
     */
    @PreAuthorize("@ss.hasPermi('drdc:teacherInfo:edit')")
    @Log(title = "教师信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody CGjTeacher cGjTeacher)
    {
        return toAjax(cGjTeacherService.updateCGjTeacher(cGjTeacher));
    }

    /**
     * 删除教师信息
     */
    @PreAuthorize("@ss.hasPermi('drdc:teacherInfo:remove')")
    @Log(title = "教师信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{teacherIds}")
    public AjaxResult remove(@PathVariable Long[] teacherIds)
    {
        return toAjax(cGjTeacherService.deleteCGjTeacherByTeacherIds(teacherIds));
    }
}
