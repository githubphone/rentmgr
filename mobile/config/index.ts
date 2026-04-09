import { defineConfig } from '@tarojs/cli'

const config = defineConfig({
  projectName: 'rentmgr-mobile',
  date: '2026-4-1',
  designWidth: 750,
  deviceRatio: {
    640: 2.34 / 2,
    750: 1,
    828: 1.81 / 2,
    375: 2 / 1
  },
  sourceRoot: 'src',
  outputRoot: 'dist',
  plugins: [],
  defineConstants: {
  },
  copy: {
    patterns: [
    ],
    options: {
    }
  },
  framework: 'vue3',
  compiler: {
    type: 'webpack5',
    prebundle: { enable: false }
  },
  cache: {
    enable: false
  },
  mini: {
    postcss: {
      pxtransform: {
        enable: true,
        config: {

        }
      },
      url: {
        enable: true,
        config: {
          limit: 1024
        }
      },
      cssModules: {
        enable: false,
        config: {
          namingPattern: 'module',
          generateScopedName: '[name]__[local]___[hash:base64:5]'
        }
      }
    }
  },
  h5: {
    publicPath: '/',
    staticDirectory: 'static',
    alias: {
      '@': '/Users/moslunix/Medias/DevCodes/Java/rentmgr/mobile/src'
    },
    postcss: {
      autoprefixer: {
        enable: true,
        config: {
        }
      },
      cssModules: {
        enable: false,
        config: {
          namingPattern: 'module',
          generateScopedName: '[name]__[local]___[hash:base64:5]'
        }
      },
      pxtransform: {
        enable: false
      }
    },
    devServer: {
      port: 10086,
      host: 'localhost',
      https: false,
      proxy: {
        '/prod-api': {
          target: 'http://120.238.132.242:43886',
          changeOrigin: true,
          secure: false
        }
      }
    }
  }
})

module.exports = config
