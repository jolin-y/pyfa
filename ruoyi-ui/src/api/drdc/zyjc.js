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
export function getZyjc(zyId) {
  return request({
    url: '/drdc/zyjc/' + zyId,
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
export function delZyjc(zyId) {
  return request({
    url: '/drdc/zyjc/' + zyId,
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


// 导出专业监测word
export function exportZyjcInfoWord(query) {
  return request({
    url: '/drdc/zyjc/exportWord',
    method: 'get',
    params: query
  })
}
