package com.ruoyi.drdc.controller;

import java.util.List;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.drdc.domain.CGjByyjy;
import com.ruoyi.drdc.service.ICGjByyjyService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 高教-毕业与就业Controller
 * 
 * @author ruoyi
 * @date 2021-12-21
 */
@RestController
@RequestMapping("/drdc/byyjy")
public class CGjByyjyController extends BaseController
{
    @Autowired
    private ICGjByyjyService cGjByyjyService;

    /**
     * 查询高教-毕业与就业列表
     */
    @PreAuthorize("@ss.hasPermi('drdc:byyjy:list')")
    @GetMapping("/list")
    public TableDataInfo list(CGjByyjy cGjByyjy)
    {
        startPage();
        List<CGjByyjy> list = cGjByyjyService.selectCGjByyjyList(cGjByyjy);
        return getDataTable(list);
    }

    /**
     * 导出高教-毕业与就业列表
     */
    @PreAuthorize("@ss.hasPermi('drdc:byyjy:export')")
    @Log(title = "高教-毕业与就业", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(CGjByyjy cGjByyjy)
    {
        List<CGjByyjy> list = cGjByyjyService.selectCGjByyjyList(cGjByyjy);
        ExcelUtil<CGjByyjy> util = new ExcelUtil<CGjByyjy>(CGjByyjy.class);
        return util.exportExcel(list, "高教-毕业与就业数据");
    }

    /**
     * 获取高教-毕业与就业详细信息
     */
    @PreAuthorize("@ss.hasPermi('drdc:byyjy:query')")
    @GetMapping(value = "/{byyjyId}")
    public AjaxResult getInfo(@PathVariable("byyjyId") Long byyjyId)
    {
        return AjaxResult.success(cGjByyjyService.selectCGjByyjyByByyjyId(byyjyId));
    }

    /**
     * 新增高教-毕业与就业
     */
    @PreAuthorize("@ss.hasPermi('drdc:byyjy:add')")
    @Log(title = "高教-毕业与就业", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody CGjByyjy cGjByyjy)
    {
        return toAjax(cGjByyjyService.insertCGjByyjy(cGjByyjy));
    }

    /**
     * 修改高教-毕业与就业
     */
    @PreAuthorize("@ss.hasPermi('drdc:byyjy:edit')")
    @Log(title = "高教-毕业与就业", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody CGjByyjy cGjByyjy)
    {
        return toAjax(cGjByyjyService.updateCGjByyjy(cGjByyjy));
    }

    /**
     * 删除高教-毕业与就业
     */
    @PreAuthorize("@ss.hasPermi('drdc:byyjy:remove')")
    @Log(title = "高教-毕业与就业", businessType = BusinessType.DELETE)
	@DeleteMapping("/{byyjyIds}")
    public AjaxResult remove(@PathVariable Long[] byyjyIds)
    {
        return toAjax(cGjByyjyService.deleteCGjByyjyByByyjyIds(byyjyIds));
    }
}
