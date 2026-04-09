import request from '@/utils/request'

export function getDashboardStatistics() {
  return request({
    url: '/rental/statistics/dashboard',
    method: 'get'
  })
}

export function getDeviceStatusStats() {
  return request({
    url: '/rental/statistics/device',
    method: 'get'
  })
}

export function getAlertStats() {
  return request({
    url: '/rental/statistics/alert/level',
    method: 'get'
  })
}

export function getHouseStats() {
  return request({
    url: '/rental/statistics/house/byTownStreet',
    method: 'get'
  })
}

export function getResidentStats() {
  return request({
    url: '/rental/statistics/base',
    method: 'get'
  })
}