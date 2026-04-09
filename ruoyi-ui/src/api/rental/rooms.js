import request from "@/utils/request"

export function listRoom(query) {
  return request({
    url: "/rental/room/list",
    method: "get",
    params: query
  })
}

export function getRoomsByHouseId(houseId) {
  return request({
    url: "/rental/room/simple/" + houseId,
    method: "get"
  })
}

export function getRoom(id) {
  return request({
    url: "/rental/room/" + id,
    method: "get"
  })
}

export function addRoom(data) {
  return request({
    url: "/rental/room",
    method: "post",
    data: data
  })
}

export function updateRoom(data) {
  return request({
    url: "/rental/room",
    method: "put",
    data: data
  })
}

export function delRoom(id) {
  return request({
    url: "/rental/room/" + id,
    method: "delete"
  })
}
