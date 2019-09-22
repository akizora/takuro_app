<template>
    <div>
        <div class="container">
            <h2>図書館検索</h2>
            <h3>人気エリアから探す</h3>
            <a v-for="city in cities" :key="city.name" >
                <router-link :to="{ name: 'LibraryIndexPageFromCity', params: { city: city.name } }">{{ city.name }}
                </router-link>
            </a>
            <h3>カテゴリーから探す</h3>
            <a v-for="category in categories" :key="category.libcategory" >
                <router-link :to="{ name: 'LibraryIndexPageFromCategory', params: { category: category.libcategory } }">{{ category.name }}
                </router-link>
            </a>
        </div>
    </div>
</template>

<script>
import axios from 'axios';

export default {
    data: function () {
        return {
            cities: [],
            categories: []
        }
    },
    mounted () {
        this.showPopularCities();
        // this.showLibraries();
        this.showCategories();
    },
    methods: {
        showPopularCities: function(){
            axios
                .get('/api/v1/popularcities.json')
                .then(response => (this.cities = response.data))
        },
        // showLibraries: function() {
        //     axios
        //         .post(`/api/v1/libraries/${this.$route.params.name}.json`)
        //         .then(response => (this.libraries = response.data))
        // },
        showCategories: function() {
            axios
                .get('/api/v1/categories.json')
                .then(response => (this.categories = response.data))
        }
    }
}

</script>

<style scoped>
.container {
  font-size: 80%;
  text-align: center;
  background: whitesmoke;
  /* background: linear-gradient(270deg,#2f80ed,#56ccf2); */
  overflow: hidden;
  width: 100%;
  height: 300px;
}

a {
text-decoration: none;
background: cornflowerblue;
color: azure;
display: inline-block;
border-radius: 5px;
text-align: center;
margin:auto 5px 0;
padding: 1px 2px 1px 2px;
}


</style>
