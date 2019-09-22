<template>
    <div>
        <div class="container">
            <h2>図書館検索</h2>
            <h3>人気エリアから探す</h3>
            <a v-for="city in cities" :key="city.name" >
                <router-link :to="{ name: 'LibraryIndexPage', params: { name: city.name } }">{{ city.name }}
                </router-link>
            </a>
            <!-- <h3>カテゴリーから探す</h3>
            <a>専門</a>
            <a>大学</a>
            <a>図書館</a> -->
        </div>
    </div>
</template>

<script>
import axios from 'axios';

export default {
    data: function () {
        return {
            cities: []
        }
    },
    mounted () {
        this.showPopularCities();
        this.showLibraries();
    },
    methods: {
        showPopularCities: function(){
            axios
                .get('/api/v1/popularcities.json')
                .then(response => (this.cities = response.data))
        },
        showLibraries: function() {
            axios
            .post(`/api/v1/libraries/${this.$route.params.name}.json`)
            .then(response => (this.libraries = response.data))
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
}

</style>
