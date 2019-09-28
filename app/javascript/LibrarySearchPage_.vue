<template>
  <div>
    <div v-if="errors.length != 0">
      <ul v-for="e in errors" :key="e">
        <li><font color="red">{{ e }}</font></li>
      </ul>
    </div>
    <table>
      <tbody>
        <tr>
          <th>name</th>
          <th>address</th>
          <th>tel</th>
          <th>url</th>
        </tr>
        <tr v-for="e in libraries" :key="e.id">
          <!-- <td><router-link :to="{ name: 'LibraryDetailPage', params: { id: e.id } }">{{ e.id }}</router-link></td> -->
          <td>{{ e.short }}</td>
          <td>{{ e.address }}</td>
          <td>{{ e.tel }}</td>
          <td>{{ e.url_pc }}</td>
        </tr>
      </tbody>
    </table>
    <modal v-if="showModal" @cancel="showModal = false" @ok="deleteLibraries(); showModal = false;">
      <div slot="body">Are you sure?</div>
    </modal>
  </div>
</template>

<script>
import axios from 'axios';

import Modal from 'Modal.vue'

export default {
  components: {
    Modal
  },
  data: function () {
    return {
      libraries: [],
      showModal: false,
      deleteTarget: -1,
      errors: ''
      }
    },
    mounted () {
      this.updateLibraries();
    },
    methods: {
    deleteEmployee: function() {
      if (this.deleteTarget <= 0) {
        console.warn('deleteTarget should be grater than zero.');
        return;
      }

      axios
        .delete(`/api/v1/libraries/${this.deleteTarget}`)
        .then(response => {
          this.deleteTarget = -1;
          this.updateLibraries();
        })
        .catch(error => {
          console.error(error);
          if (error.response.data && error.response.data.errors) {
            this.errors = error.response.data.errors;
          }
        });
    },
    updateLibraries: function() {
      axios
        .get('/api/v1/libraries.json')
        .then(response => (this.libraries = response.data))
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
