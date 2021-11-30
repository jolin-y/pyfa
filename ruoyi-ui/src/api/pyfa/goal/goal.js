import request from '@/utils/request'

// 查询培养目标表列表
export function listGoal(query) {
  return request({
    url: '/pyfa/goal/list',
    method: 'get',
    params: query
  })
}

// 查询培养目标表详细
export function getGoal(goalId) {
  return request({
    url: '/pyfa/goal/' + goalId,
    method: 'get'
  })
}

// 培养方案id  查询培养目标表
export function getGoal_pyfa(pyfaId) {
  return request({
    url: '/pyfa/goal/pyfaId/' + pyfaId,
    method: 'get'
  })
}


// 新增培养目标表
export function addGoal(data) {
  return request({
    url: '/pyfa/goal',
    method: 'post',
    data: data
  })
}

// 修改培养目标表
export function updateGoal(data) {
  return request({
    url: '/pyfa/goal',
    method: 'put',
    data: data
  })
}

// 删除培养目标表
export function delGoal(goalId) {
  return request({
    url: '/pyfa/goal/' + goalId,
    method: 'delete'
  })
}

// 导出培养目标表
export function exportGoal(query) {
  return request({
    url: '/pyfa/goal/export',
    method: 'get',
    params: query
  })
}
