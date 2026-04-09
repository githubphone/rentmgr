import request from "@/utils/request"

export function listHouse(query) {
  return request({
    url: "/rental/house/list",
    method: "get",
    params: query
  })
}

export function listHouseSimple() {
  return request({
    url: "/rental/house/simple",
    method: "get"
  })
}

export function getHouse(id) {
  return request({
    url: "/rental/house/" + id,
    method: "get"
  })
}

export function addHouse(data) {
  return request({
    url: "/rental/house",
    method: "post",
    data: data
  })
}

export function updateHouse(data) {
  return request({
    url: "/rental/house",
    method: "put",
    data: data
  })
}

export function delHouse(id) {
  return request({
    url: "/rental/house/" + id,
    method: "delete"
  })
}

export function nearbyHouse(query) {
  return request({
    url: "/rental/house/nearby",
    method: "get",
    params: query
  })
}

export function exportHouse(query) {
  return request({
    url: "/rental/house/export",
    method: "get",
    params: query,
    responseType: "blob"
  })
}

export function importHouse(data) {
  return request({
    url: "/rental/house/import",
    method: "post",
    data: data,
    headers: {
      "Content-Type": "multipart/form-data"
    }
  })
}
