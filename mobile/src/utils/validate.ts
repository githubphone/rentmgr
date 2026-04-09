/**
 * 判断是否为空
 */
export function isEmpty(value: any): boolean {
  if (value == null || value === undefined || value === '') {
    return true
  }
  if (Array.isArray(value) && value.length === 0) {
    return true
  }
  if (typeof value === 'object' && Object.keys(value).length === 0) {
    return true
  }
  return false
}

/**
 * 判断是否为 http(s):// 开头的链接
 */
export function isHttp(url: string): boolean {
  return !!url && url.startsWith('http')
}
