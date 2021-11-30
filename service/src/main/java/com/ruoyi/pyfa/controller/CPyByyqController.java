package com.ruoyi.pyfa.controller;


import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.pyfa.domain.CPyByyq;
import com.ruoyi.pyfa.service.ICPyByyqService;
import org.apache.commons.lang3.ArrayUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.Iterator;
import java.util.List;

/**
 * 毕业要求Controller
 * 
 * @author ruoyi
 * @date 2021-11-27
 */
@RestController
@RequestMapping("/pyfa/byyq")
public class CPyByyqController extends BaseController
{
    @Autowired
    private ICPyByyqService cPyByyqService;

    /**
     * 查询毕业要求列表
     */
    @PreAuthorize("@ss.hasPermi('pyfa:byyq:list')")
    @GetMapping("/list")
    public AjaxResult list(CPyByyq cPyByyq)
    {
        List<CPyByyq> list = cPyByyqService.selectCPyByyqList(cPyByyq);
        return AjaxResult.success(list);
    }

    /**
     * 查询毕业要求列表（排除节点）
     */
    @PreAuthorize("@ss.hasPermi('pyfa:byyq:list')")
    @GetMapping("/list/exclude/{byyqId}")
    public AjaxResult excludeChild(@PathVariable(value = "byyqId", required = false) Long byyqId)
    {
        List<CPyByyq> byyqs = cPyByyqService.selectCPyByyqList(new CPyByyq());
        Iterator<CPyByyq> it = byyqs.iterator();
        while (it.hasNext())
        {
            CPyByyq d = (CPyByyq) it.next();
            if (d.getByyqId().intValue() == byyqId
                    || ArrayUtils.contains(StringUtils.split(d.getAncestors(), ","), byyqId + ""))
            {
                it.remove();
            }
        }
        return AjaxResult.success(byyqs);
    }

//    /**
//     * 获取部门下拉树列表
//     */
//    @GetMapping("/treeselect")
//    public AjaxResult treeselect(CPyByyq byyq)
//    {
//        List<CPyByyq> byyqs = cPyByyqService.selectCPyByyqList(byyq);
//        return AjaxResult.success(cPyByyqService.buildByyqTreeSelect(byyqs));
//    }


    /**
     * 导出毕业要求列表
     */
    @PreAuthorize("@ss.hasPermi('pyfa:byyq:export')")
    @Log(title = "毕业要求", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(CPyByyq cPyByyq)
    {
        List<CPyByyq> list = cPyByyqService.selectCPyByyqList(cPyByyq);
        ExcelUtil<CPyByyq> util = new ExcelUtil<CPyByyq>(CPyByyq.class);
        return util.exportExcel(list, "毕业要求数据");
    }

    /**
     * 获取毕业要求详细信息
     */
    @PreAuthorize("@ss.hasPermi('pyfa:byyq:query')")
    @GetMapping(value = "/{byyqId}")
    public AjaxResult getInfo(@PathVariable("byyqId") Long byyqId)
    {
        return AjaxResult.success(cPyByyqService.selectCPyByyqByByyqId(byyqId));
    }

    /**
     * 新增毕业要求
     */
    @PreAuthorize("@ss.hasPermi('pyfa:byyq:add')")
    @Log(title = "毕业要求", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody CPyByyq cPyByyq)
    {
        return toAjax(cPyByyqService.insertCPyByyq(cPyByyq));
    }

    /**
     * 修改毕业要求
     */
    @PreAuthorize("@ss.hasPermi('pyfa:byyq:edit')")
    @Log(title = "毕业要求", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody CPyByyq cPyByyq)
    {
        return toAjax(cPyByyqService.updateCPyByyq(cPyByyq));
    }

    /**
     * 删除毕业要求
     */
    @PreAuthorize("@ss.hasPermi('pyfa:byyq:remove')")
    @Log(title = "毕业要求", businessType = BusinessType.DELETE)
	@DeleteMapping("/{byyqIds}")
    public AjaxResult remove(@PathVariable Long[] byyqIds)
    {
        return toAjax(cPyByyqService.deleteCPyByyqByByyqIds(byyqIds));
    }
}
