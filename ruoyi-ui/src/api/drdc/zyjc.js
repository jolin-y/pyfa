import request from '@/utils/request'

// 查询专业监测列表
export function listZyjc(query) {
  return request({
    url: '/drdc/zyjc/list',
    method: 'get',
    params: query
  })
}

// 查询专业监测详细
export function getZyjc(xyzyId) {
  return request({
    url: '/drdc/zyjc/' + xyzyId,
    method: 'get'
  })
}

// 新增专业监测
export function addZyjc(data) {
  return request({
    url: '/drdc/zyjc',
    method: 'post',
    data: data
  })
}

// 修改专业监测
export function updateZyjc(data) {
  return request({
    url: '/drdc/zyjc',
    method: 'put',
    data: data
  })
}

// 删除专业监测
export function delZyjc(xyzyId) {
  return request({
    url: '/drdc/zyjc/' + xyzyId,
    method: 'delete'
  })
}

// 导出专业监测
export function exportZyjc(query) {
  return request({
    url: '/drdc/zyjc/export',
    method: 'get',
    params: query
  })
}