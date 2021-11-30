package com.ruoyi.pyfa.service.impl;


import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.pyfa.domain.CPyByyq;
import com.ruoyi.pyfa.mapper.CPyByyqMapper;
import com.ruoyi.pyfa.service.ICPyByyqService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 毕业要求Service业务层处理
 * 
 * @author ruoyi
 * @date 2021-11-27
 */
@Service
public class CPyByyqServiceImpl implements ICPyByyqService
{
    @Autowired
    private CPyByyqMapper cPyByyqMapper;

    /**
     * 查询毕业要求
     * 
     * @param byyqId 毕业要求主键
     * @return 毕业要求
     */
    @Override
    public CPyByyq selectCPyByyqByByyqId(Long byyqId)
    {
        return cPyByyqMapper.selectCPyByyqByByyqId(byyqId);
    }

    /**
     * 查询毕业要求列表
     * 
     * @param cPyByyq 毕业要求
     * @return 毕业要求
     */
    @Override
    public List<CPyByyq> selectCPyByyqList(CPyByyq cPyByyq)
    {
        return cPyByyqMapper.selectCPyByyqList(cPyByyq);
    }

//    /**
//     * 新增毕业要求
//     *
//     * @param cPyByyq 毕业要求
//     * @return 结果
//     */
//    @Override
//    public int insertCPyByyq(CPyByyq cPyByyq)
//    {
//        cPyByyq.setCreateTime(DateUtils.getNowDate());
//        return cPyByyqMapper.insertCPyByyq(cPyByyq);
//    }
    /**
     * 新增毕业要求
     *
     * @param cPyByyq 毕业要求
     * @return 结果
     */
    @Override
    public int insertCPyByyq(CPyByyq cPyByyq)
    {
        CPyByyq info = cPyByyqMapper.selectCPyByyqByByyqId(cPyByyq.getParentId());
        cPyByyq.setAncestors(info.getAncestors() + "," + cPyByyq.getParentId());

        cPyByyq.setCreateTime(DateUtils.getNowDate());
        return cPyByyqMapper.insertCPyByyq(cPyByyq);
    }


//    /**
//     * 修改毕业要求
//     *
//     * @param cPyByyq 毕业要求
//     * @return 结果
//     */
//    @Override
//    public int updateCPyByyq(CPyByyq cPyByyq)
//    {
//        cPyByyq.setUpdateTime(DateUtils.getNowDate());
//        return cPyByyqMapper.updateCPyByyq(cPyByyq);
//    }


    /**
     * 修改毕业要求
     *
     * @param cPyByyq 毕业要求
     * @return 结果
     */
    @Override
    public int updateCPyByyq(CPyByyq cPyByyq)
    {
        CPyByyq newParentByyq = cPyByyqMapper.selectCPyByyqByByyqId(cPyByyq.getParentId());
        CPyByyq oldByyq = cPyByyqMapper.selectCPyByyqByByyqId(cPyByyq.getParentId());
        if (StringUtils.isNotNull(newParentByyq) && StringUtils.isNotNull(oldByyq))
        {
            String newAncestors = newParentByyq.getAncestors() + "," + newParentByyq.getByyqId();
            String oldAncestors = oldByyq.getAncestors();
            cPyByyq.setAncestors(newAncestors);
            updateCPyByyqChildren(cPyByyq.getByyqId(), newAncestors, oldAncestors);
        }

        cPyByyq.setUpdateTime(DateUtils.getNowDate());
        return cPyByyqMapper.updateCPyByyq(cPyByyq);
    }

    /**
     * 修改子元素关系
     *
     * @param byyqId 被修改的毕业要求ID
     * @param newAncestors 新的父ID集合
     * @param oldAncestors 旧的父ID集合
     */
    public void updateCPyByyqChildren(Long byyqId, String newAncestors, String oldAncestors)
    {
        List<CPyByyq> children = cPyByyqMapper.selectChildrenByyqById(byyqId);
        for (CPyByyq child : children)
        {
            child.setAncestors(child.getAncestors().replaceFirst(oldAncestors, newAncestors));
        }
        if (children.size() > 0)
        {
            cPyByyqMapper.updateByyqChildren(children);
        }
    }



    /**
     * 批量删除毕业要求
     * 
     * @param byyqIds 需要删除的毕业要求主键
     * @return 结果
     */
    @Override
    public int deleteCPyByyqByByyqIds(Long[] byyqIds)
    {
        return cPyByyqMapper.deleteCPyByyqByByyqIds(byyqIds);
    }

