import request from '@/utils/request'

// 查询毕业要求列表
export function listByyq(query) {
  return request({
    url: '/pyfa/byyq/list',
    method: 'get',
    params: query
  })
}

// 查询部门列表（排除节点）
export function listByyqExcludeChild(byyqId) {
  return request({
    url: '/pyfa/byyq/list/exclude/' + byyqId,
    method: 'get'
  })
}

// 查询部门下拉树结构
export function treeselect() {
  return request({
    url: '/pyfa/byyq/treeselect',
    method: 'get'
  })
}

// 查询毕业要求详细
export function getByyq(byyqId) {
  return request({
    url: '/pyfa/byyq/' + byyqId,
    method: 'get'
  })
}

// 新增毕业要求
export function addByyq(data) {
  return request({
    url: '/pyfa/byyq',
    method: 'post',
    data: data
  })
}

// 修改毕业要求
export function updateByyq(data) {
  return request({
    url: '/pyfa/byyq',
    method: 'put',
    data: data
  })
}

// 删除毕业要求
export function delByyq(byyqId) {
  return request({
    url: '/pyfa/byyq/' + byyqId,
    method: 'delete'
  })
}

// 导出毕业要求
export function exportByyq(query) {
  return request({
    url: '/pyfa/byyq/export',
    method: 'get',
    params: query
  })
}
