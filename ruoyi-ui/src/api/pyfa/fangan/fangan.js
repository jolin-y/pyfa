import request from '@/utils/request'

// 查询培养方案列表
export function listFangan(query) {
  return request({
    url: '/pyfa/fangan/list',
    method: 'get',
    params: query
  })
}

// 查询培养方案详细
export function getFangan(id) {
  return request({
    url: '/pyfa/fangan/' + id,
    method: 'get'
  })
}

// 新增培养方案
export function addFangan(data) {
  return request({
    url: '/pyfa/fangan',
    method: 'post',
    data: data
  })
}

// 修改培养方案
export function updateFangan(data) {
  return request({
    url: '/pyfa/fangan',
    method: 'put',
    data: data
  })
}

// 删除培养方案
export function delFangan(id) {
  return request({
    url: '/pyfa/fangan/' + id,
    method: 'delete'
  })
}

// 导出培养方案
export function exportFangan(query) {
  return request({
    url: '/pyfa/fangan/export',
    method: 'get',
    params: query
  })
}
