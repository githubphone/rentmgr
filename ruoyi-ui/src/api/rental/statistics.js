import request from "@/utils/request"

export function getDashboardStatistics() {
  return request({
    url: "/rental/statistics/dashboard",
    method: "get"
  })
}

export function getAccessTrend(query) {
  return request({
    url: "/rental/statistics/access/trend",
    method: "get",
    params: query
  })
}

export function getAlertTrend(query) {
  return request({
    url: "/rental/statistics/alert/trend",
    method: "get",
    params: query
  })
}

export function getStrangerTop(query) {
  return request({
    url: "/rental/statistics/stranger-top",
    method: "get",
    params: query
  })
}

export function getRegistrationRate(query) {
  return request({
    url: "/rental/statistics/registration-rate",
    method: "get",
    params: query
  })
}

export function getDeviceOnlineRate(query) {
  return request({
    url: "/rental/statistics/device-online-rate",
    method: "get",
    params: query
  })
}

export function getRecentAlerts() {
  return request({
    url: "/rental/statistics/recent-alerts",
    method: "get"
  })
}

export function getDeviceStatusStats() {
  return request({
    url: "/rental/statistics/device-status",
    method: "get"
  })
}

export function getAlertHandleTimeStats(query) {
  return request({
    url: "/rental/statistics/alert-handle-time",
    method: "get",
    params: query
  })
}

export function getAlertStats() {
  return request({
    url: "/rental/statistics/alert/level",
    method: "get"
  })
}

export function getAccessHeatmap(query) {
  return request({
    url: "/rental/statistics/access-heatmap",
    method: "get",
    params: query
  })
}
