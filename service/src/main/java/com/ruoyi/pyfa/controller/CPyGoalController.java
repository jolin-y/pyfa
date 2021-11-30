package com.ruoyi.pyfa.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.pyfa.domain.CPyGoal;
import com.ruoyi.pyfa.service.ICPyGoalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 培养目标表Controller
 * 
 * @author ruoyi
 * @date 2021-11-11
 */
@RestController
@RequestMapping("/pyfa/goal")
public class CPyGoalController extends BaseController
{
    @Autowired
    private ICPyGoalService cPyGoalService;

    /**
     * 查询培养目标表列表
     */
    @PreAuthorize("@ss.hasPermi('pyfa:goal:list')")
    @GetMapping("/list")
    public TableDataInfo list(CPyGoal cPyGoal)
    {
        startPage();
        List<CPyGoal> list = cPyGoalService.selectCPyGoalList(cPyGoal);
        return getDataTable(list);
    }

    /**
     * 导出培养目标表列表
     */
    @PreAuthorize("@ss.hasPermi('pyfa:goal:export')")
    @Log(title = "培养目标表", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(CPyGoal cPyGoal)
    {
        List<CPyGoal> list = cPyGoalService.selectCPyGoalList(cPyGoal);
        ExcelUtil<CPyGoal> util = new ExcelUtil<CPyGoal>(CPyGoal.class);
        return util.exportExcel(list, "培养目标表数据");
    }

    /**
     * 获取培养目标表详细信息
     */
    @PreAuthorize("@ss.hasPermi('pyfa:goal:query')")
    @GetMapping(value = "/{goalId}")
    public AjaxResult getInfo(@PathVariable("goalId") Long goalId)
    {
        return AjaxResult.success(cPyGoalService.selectCPyGoalByGoalId(goalId));
    }


    /**
     * 培养方案id 获取培养目标表详细信息
     */
    @PreAuthorize("@ss.hasPermi('pyfa:goal:query')")
    @GetMapping(value = "/pyfaId/{pyfaId}")
    public AjaxResult getGoalPyfaId(@PathVariable("pyfaId") Long pyfaId)
    {
        return AjaxResult.success(cPyGoalService.selectCPyGoalByPyfaId(pyfaId));
    }


    /**
     * 新增培养目标表
     */
    @PreAuthorize("@ss.hasPermi('pyfa:goal:add')")
    @Log(title = "培养目标表", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody CPyGoal cPyGoal)
    {
        return toAjax(cPyGoalService.insertCPyGoal(cPyGoal));
    }

    /**
     * 修改培养目标表
     */
    @PreAuthorize("@ss.hasPermi('pyfa:goal:edit')")
    @Log(title = "培养目标表", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody CPyGoal cPyGoal)
    {
        return toAjax(cPyGoalService.updateCPyGoal(cPyGoal));
    }

    /**
     * 删除培养目标表
     */
    @PreAuthorize("@ss.hasPermi('pyfa:goal:remove')")
    @Log(title = "培养目标表", businessType = BusinessType.DELETE)
	@DeleteMapping("/{goalIds}")
    public AjaxResult remove(@PathVariable Long[] goalIds)
    {
        return toAjax(cPyGoalService.deleteCPyGoalByGoalIds(goalIds));
    }

}
