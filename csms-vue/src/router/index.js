import { createRouter, createWebHistory } from 'vue-router'
import { App } from 'vue'
// import LoginView from '../views/LoginView.vue'

const routes = [
  // {
  //   path: '/',
  //   redirect: 'login'
  // },
  // {
  //   path: '/login',
  //   name: 'login',
  //   component: LoginView
  // },
  {
    path: '/navi',
    name: '导航',
    component: App,
    children: [
      {
        path: '/home',
        name: '首页',
        component: () => import('../views/home.vue')
      },
      {
        path: '/user',
        name: '用户管理',
        component: () => import('../views/user.vue')
      },
      {
        path: '/goods',
        name: '货物管理',
        component: () => import('../views/goods.vue')
      },
      {
        path: '/store',
        name: '商店管理',
        component: () => import('../views/store.vue')
      },
      {
        path: '/vendor',
        name: '供应商管理',
        component: () => import('../views/vendor.vue')
      },
      {
        path: '/vip',
        name: '超级会员管理',
        component: () => import('../views/vip.vue')
      }
    ]
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
