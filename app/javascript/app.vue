<template>
  <div>
    <router-view></router-view>
  </div>
</template>

<script>
import Vue from 'vue'
import VueRouter from 'vue-router'

import EmployeeIndexPage from 'EmployeeIndexPage.vue'
import EmployeeDetailPage from 'EmployeeDetailPage.vue'
import EmployeeNewPage from 'EmployeeNewPage.vue'
import EmployeeEditPage from 'EmployeeEditPage.vue'

import LibraryIndexPage from 'LibraryIndexPage.vue'
import LibraryDetailPage from 'LibraryDetailPage.vue'

import index from 'index.vue'

const router = new VueRouter({
  routes: [
    { path: '/',
      component: index },
    { path: '/#/',
      component: index },
    { path: '/libraries/:name',
      name: 'LibraryIndexPage',
      component: LibraryIndexPage },
    { path: '/libraries/:name/:id',
      name: 'LibraryDetailPage',
      component: LibraryDetailPage },
    { path: '/employees/:id(\\d+)',  // :id は数値のみに制限する
      name: 'EmployeeDetailPage',  // ルートに名前を付けている ref. https://router.vuejs.org/ja/guide/essentials/named-routes.html#%E5%90%8D%E5%89%8D%E4%BB%98%E3%81%8D%E3%83%AB%E3%83%BC%E3%83%88
      component: EmployeeDetailPage  },
    { path: '/employees/new',
      name: 'EmployeeNewPage',
      component: EmployeeNewPage  },
    { path: '/employees/:id(\\d+)/edit',
      name: 'EmployeeEditPage',
      component: EmployeeEditPage   }
  ]
})

// ref. https://jp.vuejs.org/v2/guide/plugins.html#%E3%83%97%E3%83%A9%E3%82%B0%E3%82%A4%E3%83%B3%E3%81%AE%E4%BD%BF%E7%94%A8
Vue.use(VueRouter)

export default {
  router,
  components: {
  }
}
</script>

<style scoped>
* {
  margin: 0px;
}
</style>