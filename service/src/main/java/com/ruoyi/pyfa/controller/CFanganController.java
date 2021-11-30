package com.ruoyi.pyfa.controller;

import java.util.List;

import com.ruoyi.pyfa.domain.CFangan;
import com.ruoyi.pyfa.service.ICFanganService;
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

import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 培养方案Controller
 * 
 * @author ruoyi
 * @date 2021-10-31
 */
@RestController
@RequestMapping("/pyfa/fangan")
public class CFanganController extends BaseController
{
    @Autowired
    private ICFanganService cFanganService;

    /**
     * 查询培养方案列表
     */
    @PreAuthorize("@ss.hasPermi('pyfa:fangan:list')")
    @GetMapping("/list")
    public TableDataInfo list(CFangan cFangan)
    {
        startPage();
        List<CFangan> list = cFanganService.selectCFanganList(cFangan);
        return getDataTable(list);
    }

    /**
     * 导出培养方案列表
     */
    @PreAuthorize("@ss.hasPermi('pyfa:fangan:export')")
    @Log(title = "培养方案", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(CFangan cFangan)
    {
        List<CFangan> list = cFanganService.selectCFanganList(cFangan);
        ExcelUtil<CFangan> util = new ExcelUtil<CFangan>(CFangan.class);
        return util.exportExcel(list, "培养方案数据");
    }

    /**
     * 获取培养方案详细信息
     */
    @PreAuthorize("@ss.hasPermi('pyfa:fangan:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") String id)
    {
        return AjaxResult.success(cFanganService.selectCFanganById(id));
    }

    /**
     * 新增培养方案
     */
    @PreAuthorize("@ss.hasPermi('pyfa:fangan:add')")
    @Log(title = "培养方案", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody CFangan cFangan)
    {
        return toAjax(cFanganService.insertCFangan(cFangan));
    }

    /**
     * 修改培养方案
     */
    @PreAuthorize("@ss.hasPermi('pyfa:fangan:edit')")
    @Log(title = "培养方案", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody CFangan cFangan)
    {
        return toAjax(cFanganService.updateCFangan(cFangan));
    }

    /**
     * 删除培养方案
     */
    @PreAuthorize("@ss.hasPermi('pyfa:fangan:remove')")
    @Log(title = "培养方案", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable String[] ids)
    {
        return toAjax(cFanganService.deleteCFanganByIds(ids));
    }
}
