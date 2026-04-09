import { defineStore } from 'pinia'
import { ref } from 'vue'
import config from '@/config'
import storage from '@/utils/storage'
import constant from '@/utils/constant'
import { isHttp, isEmpty } from "@/utils/validate"
import { login, logout, getInfo } from '@/api/login'
import { getToken, setToken, removeToken } from '@/utils/auth'

const baseUrl = config.baseUrl

export const useUserStore = defineStore('user', () => {
  const token = ref(getToken())
  const id = ref(storage.get(constant.id))
  const name = ref(storage.get(constant.name))
  const avatar = ref(storage.get(constant.avatar))
  const roles = ref(storage.get(constant.roles))
  const permissions = ref(storage.get(constant.permissions))

  const setTokenAction = (newToken: string) => {
    token.value = newToken
    setToken(newToken)
  }

  const setId = (newId: string) => {
    id.value = newId
    storage.set(constant.id, newId)
  }

  const setName = (newName: string) => {
    name.value = newName
    storage.set(constant.name, newName)
  }

  const setAvatar = (newAvatar: string) => {
    avatar.value = newAvatar
    storage.set(constant.avatar, newAvatar)
  }

  const setRoles = (newRoles: string[]) => {
    roles.value = newRoles
    storage.set(constant.roles, newRoles)
  }

  const setPermissions = (newPermissions: string[]) => {
    permissions.value = newPermissions
    storage.set(constant.permissions, newPermissions)
  }

  // 登录
  const Login = (userInfo: any) => {
    const username = userInfo.username.trim()
    const password = userInfo.password
    const code = userInfo.code
    const uuid = userInfo.uuid
    return new Promise((resolve, reject) => {
      login(username, password, code, uuid).then((res: any) => {
        setTokenAction(res.token)
        resolve(res)
      }).catch(error => {
        reject(error)
      })
    })
  }

  // 获取用户信息
  const GetInfo = () => {
    return new Promise((resolve, reject) => {
      getInfo().then((res: any) => {
        const user = res.user
        let avatar = user.avatar || ""
        if (!isHttp(avatar)) {
            avatar = (isEmpty(avatar)) ? '' : baseUrl + avatar
          }
          const userid = (isEmpty(user) || isEmpty(user.userId)) ? "" : user.userId
          const username = (isEmpty(user) || isEmpty(user.userName)) ? "" : user.userName
          if (res.roles && res.roles.length > 0) {
            setRoles(res.roles)
            setPermissions(res.permissions)
          } else {
            setRoles(['ROLE_DEFAULT'])
          }
          setId(userid)
          setName(username)
          setAvatar(avatar)
          resolve(res)
      }).catch(error => {
        reject(error)
      })
    })
  }

  // 退出系统
  const LogOut = () => {
    return new Promise((resolve, reject) => {
      logout().then(() => {
        token.value = ''
        roles.value = []
        permissions.value = []
        removeToken()
        storage.clean()
        resolve(true)
      }).catch(error => {
        reject(error)
      })
    })
  }

  return {
    token,
    id,
    name,
    avatar,
    roles,
    permissions,
    Login,
    GetInfo,
    LogOut
  }
})
