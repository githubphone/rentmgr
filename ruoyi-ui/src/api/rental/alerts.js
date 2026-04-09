import request from "@/utils/request"

export function listAlert(query) {
  return request({
    url: "/rental/alert/list",
    method: "get",
    params: query
  })
}

export function getAlert(id) {
  return request({
    url: "/rental/alert/" + id,
    method: "get"
  })
}

export function getAlertDetail(id) {
  return request({
    url: "/rental/alert/" + id + "/detail",
    method: "get"
  })
}

export function updateAlert(data) {
  return request({
    url: "/rental/alert",
    method: "put",
    data: data
  })
}

export function batchResolveAlert(data) {
  return request({
    url: "/rental/alert/batch-resolve",
    method: "put",
    data: data
  })
}

export function transferAlert(id, data) {
  return request({
    url: "/rental/alert/" + id + "/transfer",
    method: "put",
    data: data
  })
}

export function getAlertStatistics(query) {
  return request({
    url: "/rental/alert/statistics",
    method: "get",
    params: query
  })
}
