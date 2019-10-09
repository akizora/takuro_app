<template>
  <div class="container">
    <tab-menu></tab-menu>
    <mymain></mymain>
    <search-card></search-card>
    <my-footer></my-footer>
  </div>
</template>

<script>
import Vue from 'vue'

import TabMenu from 'TabMenu.vue'
import mymain from 'mymain.vue'
import SearchCard from 'SearchCard.vue'
import MyFooter from 'MyFooter.vue'

export default {
  components: {
    TabMenu,
    mymain,
    SearchCard,
    MyFooter
  }
}
</script>

<style scoped>
* {
  margin: 0px;
}
</style>