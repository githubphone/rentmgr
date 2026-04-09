import request from "@/utils/request"

export function listManager(query) {
  return request({
    url: "/rental/manager/list",
    method: "get",
    params: query
  })
}

export function getManager(id) {
  return request({
    url: "/rental/manager/" + id,
    method: "get"
  })
}

export function addManager(data) {
  return request({
    url: "/rental/manager",
    method: "post",
    data: data
  })
}

export function updateManager(data) {
  return request({
    url: "/rental/manager",
    method: "put",
    data: data
  })
}

export function delManager(id) {
  return request({
    url: "/rental/manager/" + id,
    method: "delete"
  })
}

export function listManagerHouse(query) {
  return request({
    url: "/rental/manager/house/list",
    method: "get",
    params: query
  })
}

export function addManagerHouse(data) {
  return request({
    url: "/rental/manager/house",
    method: "post",
    data: data
  })
}

export function delManagerHouse(id) {
  return request({
    url: "/rental/manager/house/" + id,
    method: "delete"
  })
}

export function getHousesByManagerId(managerId) {
  return request({
    url: "/rental/manager/houses/" + managerId,
    method: "get"
  })
}
