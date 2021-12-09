import request from '@/utils/request'

// 查询教师信息列表
export function listTeacherInfo(query) {
  return request({
    url: '/drdc/teacherInfo/list',
    method: 'get',
    params: query
  })
}

// 查询教师信息详细
export function getTeacherInfo(teacherId) {
  return request({
    url: '/drdc/teacherInfo/' + teacherId,
    method: 'get'
  })
}

// 新增教师信息
export function addTeacherInfo(data) {
  return request({
    url: '/drdc/teacherInfo',
    method: 'post',
    data: data
  })
}

// 修改教师信息
export function updateTeacherInfo(data) {
  return request({
    url: '/drdc/teacherInfo',
    method: 'put',
    data: data
  })
}

// 删除教师信息
export function delTeacherInfo(teacherId) {
  return request({
    url: '/drdc/teacherInfo/' + teacherId,
    method: 'delete'
  })
}

// 导出教师信息
export function exportTeacherInfo(query) {
  return request({
    url: '/drdc/teacherInfo/export',
    method: 'get',
    params: query
  })
}

// 导出教师信息word
export function exportTeacherInfoWord(query) {
  return request({
    url: '/drdc/teacherInfo/exportWord',
    method: 'get',
    params: query
  })
}
