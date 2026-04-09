import request from '@/utils/request'

export function getDeviceList(params?: any) {
  return request({
    url: '/rental/device/list',
    method: 'get',
    params
  })
}

export function getDevice(id: string) {
  return request({
    url: '/rental/device/' + id,
    method: 'get'
  })
}

export function addDevice(data: any) {
  return request({
    url: '/rental/device',
    method: 'post',
    data
  })
}

export function updateDevice(data: any) {
  return request({
    url: '/rental/device',
    method: 'put',
    data
  })
}

export function deleteDevice(id: string) {
  return request({
    url: '/rental/device/' + id,
    method: 'delete'
  })
}

export function refreshDeviceStatus() {
  return request({
    url: '/rental/device/refresh-status',
    method: 'put'
  })
}

export function syncCameras() {
  return request({
    url: '/rental/device/sync',
    method: 'post'
  })
}