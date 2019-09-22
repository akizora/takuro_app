<template>
  <div>
    <div>
      <tab-menu></tab-menu>
      <div v-if="errors.length != 0">
        <ul v-for="e in errors" :key="e">
          <li><font color="red">{{ e }}</font></li>
        </ul>
      </div>
    </div>
    <div class="inner">
      <table>
        <tbody>
          <tr>
            <th>name</th>
            <th>address</th>
            <th>category</th>
          </tr>
          <tr v-for="library in libraries" :key="library.city">
            <td><router-link :to="{ name: 'LibraryDetailPage', params: { id: library.id } }">{{ library.formal }}</router-link></td>
            <td>{{ library.address }}</td>
            <td>{{ library.category }}</td>
          </tr>
        </tbody>
      </table>
      <modal v-if="showModal" @cancel="showModal = false" @ok="deleteLibraries(); showModal = false;">
        <div slot="body">Are you sure?</div>
      </modal>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

import TabMenu from 'TabMenu.vue'
import Modal from 'Modal.vue'

export default {
  components: {
    Modal,
    TabMenu
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
      this.showLibraries();
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
    showLibraries: function() {
      if (this.$route.params.city) {
        axios
          .post(`/api/v1/libraries/city/${this.$route.params.city}.json`)
          .then(response => (this.libraries = response.data))
      } else {
        axios
          .post(`/api/v1/libraries/category/${this.$route.params.category}.json`)
          .then(response => (this.libraries = response.data))
      }
    }
  }
}
</script>

<style scoped>
.inner {
  margin: auto;
}

p {
  font-size: 2em;
  text-align: center;
}

table{
  width: 100%;
  border-collapse: collapse;
}

table tr{
  border-bottom: solid 2px white;
}

table tr:last-child{
  border-bottom: none;
}

table th{
  position: relative;
  text-align: left;
  width: 30%;
  background-color: #52c2d0;
  color: white;
  text-align: center;
  padding: 10px 0;
}

table td{
  text-align: left;
  text-align: center;
  background-color: #eee;
  padding: 10px 0;
}
</style>
