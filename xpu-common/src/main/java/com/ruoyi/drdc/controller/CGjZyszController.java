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
import com.ruoyi.drdc.domain.CGjZysz;
import com.ruoyi.drdc.service.ICGjZyszService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 专业设置2Controller
 * 
 * @author ruoyi
 * @date 2021-12-28
 */
@RestController
@RequestMapping("/drdc/zysz")
public class CGjZyszController extends BaseController
{
    @Autowired
    private ICGjZyszService cGjZyszService;

    /**
     * 查询专业设置2列表
     */
    @PreAuthorize("@ss.hasPermi('drdc:zysz:list')")
    @GetMapping("/list")
    public TableDataInfo list(CGjZysz cGjZysz)
    {
        startPage();
        List<CGjZysz> list = cGjZyszService.selectCGjZyszList(cGjZysz);
        return getDataTable(list);
    }

    /**
     * 导出专业设置2列表
     */
    @PreAuthorize("@ss.hasPermi('drdc:zysz:export')")
    @Log(title = "专业设置2", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(CGjZysz cGjZysz)
    {
        List<CGjZysz> list = cGjZyszService.selectCGjZyszList(cGjZysz);
        ExcelUtil<CGjZysz> util = new ExcelUtil<CGjZysz>(CGjZysz.class);
        return util.exportExcel(list, "专业设置2数据");
    }

    /**
     * 获取专业设置2详细信息
     */
    @PreAuthorize("@ss.hasPermi('drdc:zysz:query')")
    @GetMapping(value = "/{zyId}")
    public AjaxResult getInfo(@PathVariable("zyId") Long zyId)
    {
        return AjaxResult.success(cGjZyszService.selectCGjZyszByZyId(zyId));
    }

    /**
     * 新增专业设置2
     */
    @PreAuthorize("@ss.hasPermi('drdc:zysz:add')")
    @Log(title = "专业设置2", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody CGjZysz cGjZysz)
    {
        return toAjax(cGjZyszService.insertCGjZysz(cGjZysz));
    }

    /**
     * 修改专业设置2
     */
    @PreAuthorize("@ss.hasPermi('drdc:zysz:edit')")
    @Log(title = "专业设置2", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody CGjZysz cGjZysz)
    {
        return toAjax(cGjZyszService.updateCGjZysz(cGjZysz));
    }

    /**
     * 删除专业设置2
     */
    @PreAuthorize("@ss.hasPermi('drdc:zysz:remove')")
    @Log(title = "专业设置2", businessType = BusinessType.DELETE)
	@DeleteMapping("/{zyIds}")
    public AjaxResult remove(@PathVariable Long[] zyIds)
    {
        return toAjax(cGjZyszService.deleteCGjZyszByZyIds(zyIds));
    }
}
