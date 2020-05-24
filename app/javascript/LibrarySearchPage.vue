<template>
  <div class="container">
    <div>
      <tab-menu></tab-menu>
    </div>
    <div class="inner">
      <div class="search_page_title">図書館検索</div>
      <h3>キーワードから探す</h3>
      <div class="search_card_keyword">
        <div class="form_main">
          <input 
            v-model="text"
            type="text"
            class="input"
            placeholder="キーワードで検索"
            @keyup.enter="$emit('submit', text)"
          >
          <button 
            class="button" 
            @click="$emit('submit', text)"
          />
        </div>
      </div>
      <div class="search_card_area">
        <h3>図書館のエリアから探す</h3>
        <ul>
          <li v-for="city in cities" :key="city.name" >
            <a>
              <router-link :to="{ name: 'LibraryIndexPageFromCity', params: { city: city.name } }">{{ city.name }}
              </router-link>
            </a>
          </li>
        </ul>
      </div>
      <div class="search_card_category">
        <h3>図書館の種類から探す</h3>
        <ul>
          <li v-for="category in categories" :key="category.libcategory" >
            <a>
              <router-link :to="{ name: 'LibraryIndexPageFromCategory', params: { category: category.libcategory } }">{{ category.name }}
              </router-link>
            </a>
          </li>
        </ul>
      </div>
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
      cities: [],
      categories: [],
      text: ''
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

<style lang="scss" scoped>
.inner {
  margin: auto;
  width: 70%
}
.search_page_title {
  margin-top: 25px;
}

h3 {
  margin-top: 4px;
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

.search_card_keyword {
  display: block;
  height: 100px;
  .form_main{
    .input {
      height: 20px;
      width: 230px;
      flex: 1;
      border: 1px solid #dbdbdb;
    }
    .button {
      width: 48px;
      background-color: grey;
      // background-image: url('~assets/images/search.png');
      background-size: 18px 18px;
      background-position: center center;
      // border-radius: 0 8px 8px 0;
      // color: $white;
      cursor: pointer;
    }
  }
}

.search_card_area {
  /* height: 300px; */
  clear: both;
  ul {
    display: block;
    list-style-type: disc;
    width: 100%;
    list-style: none;
    // margin-block-start: 1em;
    // margin-block-end: 1em;
    // margin-inline-start: 0px;
    // margin-inline-end: 0px;
    // padding-inline-start: 40px;
    :hover {
      background-color:#dbdbdb;
    }
  }  
  li {
    width: 130px;
    float: left;
    // margin-top: 13px;
    margin-top: 0px;
    height: 35px;
    cursor: pointer;
    text-align: center;
  }
  a {
    cursor: pointer;
    text-decoration: none;
    color: #3d3935;
  }
}

.search_card_category {
  clear: both;
  ul {
    display: block;
    list-style-type: disc;
    width: 100%;
    list-style: none;
  }
  li {
    width: 130px;
    float: left;
    margin-top: 13px;
  }
  a {
    cursor: pointer;
    text-decoration: none;
    color: #3d3935;
  }
}


</style>
