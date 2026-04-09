import request from "@/utils/request"

export function listHouseMap(query) {
  return request({
    url: "/rental/house/map",
    method: "get",
    params: query
  })
}

export function listDeviceMap(query) {
  return request({
    url: "/rental/device/map",
    method: "get",
    params: query
  })
}

export function listAlertMap(query) {
  return request({
    url: "/rental/alert/map",
    method: "get",
    params: query
  })
}
