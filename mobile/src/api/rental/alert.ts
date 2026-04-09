import request from '@/utils/request'

export function getAlertList(params?: any) {
  return request({
    url: '/rental/alert/list',
    method: 'get',
    params
  })
}

export function getAlert(id: string) {
  return request({
    url: '/rental/alert/' + id,
    method: 'get'
  })
}

export function getAlertDetail(id: string) {
  return request({
    url: '/rental/alert/' + id + '/detail',
    method: 'get'
  })
}

export function handleAlert(data: any) {
  return request({
    url: '/rental/alert',
    method: 'post',
    data
  })
}

export function batchResolveAlert(data: any) {
  return request({
    url: '/rental/alert/batch-resolve',
    method: 'put',
    data
  })
}

export function transferAlert(data: any) {
  return request({
    url: '/rental/alert/' + data.id + '/transfer',
    method: 'put',
    data
  })
}

export function deleteAlert(id: string) {
  return request({
    url: '/rental/alert/' + id,
    method: 'delete'
  })
}