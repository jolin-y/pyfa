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
import com.ruoyi.drdc.domain.ViewGjZyjc;
import com.ruoyi.drdc.service.IViewGjZyjcService;
import com.ruoyi.common.utils.poi.ExcelUtil;

/**
 * 专业监测Controller
 * 
 * @author ruoyi
 * @date 2021-12-23
 */
@RestController
@RequestMapping("/drdc/zyjc")
public class ViewGjZyjcController extends BaseController
{
    @Autowired
    private IViewGjZyjcService viewGjZyjcService;

    /**
     * 查询专业监测列表
     */
    @PreAuthorize("@ss.hasPermi('drdc:zyjc:list')")
    @GetMapping("/list")
    public AjaxResult list(ViewGjZyjc viewGjZyjc)
    {
        List<ViewGjZyjc> list = viewGjZyjcService.selectViewGjZyjcList(viewGjZyjc);
        return AjaxResult.success(list);
    }

    /**
     * 导出专业监测列表
     */
    @PreAuthorize("@ss.hasPermi('drdc:zyjc:export')")
    @Log(title = "专业监测", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(ViewGjZyjc viewGjZyjc)
    {
        List<ViewGjZyjc> list = viewGjZyjcService.selectViewGjZyjcList(viewGjZyjc);
        ExcelUtil<ViewGjZyjc> util = new ExcelUtil<ViewGjZyjc>(ViewGjZyjc.class);
        return util.exportExcel(list, "专业监测数据");
    }

    /**
     * 获取专业监测详细信息
     */
    @PreAuthorize("@ss.hasPermi('drdc:zyjc:query')")
    @GetMapping(value = "/{xyzyId}")
    public AjaxResult getInfo(@PathVariable("xyzyId") Long xyzyId)
    {
        return AjaxResult.success(viewGjZyjcService.selectViewGjZyjcByXyzyId(xyzyId));
    }

    /**
     * 新增专业监测
     */
    @PreAuthorize("@ss.hasPermi('drdc:zyjc:add')")
    @Log(title = "专业监测", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ViewGjZyjc viewGjZyjc)
    {
        return toAjax(viewGjZyjcService.insertViewGjZyjc(viewGjZyjc));
    }

    /**
     * 修改专业监测
     */
    @PreAuthorize("@ss.hasPermi('drdc:zyjc:edit')")
    @Log(title = "专业监测", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ViewGjZyjc viewGjZyjc)
    {
        return toAjax(viewGjZyjcService.updateViewGjZyjc(viewGjZyjc));
    }

    /**
     * 删除专业监测
     */
    @PreAuthorize("@ss.hasPermi('drdc:zyjc:remove')")
    @Log(title = "专业监测", businessType = BusinessType.DELETE)
	@DeleteMapping("/{xyzyIds}")
    public AjaxResult remove(@PathVariable Long[] xyzyIds)
    {
        return toAjax(viewGjZyjcService.deleteViewGjZyjcByXyzyIds(xyzyIds));
    }
}
