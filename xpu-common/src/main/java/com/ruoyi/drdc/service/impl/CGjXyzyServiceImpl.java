package com.ruoyi.drdc.service.impl;

import com.ruoyi.common.core.domain.TreeSelect;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.core.domain.entity.CGjXyzy;
import com.ruoyi.drdc.mapper.CGjXyzyMapper;
import com.ruoyi.drdc.service.ICGjXyzyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 学院专业Service业务层处理
 * 
 * @author ruoyi
 * @date 2021-12-15
 */
@Service
public class CGjXyzyServiceImpl implements ICGjXyzyService 
{
    @Autowired
    private CGjXyzyMapper cGjXyzyMapper;

    /**
     * 查询学院专业
     * 
     * @param xyzyId 学院专业主键
     * @return 学院专业
     */
    @Override
    public CGjXyzy selectCGjXyzyByXyzyId(Long xyzyId)
    {
        //        cGjXyzy.setChildNum(cGjXyzyMapper.selectChildrenXyzyById(cGjXyzy.getXyzyId()).size());
        return cGjXyzyMapper.selectCGjXyzyByXyzyId(xyzyId);
    }

    /**
     * 查询学院专业列表
     * 
     * @param cGjXyzy 学院专业
     * @return 学院专业
     */
    @Override
    public List<CGjXyzy> selectCGjXyzyList(CGjXyzy cGjXyzy)
    {
        return cGjXyzyMapper.selectCGjXyzyList(cGjXyzy);
    }

    /**
     * 新增学院专业
     * 
     * @param cGjXyzy 学院专业
     * @return 结果
     */
    @Override
    public int insertCGjXyzy(CGjXyzy cGjXyzy)
    {
        CGjXyzy info = cGjXyzyMapper.selectCGjXyzyByXyzyId(cGjXyzy.getParentId());
        cGjXyzy.setAncestors(info.getAncestors() + "," + cGjXyzy.getParentId());

        cGjXyzy.setCreateTime(DateUtils.getNowDate());
        return cGjXyzyMapper.insertCGjXyzy(cGjXyzy);
    }

    /**
     * 批量删除学院专业
     * 
     * @param xyzyIds 需要删除的学院专业主键
     * @return 结果
     */
    @Override
    public int deleteCGjXyzyByXyzyIds(Long[] xyzyIds)
    {
        return cGjXyzyMapper.deleteCGjXyzyByXyzyIds(xyzyIds);
    }

    /**
     * 删除学院专业信息
     * 
     * @param xyzyId 学院专业主键
     * @return 结果
     */
    @Override
    public int deleteCGjXyzyByXyzyId(Long xyzyId)
    {
        return cGjXyzyMapper.deleteCGjXyzyByXyzyId(xyzyId);
    }




    /**
     * 查询学院专业列表
     *
     * @param cGjXyzy 学院专业
     * @return 学院专业
     */
    @Override
    public List<CGjXyzy> selectCGjXyzyByXyzyDaima(CGjXyzy cGjXyzy)
    {
        return cGjXyzyMapper.selectCGjXyzyByXyzyDaima(cGjXyzy);
    }

    /**
     * 修改学院专业
     *
     * @param cGjXyzy 学院专业
     * @return 结果
     */
    @Override
    public int updateCGjXyzy(CGjXyzy cGjXyzy)
    {
        CGjXyzy newParentXyzy = cGjXyzyMapper.selectCGjXyzyByXyzyId(cGjXyzy.getParentId());
        CGjXyzy oldXyzy = cGjXyzyMapper.selectCGjXyzyByXyzyId(cGjXyzy.getParentId());
        if (StringUtils.isNotNull(newParentXyzy) && StringUtils.isNotNull(oldXyzy))
        {
            String newAncestors = newParentXyzy.getAncestors() + "," + newParentXyzy.getXyzyId();
            String oldAncestors = oldXyzy.getAncestors();
            cGjXyzy.setAncestors(newAncestors);
            updateXyzyChildren(cGjXyzy.getXyzyId(), newAncestors, oldAncestors);
        }

//        cGjXyzy.setChildNum(cGjXyzyMapper.selectChildrenXyzyById(cGjXyzy.getXyzyId()).size());

        cGjXyzy.setUpdateTime(DateUtils.getNowDate());
        return cGjXyzyMapper.updateCGjXyzy(cGjXyzy);
    }

