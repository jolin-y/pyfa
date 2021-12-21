import request from '@/utils/request'

// 查询高教-专任教师与学生列表
export function listZrjsyxs(query) {
  return request({
    url: '/drdc/zrjsyxs/list',
    method: 'get',
    params: query
  })
}

// 查询高教-专任教师与学生详细
export function getZrjsyxs(zrjsyxsId) {
  return request({
    url: '/drdc/zrjsyxs/' + zrjsyxsId,
    method: 'get'
  })
}

// 新增高教-专任教师与学生
export function addZrjsyxs(data) {
  return request({
    url: '/drdc/zrjsyxs',
    method: 'post',
    data: data
  })
}

// 修改高教-专任教师与学生
export function updateZrjsyxs(data) {
  return request({
    url: '/drdc/zrjsyxs',
    method: 'put',
    data: data
  })
}

// 删除高教-专任教师与学生
export function delZrjsyxs(zrjsyxsId) {
  return request({
    url: '/drdc/zrjsyxs/' + zrjsyxsId,
    method: 'delete'
  })
}

// 导出高教-专任教师与学生
export function exportZrjsyxs(query) {
  return request({
    url: '/drdc/zrjsyxs/export',
    method: 'get',
    params: query
  })
}