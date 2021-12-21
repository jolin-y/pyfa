package com.ruoyi.drdc.controller;


import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.drdc.domain.CGjZrjsyxs;
import com.ruoyi.drdc.service.ICGjZrjsyxsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 高教-专任教师与学生Controller
 * 
 * @author ruoyi
 * @date 2021-12-21
 */
@RestController
@RequestMapping("/drdc/zrjsyxs")
public class CGjZrjsyxsController extends BaseController
{
    @Autowired
    private ICGjZrjsyxsService cGjZrjsyxsService;

    /**
     * 查询高教-专任教师与学生列表
     */
    @PreAuthorize("@ss.hasPermi('drdc:zrjsyxs:list')")
    @GetMapping("/list")
    public TableDataInfo list(CGjZrjsyxs cGjZrjsyxs)
    {
        startPage();
        List<CGjZrjsyxs> list = cGjZrjsyxsService.selectCGjZrjsyxsList(cGjZrjsyxs);
        return getDataTable(list);
    }

    /**
     * 导出高教-专任教师与学生列表
     */
    @PreAuthorize("@ss.hasPermi('drdc:zrjsyxs:export')")
    @Log(title = "高教-专任教师与学生", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(CGjZrjsyxs cGjZrjsyxs)
    {
        List<CGjZrjsyxs> list = cGjZrjsyxsService.selectCGjZrjsyxsList(cGjZrjsyxs);
        ExcelUtil<CGjZrjsyxs> util = new ExcelUtil<CGjZrjsyxs>(CGjZrjsyxs.class);
        return util.exportExcel(list, "高教-专任教师与学生数据");
    }

    /**
     * 获取高教-专任教师与学生详细信息
     */
    @PreAuthorize("@ss.hasPermi('drdc:zrjsyxs:query')")
    @GetMapping(value = "/{zrjsyxsId}")
    public AjaxResult getInfo(@PathVariable("zrjsyxsId") Long zrjsyxsId)
    {
        return AjaxResult.success(cGjZrjsyxsService.selectCGjZrjsyxsByZrjsyxsId(zrjsyxsId));
    }

    /**
     * 新增高教-专任教师与学生
     */
    @PreAuthorize("@ss.hasPermi('drdc:zrjsyxs:add')")
    @Log(title = "高教-专任教师与学生", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody CGjZrjsyxs cGjZrjsyxs)
    {
        return toAjax(cGjZrjsyxsService.insertCGjZrjsyxs(cGjZrjsyxs));
    }

    /**
     * 修改高教-专任教师与学生
     */
    @PreAuthorize("@ss.hasPermi('drdc:zrjsyxs:edit')")
    @Log(title = "高教-专任教师与学生", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody CGjZrjsyxs cGjZrjsyxs)
    {
        return toAjax(cGjZrjsyxsService.updateCGjZrjsyxs(cGjZrjsyxs));
    }

    /**
     * 删除高教-专任教师与学生
     */
    @PreAuthorize("@ss.hasPermi('drdc:zrjsyxs:remove')")
    @Log(title = "高教-专任教师与学生", businessType = BusinessType.DELETE)
	@DeleteMapping("/{zrjsyxsIds}")
    public AjaxResult remove(@PathVariable Long[] zrjsyxsIds)
    {
        return toAjax(cGjZrjsyxsService.deleteCGjZrjsyxsByZrjsyxsIds(zrjsyxsIds));
    }
}
