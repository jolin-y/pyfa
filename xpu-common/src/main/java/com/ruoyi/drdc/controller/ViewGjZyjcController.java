package com.ruoyi.drdc.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.drdc.common.WordUtil;
import com.ruoyi.drdc.domain.ViewGjZyjc;
import com.ruoyi.drdc.service.IViewGjZyjcService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 专业监测Controller
 * 
 * @author ruoyi
 * @date 2022-01-04
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
    public TableDataInfo list(ViewGjZyjc viewGjZyjc)
    {
        startPage();
        List<ViewGjZyjc> list = viewGjZyjcService.selectViewGjZyjcList(viewGjZyjc);
        return getDataTable(list);
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
    @GetMapping(value = "/{zyId}")
    public AjaxResult getInfo(@PathVariable("zyId") Long zyId)
    {
        return AjaxResult.success(viewGjZyjcService.selectViewGjZyjcByZyId(zyId));
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
	@DeleteMapping("/{zyIds}")
    public AjaxResult remove(@PathVariable Long[] zyIds)
    {
        return toAjax(viewGjZyjcService.deleteViewGjZyjcByZyIds(zyIds));
    }


    /**
     * 导出教师信息列表word
     */
    @PreAuthorize("@ss.hasPermi('drdc:zyjc:export')")
    @Log(title = "专业监测", businessType = BusinessType.EXPORTWORD)
    @GetMapping("/exportWord")
    public AjaxResult exportWord(ViewGjZyjc viewGjZyjc)
    {
        List<ViewGjZyjc> list = viewGjZyjcService.selectViewGjZyjcList(viewGjZyjc);
        System.out.println(list);
        com.ruoyi.drdc.common.WordUtil<ViewGjZyjc> util = new WordUtil<ViewGjZyjc>(ViewGjZyjc.class);
//        return util.exportExcel(list, "教师信息数据");

//        Map<String, List<ViewGjZyjc>> collect = new HashMap<>();
//        for (ViewGjZyjc gjZyjc : list) {
//            collect.computeIfAbsent(String.valueOf(gjZyjc.getDeptId()), k -> new ArrayList<>()).add(gjZyjc);
//        }

//        return util.exportWord(list,"教师信息统计word");
//        return util.exportWord6(list,"教师信息统计word");
        return util.exportWord5(list,"教师信息统计5word");

    }
}
