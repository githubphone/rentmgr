import request from '@/utils/request'

export function getHouseList(params?: any) {
  return request({
    url: '/rental/house/list',
    method: 'get',
    params
  })
}

export function getHouse(id: string) {
  return request({
    url: `/rental/house/${id}`,
    method: 'get'
  })
}

export function getHouseDetail(id: string) {
  return getHouse(id)
}

export function addHouse(data: any) {
  return request({
    url: '/rental/house',
    method: 'post',
    data
  })
}

export function updateHouse(data: any) {
  return request({
    url: '/rental/house',
    method: 'put',
    data
  })
}

export function deleteHouse(id: string) {
  return request({
    url: `/rental/house/${id}`,
    method: 'delete'
  })
}
