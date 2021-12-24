import request from '@/utils/request'

// 查询学院专业列表
export function listXyzy(query) {
  return request({
    url: '/drdc/xyzy/list',
    method: 'get',
    params: query
  })
}

// 查询学院专业详细
export function getXyzy(xyzyId) {
  return request({
    url: '/drdc/xyzy/' + xyzyId,
    method: 'get'
  })
}

// 新增学院专业
export function addXyzy(data) {
  return request({
    url: '/drdc/xyzy',
    method: 'post',
    data: data
  })
}

// 修改学院专业
export function updateXyzy(data) {
  return request({
    url: '/drdc/xyzy',
    method: 'put',
    data: data
  })
}

// 删除学院专业
export function delXyzy(xyzyId) {
  return request({
    url: '/drdc/xyzy/' + xyzyId,
    method: 'delete'
  })
}

// 导出学院专业
export function exportXyzy(query) {
  return request({
    url: '/drdc/xyzy/export',
    method: 'get',
    params: query
  })
}

// 导出教师信息word
export function exportXyzyWord(query) {
  return request({
    url: '/drdc/xyzy/exportWord',
    method: 'get',
    params: query
  })
}



// 查询部门下拉树结构
export function xyzyTreeselect() {
  return request({
    url: '/drdc/xyzy/treeselect',
    method: 'get'
  })
}
