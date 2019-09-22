<template>
  <div class="container">
    <tab-menu></tab-menu>
    <mymain></mymain>
    <search-card></search-card>
  </div>
</template>

<script>
import Vue from 'vue'

import TabMenu from 'TabMenu.vue'
import mymain from 'mymain.vue'
import SearchCard from 'SearchCard.vue'

export default {
  components: {
    TabMenu,
    mymain,
    SearchCard
  }
}
</script>

<style scoped>
* {
  margin: 0px;
}
</style>