<template>
  <div>
    <div>
      <tab-menu></tab-menu>
    </div>
    <div>
      <user-form-pane :errors="errors" :user="user" @submit="createUser"></user-form-pane>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

import TabMenu from 'TabMenu.vue'
import UserFormPane from 'UserFormPane.vue';

export default {
  components: {
    TabMenu,
    UserFormPane
  },
  data: function () {
    return {
      user: {
        name: '',
        email: '',
        password: ''
        // gender: '',
        // birth: '',
        // joined_date: '',
        // payment: '',
        // note: ''
      },
      errors: ''
    }
  },
  methods: {
    createUser: function() {
      axios
        .post('/api/v1/users', this.user)
        .then(response => {
          let e = response.data;
          this.$router.push({ name: 'UserDetailPage', params: { id: e.id } });
        })
        .catch(error => {
          console.error(error);
          if (error.response.data && error.response.data.errors) {
            this.errors = error.response.data.errors;
          }
        });
    }
  }
}
</script>

<style scoped>
</style>