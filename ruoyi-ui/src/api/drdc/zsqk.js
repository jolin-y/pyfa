import request from '@/utils/request'

// 查询高教-招生情况列表
export function listZsqk(query) {
  return request({
    url: '/drdc/zsqk/list',
    method: 'get',
    params: query
  })
}

// 查询高教-招生情况详细
export function getZsqk(zsqkId) {
  return request({
    url: '/drdc/zsqk/' + zsqkId,
    method: 'get'
  })
}

// 新增高教-招生情况
export function addZsqk(data) {
  return request({
    url: '/drdc/zsqk',
    method: 'post',
    data: data
  })
}

// 修改高教-招生情况
export function updateZsqk(data) {
  return request({
    url: '/drdc/zsqk',
    method: 'put',
    data: data
  })
}

// 删除高教-招生情况
export function delZsqk(zsqkId) {
  return request({
    url: '/drdc/zsqk/' + zsqkId,
    method: 'delete'
  })
}

// 导出高教-招生情况
export function exportZsqk(query) {
  return request({
    url: '/drdc/zsqk/export',
    method: 'get',
    params: query
  })
}