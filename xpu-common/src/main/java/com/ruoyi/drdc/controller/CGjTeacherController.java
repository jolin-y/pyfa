package com.ruoyi.drdc.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.drdc.common.WordUtil;
import com.ruoyi.drdc.domain.CGjTeacher;
import com.ruoyi.drdc.service.ICGjTeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

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
     * 导出教师信息列表word
     */
    @PreAuthorize("@ss.hasPermi('drdc:teacherInfo:export')")
    @Log(title = "教师信息", businessType = BusinessType.EXPORTWORD)
    @GetMapping("/exportWord")
    public AjaxResult exportWord(CGjTeacher cGjTeacher)
    {
        List<CGjTeacher> list = cGjTeacherService.selectCGjTeacherList(cGjTeacher);
        System.out.println(list);
        WordUtil<CGjTeacher> util = new WordUtil<CGjTeacher>(CGjTeacher.class);
//        return util.exportExcel(list, "教师信息数据");


        return util.exportWord(list,"教师信息统计word");

    }


//    /**
//     * list转Map<String,Object>
//     */
//    public static List<Map<String, Object>> toListMap(List<CGjTeacher> userList) {
//        List<Map<String, Object>> result = new ArrayList<>();
//        Map<String, Object> map;
//        for (CGjTeacher user : userList) {
//            map = new HashMap<>();
//            map.put("teacherId", user.getTeacherId());
//            map.put("teacherName", user.getTeacherName());
//            map.put("degree", user.getDegreeId());
//            result.add(map);
//        }
//        return result;
//    }






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


    @Log(title = "用户管理", businessType = BusinessType.IMPORT)
    @PreAuthorize("@ss.hasPermi('drdc:teacherInfo:import')")
    @PostMapping("/importTeacherData")
    public AjaxResult importTeacherData(MultipartFile file, boolean updateSupport) throws Exception
    {
        ExcelUtil<CGjTeacher> util = new ExcelUtil<CGjTeacher>(CGjTeacher.class);
        List<CGjTeacher> userList = util.importExcel(file.getInputStream());
        String operName = getUsername();
        String message = cGjTeacherService.importTeacher(userList, updateSupport, operName);
        return AjaxResult.success(message);
    }

    @GetMapping("/importTeacherTemplate")
    public AjaxResult importTeacherTemplate()
    {
        ExcelUtil<CGjTeacher> util = new ExcelUtil<CGjTeacher>(CGjTeacher.class);
        return util.importTemplateExcel("教师数据");
    }


}
