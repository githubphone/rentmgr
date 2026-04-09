---
name: fix-vite-plugin-vue-version
overview: 升级 @vitejs/plugin-vue 从 4.2.0 到 4.6.2，解决与 @vue/compiler-sfc@3.5.31 的兼容性导致 SFC 解析失败的问题。
todos:
  - id: upgrade-plugin-vue
    content: 修改 `mobile/package.json`，将 `@vitejs/plugin-vue` 版本从 `4.2.0` 升级至 `4.6.2`
    status: completed
  - id: pnpm-install
    content: 在 `mobile/` 目录执行 `pnpm install` 更新依赖
    status: completed
    dependencies:
      - upgrade-plugin-vue
  - id: restart-dev
    content: 重启 `pnpm dev:h5` 验证构建是否成功
    status: completed
    dependencies:
      - pnpm-install
---

## 问题描述

`pnpm dev:h5` 启动时报错 `Plugin: vite:vue`，`login.vue` 的 Vue SFC 解析失败。

## 根因

`@vitejs/plugin-vue@4.2.0` 发布时内置的 `@vue/compiler-sfc` 版本较旧，与当前项目实际安装的 `@vue/compiler-sfc@3.5.31`（来自 `vue@3.5.31`）存在兼容性问题，导致 `compiler.parse()` 在解析 SFC 时抛出 `SyntaxError`。

## 修复方案

将 `@vitejs/plugin-vue` 升级至 `4.6.2`（4.x 最新版），该版本已修复与新版本 `@vue/compiler-sfc` 的兼容性问题。

## 技术方案

- 将 `mobile/package.json` 中 `@vitejs/plugin-vue` 版本从 `4.2.0` 改为 `4.6.2`
- 执行 `pnpm install` 更新依赖并重建 lockfile
- 重启 dev server 验证