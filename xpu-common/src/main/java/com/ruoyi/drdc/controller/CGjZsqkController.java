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
import com.ruoyi.drdc.domain.CGjZsqk;
import com.ruoyi.drdc.service.ICGjZsqkService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 高教-招生情况Controller
 * 
 * @author ruoyi
 * @date 2021-12-21
 */
@RestController
@RequestMapping("/drdc/zsqk")
public class CGjZsqkController extends BaseController
{
    @Autowired
    private ICGjZsqkService cGjZsqkService;

    /**
     * 查询高教-招生情况列表
     */
    @PreAuthorize("@ss.hasPermi('drdc:zsqk:list')")
    @GetMapping("/list")
    public TableDataInfo list(CGjZsqk cGjZsqk)
    {
        startPage();
        List<CGjZsqk> list = cGjZsqkService.selectCGjZsqkList(cGjZsqk);
        return getDataTable(list);
    }

    /**
     * 导出高教-招生情况列表
     */
    @PreAuthorize("@ss.hasPermi('drdc:zsqk:export')")
    @Log(title = "高教-招生情况", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(CGjZsqk cGjZsqk)
    {
        List<CGjZsqk> list = cGjZsqkService.selectCGjZsqkList(cGjZsqk);
        ExcelUtil<CGjZsqk> util = new ExcelUtil<CGjZsqk>(CGjZsqk.class);
        return util.exportExcel(list, "高教-招生情况数据");
    }

    /**
     * 获取高教-招生情况详细信息
     */
    @PreAuthorize("@ss.hasPermi('drdc:zsqk:query')")
    @GetMapping(value = "/{zsqkId}")
    public AjaxResult getInfo(@PathVariable("zsqkId") Long zsqkId)
    {
        return AjaxResult.success(cGjZsqkService.selectCGjZsqkByZsqkId(zsqkId));
    }

    /**
     * 新增高教-招生情况
     */
    @PreAuthorize("@ss.hasPermi('drdc:zsqk:add')")
    @Log(title = "高教-招生情况", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody CGjZsqk cGjZsqk)
    {
        return toAjax(cGjZsqkService.insertCGjZsqk(cGjZsqk));
    }

    /**
     * 修改高教-招生情况
     */
    @PreAuthorize("@ss.hasPermi('drdc:zsqk:edit')")
    @Log(title = "高教-招生情况", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody CGjZsqk cGjZsqk)
    {
        return toAjax(cGjZsqkService.updateCGjZsqk(cGjZsqk));
    }

    /**
     * 删除高教-招生情况
     */
    @PreAuthorize("@ss.hasPermi('drdc:zsqk:remove')")
    @Log(title = "高教-招生情况", businessType = BusinessType.DELETE)
	@DeleteMapping("/{zsqkIds}")
    public AjaxResult remove(@PathVariable Long[] zsqkIds)
    {
        return toAjax(cGjZsqkService.deleteCGjZsqkByZsqkIds(zsqkIds));
    }
}
