import request from "@/utils/request"

export function listResident(query) {
  return request({
    url: "/rental/resident/list",
    method: "get",
    params: query
  })
}

export function getResident(id) {
  return request({
    url: "/rental/resident/" + id,
    method: "get"
  })
}

export function addResident(data) {
  return request({
    url: "/rental/resident",
    method: "post",
    data: data
  })
}

export function updateResident(data) {
  return request({
    url: "/rental/resident",
    method: "put",
    data: data
  })
}

export function delResident(id) {
  return request({
    url: "/rental/resident/" + id,
    method: "delete"
  })
}

export function uploadFacePhoto(id, data) {
  return request({
    url: "/rental/resident/" + id + "/face",
    method: "post",
    data: data,
    headers: {
      "Content-Type": "multipart/form-data"
    }
  })
}

export function batchCheckIn(data) {
  return request({
    url: "/rental/resident/batch-check-in",
    method: "post",
    data: data
  })
}

export function batchCheckOut(data) {
  return request({
    url: "/rental/resident/batch-check-out",
    method: "post",
    data: data
  })
}

export function exportResident(query) {
  return request({
    url: "/rental/resident/export",
    method: "get",
    params: query,
    responseType: "blob"
  })
}

export function importResident(data) {
  return request({
    url: "/rental/resident/import",
    method: "post",
    data: data,
    headers: {
      "Content-Type": "multipart/form-data"
    }
  })
}
