import request from '@/utils/request'

export function getRoomList(houseId: string) {
  console.log('调用 getRoomList API，houseId:', houseId)
  return request({
    url: '/rental/room/list',
    method: 'GET',
    params: { houseId }
  }).then((res) => {
    console.log('getRoomList API 返回:', res)
    return res
  }).catch((error) => {
    console.error('getRoomList API 调用失败:', error)
    throw error
  })
}

export function getRoom(id: string) {
  return request({
    url: `/rental/room/${id}`,
    method: 'GET'
  })
}

export function getRoomDetail(id: string) {
  return getRoom(id)
}

export function addRoom(data: any) {
  return request({
    url: '/rental/room',
    method: 'POST',
    data
  })
}

export function updateRoom(data: any) {
  return request({
    url: '/rental/room',
    method: 'PUT',
    data
  })
}

export function deleteRoom(id: string) {
  return request({
    url: `/rental/room/${id}`,
    method: 'DELETE'
  })
}
