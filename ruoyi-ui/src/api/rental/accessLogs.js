import request from "@/utils/request"

export function listAccessLog(query) {
  return request({
    url: "/rental/access/list",
    method: "get",
    params: query
  })
}

export function getAccessLog(id) {
  return request({
    url: "/rental/access/" + id,
    method: "get"
  })
}

export function exportAccessLog(query) {
  return request({
    url: "/rental/access/export",
    method: "get",
    params: query,
    responseType: "blob"
  })
}

export function getHeatMapData(query) {
  return request({
    url: "/rental/access/heatmap",
    method: "get",
    params: query
  })
}

export function getAccessTrend(query) {
  return request({
    url: "/rental/access/trend",
    method: "get",
    params: query
  })
}

export function pushAccessLog(data) {
  return request({
    url: "/rental/push/access-log",
    method: "post",
    data: data
  })
}
