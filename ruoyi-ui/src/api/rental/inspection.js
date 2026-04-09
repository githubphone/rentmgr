import request from "@/utils/request"

export function listInspection(query) {
  return request({
    url: "/rental/inspection/list",
    method: "get",
    params: query
  })
}

export function getInspection(id) {
  return request({
    url: "/rental/inspection/" + id,
    method: "get"
  })
}

export function addInspection(data) {
  return request({
    url: "/rental/inspection",
    method: "post",
    data: data
  })
}

export function updateInspection(data) {
  return request({
    url: "/rental/inspection",
    method: "put",
    data: data
  })
}

export function delInspection(id) {
  return request({
    url: "/rental/inspection/" + id,
    method: "delete"
  })
}

export function getLatestInspection(houseId) {
  return request({
    url: "/rental/inspection/house/" + houseId + "/latest",
    method: "get"
  })
}
