<template>
  <div>
    <div>
      <tab-menu></tab-menu>
    </div>
    <h1>MyPage</h1>
    <dl>
      <dt>ID</dt>
      <dd>{{ user.id }}</dd>
      <dt>Name</dt>
      <dd>{{ user.name }}</dd>
      <dt>Department</dt>
      <dd>{{ user.email }}</dd>
      <!-- <dt>Gender</dt>
      <dd>{{ user.gender }}</dd>
      <dt>Birth</dt>
      <dd>{{ user.birth }}</dd>
      <dt>Joined Date</dt>
      <dd>{{ user.joined_date }}</dd>
      <dt>Payment</dt>
      <dd>{{ user.payment }}</dd>
      <dt>Password</dt>
      <dd>{{ user.password }}</dd> -->
    </dl>
  </div>
</template>

<script>
import axios from 'axios';

import TabMenu from 'TabMenu.vue'

export default {
  components: {
    TabMenu
  },
  data: function () {
    return {
      user: {}
    }
  },
  mounted () {
    axios
      .get(`/api/v1/users/${this.$route.params.id}.json`)
      .then(response => (this.user = response.data))
  }
}
</script>

<style scoped>
</style>