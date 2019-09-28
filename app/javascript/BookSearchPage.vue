<template>
  <div class="container">
    <div>
      <tab-menu></tab-menu>
    </div>
    <div class="inner">
      <h1>Rental Book Search</h1>
      <h3>蔵書検索</h3>
      <div>
        <h3>キーワードで探す</h3>
        <a v-for="city in cities" :key="city.name" >
        </a>
        <h3>カテゴリーから探す</h3>
        <a v-for="category in categories" :key="category.libcategory" >
        </a>
      </div>
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
      cities: [],
      categories: []

      // libraries: [],
      // showModal: false,
      // deleteTarget: -1,
      // errors: ''
      }
    },
    mounted () {
      this.showCities();
      this.showCategories();
    },
  methods: {
    showCities: function(){
      axios
          .get('/api/v1/cities.json')
          .then(response => (this.cities = response.data))
    },
    showCategories: function() {
      axios
          .get('/api/v1/categories.json')
          .then(response => (this.categories = response.data))
    }
  }
}
</script>

<style scoped>
.inner {
  margin: auto;
}

h1 {
  text-align: center;
}
h3 {
  text-align: center;
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
