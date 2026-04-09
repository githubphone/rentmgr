import request from "@/utils/request"

export function listMetadata(query) {
  return request({
    url: "/rental/metadata/list",
    method: "get",
    params: query
  })
}

export function getMetadata(id) {
  return request({
    url: "/rental/metadata/" + id,
    method: "get"
  })
}

export function exportMetadata(query) {
  return request({
    url: "/rental/metadata/export",
    method: "post",
    responseType: "blob",
    params: query
  })
}
