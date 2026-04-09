import request from '@/utils/request'

export function getResidentList(params?: any) {
  console.log('调用 getResidentList API，params:', params)
  return request({
    url: '/rental/resident/list',
    method: 'GET',
    params
  }).then((res) => {
    console.log('getResidentList API 返回:', res)
    return res
  }).catch((error) => {
    console.error('getResidentList API 调用失败:', error)
    throw error
  })
}

export function getResident(id: string) {
  return request({
    url: `/rental/resident/${id}`,
    method: 'GET'
  })
}

export function addResident(data: any) {
  return request({
    url: '/rental/resident',
    method: 'POST',
    data
  })
}

export function updateResident(data: any) {
  return request({
    url: '/rental/resident',
    method: 'PUT',
    data
  })
}

export function deleteResident(id: string) {
  return request({
    url: `/rental/resident/${id}`,
    method: 'DELETE'
  })
}