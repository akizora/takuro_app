<template>
  <div>
    <div>
      <tab-menu></tab-menu>
    </div>
    <div class="container">
      <h3>{{ library[0].formal }}</h3>
      <table>
        <tbody>
          <tr>
            <th>url</th>
            <td><a v-bind:href="library[0].url_pc">{{ library[0].url_pc }}</a></td>
          </tr>
          <tr>
            <th>tel</th>
            <td>{{ library[0].tel }}</td>
          </tr>
          <tr>
            <th>post</th>
            <td>{{ library[0].post }}</td>
          </tr>
          <tr>
            <th>address</th>
            <td>{{ library[0].address }}</td>
          </tr>
          <tr>
            <th>category</th>
            <td>{{ library[0].category }}</td>
          </tr>
          <tr>
            <th>geocode</th>
            <td>{{ library[0].geocode }}</td>
          </tr>
        </tbody>
      </table>
    </div>
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
      library: {}
    }
  },
  mounted () {
    axios
      .get(`/api/v1/libraries/${this.$route.params.id}.json`)
      .then(response => (this.library = response.data))
  }
}
</script>

<style scoped>

</style>