import request from '@/utils/request'

// 查询高教-毕业与就业列表
export function listByyjy(query) {
  return request({
    url: '/drdc/byyjy/list',
    method: 'get',
    params: query
  })
}

// 查询高教-毕业与就业详细
export function getByyjy(byyjyId) {
  return request({
    url: '/drdc/byyjy/' + byyjyId,
    method: 'get'
  })
}

// 新增高教-毕业与就业
export function addByyjy(data) {
  return request({
    url: '/drdc/byyjy',
    method: 'post',
    data: data
  })
}

// 修改高教-毕业与就业
export function updateByyjy(data) {
  return request({
    url: '/drdc/byyjy',
    method: 'put',
    data: data
  })
}

// 删除高教-毕业与就业
export function delByyjy(byyjyId) {
  return request({
    url: '/drdc/byyjy/' + byyjyId,
    method: 'delete'
  })
}

// 导出高教-毕业与就业
export function exportByyjy(query) {
  return request({
    url: '/drdc/byyjy/export',
    method: 'get',
    params: query
  })
}