    /**
     * 修改子元素关系
     *
     * @param xyzyId 被修改的学院专业ID
     * @param newAncestors 新的父ID集合
     * @param oldAncestors 旧的父ID集合
     */
    public void updateXyzyChildren(Long xyzyId, String newAncestors, String oldAncestors)
    {
        List<CGjXyzy> children = cGjXyzyMapper.selectChildrenXyzyById(xyzyId);
        for (CGjXyzy child : children)
        {
            child.setAncestors(child.getAncestors().replaceFirst(oldAncestors, newAncestors));
        }
        if (children.size() > 0)
        {
            cGjXyzyMapper.updateXyzyChildren(children);
        }
    }






    /**
     * 递归列表
     */
    public void recursionFn(List<CGjXyzy> list, CGjXyzy t)
    {
        // 得到子节点列表
        List<CGjXyzy> childList = getChildList(list, t);
        t.setChildren(childList);
        for (CGjXyzy tChild : childList)
        {
            if (hasChild(list, tChild))
            {
                recursionFn(list, tChild);
            }
        }
    }





    /**
     * 得到子节点列表
     */
    public List<CGjXyzy> getChildList(List<CGjXyzy> list, CGjXyzy t)
    {
        List<CGjXyzy> tlist = new ArrayList<CGjXyzy>();
        Iterator<CGjXyzy> it = list.iterator();
        while (it.hasNext())
        {
            CGjXyzy n = (CGjXyzy) it.next();
            if (StringUtils.isNotNull(n.getParentId()) && n.getParentId().longValue() == t.getXyzyId().longValue())
            {
                tlist.add(n);
            }
        }
        return tlist;
    }

    /**
     * 判断是否有子节点
     */
    private boolean hasChild(List<CGjXyzy> list, CGjXyzy t)
    {
        return getChildList(list, t).size() > 0 ? true : false;
    }


    /**
     * 构建前端所需要树结构
     *
     * @param cGjXyzys 部门列表
     * @return 树结构列表
     */
    @Override
    public List<CGjXyzy> buildXyzyTree(List<CGjXyzy> cGjXyzys)
    {
        List<CGjXyzy> returnList = new ArrayList<CGjXyzy>();
        List<Long> tempList = new ArrayList<Long>();
        for (CGjXyzy xyzy : cGjXyzys)
        {
            tempList.add(xyzy.getXyzyId());
        }
        for (Iterator<CGjXyzy> iterator = cGjXyzys.iterator(); iterator.hasNext();)
        {
            CGjXyzy xyzy = (CGjXyzy) iterator.next();
            // 如果是顶级节点, 遍历该父节点的所有子节点
            if (!tempList.contains(xyzy.getParentId()))
            {
                recursionFn(cGjXyzys, xyzy);
                returnList.add(xyzy);
            }
        }
        if (returnList.isEmpty())
        {
            returnList = cGjXyzys;
        }
        return returnList;
    }


    /**
     * 构建前端所需要下拉树结构
     *
     * @param cGjXyzys 部门列表
     * @return 下拉树结构列表
     */
    @Override
    public List<TreeSelect> buildXyzyTreeSelect(List<CGjXyzy> cGjXyzys)
    {
        List<CGjXyzy> xyzyTrees = buildXyzyTree(cGjXyzys);
        return xyzyTrees.stream().map(TreeSelect::new).collect(Collectors.toList());
    }
}
