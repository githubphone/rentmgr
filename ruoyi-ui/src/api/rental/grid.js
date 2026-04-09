import request from "@/utils/request"

export function listGrid(query) {
  return request({
    url: "/rental/grid/list",
    method: "get",
    params: query
  })
}

export function getGrid(id) {
  return request({
    url: "/rental/grid/" + id,
    method: "get"
  })
}

export function addGrid(data) {
  return request({
    url: "/rental/grid",
    method: "post",
    data: data
  })
}

export function updateGrid(data) {
  return request({
    url: "/rental/grid",
    method: "put",
    data: data
  })
}

export function delGrid(id) {
  return request({
    url: "/rental/grid/" + id,
    method: "delete"
  })
}

export function listRoleGrid(query) {
  return request({
    url: "/rental/grid/role/list",
    method: "get",
    params: query
  })
}

export function addRoleGrid(data) {
  return request({
    url: "/rental/grid/role",
    method: "post",
    data: data
  })
}

export function delRoleGrid(id) {
  return request({
    url: "/rental/grid/role/" + id,
    method: "delete"
  })
}

export function getGridIdByRoleId(roleId) {
  return request({
    url: "/rental/grid/role/gridId/" + roleId,
    method: "get"
  })
}
