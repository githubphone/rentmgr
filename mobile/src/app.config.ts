export default defineAppConfig({
  pages: [
    'pages/login/index',
    'pages/register/index',
    'pages/index/index',
    'pages/work/index',
    'pages/mine/index',
    'pages/mine/info/index',
    'pages/mine/info/edit',
    'pages/mine/avatar/index',
    'pages/mine/pwd/index',
    'pages/mine/setting/index',
    'pages/mine/help/index',
    'pages/mine/about/index',
    'pages/common/webview/index',
    'pages/common/textview/index',
    'pages/rental/house/list',
    'pages/rental/house/form',
    'pages/rental/house/map',
    'pages/rental/house/detail',
    'pages/rental/room/detail',
    'pages/rental/room/form',
    'pages/rental/resident/list',
    'pages/rental/resident/detail',
    'pages/rental/resident/form',
    'pages/rental/alert/list',
    'pages/rental/alert/detail',
    'pages/rental/device/list',
    'pages/rental/device/detail',
  ],
  window: {
    backgroundTextStyle: 'light',
    navigationBarBackgroundColor: '#fff',
    navigationBarTitleText: '租赁管理系统',
    navigationBarTextStyle: 'black'
  },
  tabBar: {
    color: '#000000',
    selectedColor: '#000000',
    borderStyle: 'white',
    backgroundColor: '#ffffff',
    list: [
      {
        pagePath: 'pages/index/index',
        iconPath: 'assets/images/tabbar/home.png',
        selectedIconPath: 'assets/images/tabbar/home_.png',
        text: '首页'
      },
      {
        pagePath: 'pages/work/index',
        iconPath: 'assets/images/tabbar/work.png',
        selectedIconPath: 'assets/images/tabbar/work_.png',
        text: '工作台'
      },
      {
        pagePath: 'pages/mine/index',
        iconPath: 'assets/images/tabbar/mine.png',
        selectedIconPath: 'assets/images/tabbar/mine_.png',
        text: '我的'
      }
    ]
  }
})