    /**
     * 删除毕业要求信息
     * 
     * @param byyqId 毕业要求主键
     * @return 结果
     */
    @Override
    public int deleteCPyByyqByByyqId(Long byyqId)
    {
        return cPyByyqMapper.deleteCPyByyqByByyqId(byyqId);
    }




//
//    /**
//     * 构建前端所需要树结构
//     *
//     * @param byyqs 毕业要求列表
//     * @return 树结构列表
//     */
//    @Override
//    public List<CPyByyq> buildByyqTree(List<CPyByyq> byyqs) {
//        List<CPyByyq> returnList = new ArrayList<CPyByyq>();
//        List<Long> tempList = new ArrayList<Long>();
//        for (CPyByyq byyq : byyqs)
//        {
//            tempList.add(byyq.getByyqId());
//        }
//        for (Iterator<CPyByyq> iterator = byyqs.iterator(); iterator.hasNext();)
//        {
//            CPyByyq byyq = (CPyByyq) iterator.next();
//            // 如果是顶级节点, 遍历该父节点的所有子节点
//            if (!tempList.contains(byyq.getParentId()))
//            {
//                recursionFn(byyqs, byyq);
//                returnList.add(byyq);
//            }
//        }
//        if (returnList.isEmpty())
//        {
//            returnList = byyqs;
//        }
//        return returnList;
//    }
//
//
//    /**
//     * 构建前端所需要下拉树结构
//     *
//     * @param byyqs 毕业要求列表
//     * @return 下拉树结构列表
//     */
//    @Override
//    public List<TreeSelect> buildByyqTreeSelect(List<CPyByyq> byyqs)
//    {
//        List<CPyByyq> byyqTrees = buildByyqTree(byyqs);
//        return byyqTrees.stream().map(TreeSelect::new).collect(Collectors.toList());
//    }
//
//
//    /**
//     * 是否存在子节点
//     *
//     * @param byyqId 部门ID
//     * @return 结果
//     */
//    @Override
//    public boolean hasChildByByyqId(Long byyqId)
//    {
//        int result = cPyByyqMapper.hasChildByByyqId(byyqId);
//        return result > 0 ? true : false;
//    }
//
//
//    /**
//     * 校验部门名称是否唯一
//     *
//     * @param cPyByyq 部门信息
//     * @return 结果
//     */
//    @Override
//    public String checkByyqNameUnique(CPyByyq cPyByyq)
//    {
//        Long byyqId = StringUtils.isNull(cPyByyq.getByyqId()) ? -1L : cPyByyq.getByyqId();
//        CPyByyq info = cPyByyqMapper.checkByyqNameUnique(cPyByyq.getByyqName(), cPyByyq.getParentId());
//        if (StringUtils.isNotNull(info) && info.getByyqId().longValue() != byyqId.longValue())
//        {
//            return UserConstants.NOT_UNIQUE;
//        }
//        return UserConstants.UNIQUE;
//    }
//
//
//
//    /**
//     * 递归列表
//     */
//    private void recursionFn(List<CPyByyq> list, CPyByyq t)
//    {
//        // 得到子节点列表
//        List<CPyByyq> childList = getChildList(list, t);
//        t.setChildren(childList);
//        for (CPyByyq tChild : childList)
//        {
//            if (hasChild(list, tChild))
//            {
//                recursionFn(list, tChild);
//            }
//        }
//    }
//
//    /**
//     * 得到子节点列表
//     */
//    private List<CPyByyq> getChildList(List<CPyByyq> list, CPyByyq t)
//    {
//        List<CPyByyq> tlist = new ArrayList<CPyByyq>();
//        Iterator<CPyByyq> it = list.iterator();
//        while (it.hasNext())
//        {
//            CPyByyq n = (CPyByyq) it.next();
//            if (StringUtils.isNotNull(n.getParentId()) && n.getParentId().longValue() == t.getByyqId().longValue())
//            {
//                tlist.add(n);
//            }
//        }
//        return tlist;
//    }
//
//    /**
//     * 判断是否有子节点
//     */
//    private boolean hasChild(List<CPyByyq> list, CPyByyq t)
//    {
//        return getChildList(list, t).size() > 0 ? true : false;
//    }


}
