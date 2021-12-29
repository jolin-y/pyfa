import request from '@/utils/request'

// 查询专业设置2列表
export function listZysz(query) {
  return request({
    url: '/drdc/zysz/list',
    method: 'get',
    params: query
  })
}

// 查询专业设置2详细
export function getZysz(zyId) {
  return request({
    url: '/drdc/zysz/' + zyId,
    method: 'get'
  })
}

// 新增专业设置2
export function addZysz(data) {
  return request({
    url: '/drdc/zysz',
    method: 'post',
    data: data
  })
}

// 修改专业设置2
export function updateZysz(data) {
  return request({
    url: '/drdc/zysz',
    method: 'put',
    data: data
  })
}

// 删除专业设置2
export function delZysz(zyId) {
  return request({
    url: '/drdc/zysz/' + zyId,
    method: 'delete'
  })
}

// 导出专业设置2
export function exportZysz(query) {
  return request({
    url: '/drdc/zysz/export',
    method: 'get',
    params: query
  })
}