package com.ruoyi.drdc.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.drdc.common.WordUtil;
import com.ruoyi.common.core.domain.entity.CGjXyzy;
import com.ruoyi.drdc.service.ICGjXyzyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 学院专业Controller
 * 
 * @author ruoyi
 * @date 2021-12-15
 */
@RestController
@RequestMapping("/drdc/xyzy")
public class CGjXyzyController extends BaseController
{
    @Autowired
    private ICGjXyzyService cGjXyzyService;

    /**
     * 查询学院专业列表
     */
    @PreAuthorize("@ss.hasPermi('drdc:xyzy:list')")
    @GetMapping("/list")
    public AjaxResult list(CGjXyzy cGjXyzy)
    {
        List<CGjXyzy> list = cGjXyzyService.selectCGjXyzyList(cGjXyzy);
        return AjaxResult.success(list);
    }

    /**
     * 导出学院专业列表
     */
    @PreAuthorize("@ss.hasPermi('drdc:xyzy:export')")
    @Log(title = "学院专业", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(CGjXyzy cGjXyzy)
    {
        List<CGjXyzy> list = cGjXyzyService.selectCGjXyzyList(cGjXyzy);
        ExcelUtil<CGjXyzy> util = new ExcelUtil<CGjXyzy>(CGjXyzy.class);
        return util.exportExcel(list, "学院专业数据");
    }

    /**
     * 获取学院专业详细信息
     */
    @PreAuthorize("@ss.hasPermi('drdc:xyzy:query')")
    @GetMapping(value = "/{xyzyId}")
    public AjaxResult getInfo(@PathVariable("xyzyId") Long xyzyId)
    {
        return AjaxResult.success(cGjXyzyService.selectCGjXyzyByXyzyId(xyzyId));
    }

    /**
     * 新增学院专业
     */
    @PreAuthorize("@ss.hasPermi('drdc:xyzy:add')")
    @Log(title = "学院专业", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody CGjXyzy cGjXyzy)
    {
        return toAjax(cGjXyzyService.insertCGjXyzy(cGjXyzy));
    }

    /**
     * 修改学院专业
     */
    @PreAuthorize("@ss.hasPermi('drdc:xyzy:edit')")
    @Log(title = "学院专业", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody CGjXyzy cGjXyzy)
    {
        return toAjax(cGjXyzyService.updateCGjXyzy(cGjXyzy));
    }

    /**
     * 删除学院专业
     */
    @PreAuthorize("@ss.hasPermi('drdc:xyzy:remove')")
    @Log(title = "学院专业", businessType = BusinessType.DELETE)
	@DeleteMapping("/{xyzyIds}")
    public AjaxResult remove(@PathVariable Long[] xyzyIds)
    {
        return toAjax(cGjXyzyService.deleteCGjXyzyByXyzyIds(xyzyIds));
    }

    /**
     * 导出教师信息列表word
     */
    @PreAuthorize("@ss.hasPermi('drdc:xyzy:export')")
    @Log(title = "学院专业", businessType = BusinessType.EXPORTWORD)
    @GetMapping("/exportWord")
    public AjaxResult exportWord(CGjXyzy cGjXyzy)
    {
        List<CGjXyzy> list = cGjXyzyService.selectCGjXyzyList(cGjXyzy);
//        List<CGjXyzy> listByXyzyDaima = cGjXyzyService.selectCGjXyzyByXyzyDaima(cGjXyzy);
//        System.out.println(list);
        com.ruoyi.drdc.common.WordUtil<CGjXyzy> util = new WordUtil<CGjXyzy>(CGjXyzy.class);

        return util.exportWord(list,"高教_学院专业统计word");
//        return util.exportWord(listByXyzyDaima,"高教_学院专业统计word");

    }



    /**
     * 获取部门下拉树列表
     */
    @GetMapping("/treeselect")
    public AjaxResult xyzyTreeselect(CGjXyzy cGjXyzy)
    {
        List<CGjXyzy> cGjXyzys = cGjXyzyService.selectCGjXyzyList(cGjXyzy);
        return AjaxResult.success(cGjXyzyService.buildXyzyTreeSelect(cGjXyzys));
    }
}
