import request from '@/utils/request'

export function listGrid(query?: any) {
  return request({
    url: '/rental/grid/list',
    method: 'get',
    params: query
  })
}

export function getGrid(id: string) {
  return request({
    url: `/rental/grid/${id}`,
    method: 'get'
  })
}
