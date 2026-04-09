import request from "@/utils/request"

export function listDevice(query) {
  return request({
    url: "/rental/device/list",
    method: "get",
    params: query
  })
}

export function getDevice(id) {
  return request({
    url: "/rental/device/" + id,
    method: "get"
  })
}

export function addDevice(data) {
  return request({
    url: "/rental/device",
    method: "post",
    data: data
  })
}

export function updateDevice(data) {
  return request({
    url: "/rental/device",
    method: "put",
    data: data
  })
}

export function delDevice(id) {
  return request({
    url: "/rental/device/" + id,
    method: "delete"
  })
}

export function refreshDeviceStatus() {
  return request({
    url: "/rental/device/refresh-status",
    method: "put"
  })
}

export function getDeviceStatus(id) {
  return request({
    url: "/rental/device/" + id + "/status",
    method: "get"
  })
}

export function getDeviceHeartbeat() {
  return request({
    url: "/rental/device/heartbeat",
    method: "get"
  })
}

export function bindDevice(data) {
  return request({
    url: "/rental/device/bind",
    method: "post",
    data: data
  })
}

export function unbindDevice(id) {
  return request({
    url: "/rental/device/" + id + "/unbind",
    method: "put"
  })
}

export function syncCameras() {
  return request({
    url: "/rental/device/sync",
    method: "post"
  })
}

export function subscribeAlarm(id) {
  return request({
    url: "/rental/device/subscribe/alarm/" + id,
    method: "post"
  })
}

export function unsubscribeAlarm(id) {
  return request({
    url: "/rental/device/unsubscribe/alarm/" + id,
    method: "post"
  })
}

export function subscribeMetadata(id) {
  return request({
    url: "/rental/device/subscribe/metadata/" + id,
    method: "post"
  })
}

export function unsubscribeMetadata(id) {
  return request({
    url: "/rental/device/unsubscribe/metadata/" + id,
    method: "post"
  })
}
