<template>
  <header>
    <div class="header_contents">
    東京都の図書館が探せるサイト
    </div>
    <div class="container">
      <ol>
        <li v-for="(item, index) in items" :key=index>
          <router-link v-bind:to="{name: item.name, path: item.path }">
              {{ item.title }}
          </router-link>
        </li>
      </ol>
    </div>
  </header>
</template>

<script>
export default {
  name: 'TabMenu',
  data () {
    return {
      items: [
        { title: 'LibSearch', path: '/' },
        // { title: 'Books', path: '/books' },
        { title: '図書館を探す', path: '/libraries' },
        { name: 'Login', title: 'はじめる', path: '/login' },
        // { name: 'UserNewPage', title: 'Signup', path: '/signup' }
      ]
    }
  }
}
</script>

<style scoped>
.header_contents {
  padding: 3px;
  background: #eae6dc;
}

.container {
  padding-top: 0px;
  display:inline;
  box-shadow: 0 0 10px 0 rgba(0,0,0,.2);
}
ol {
  margin-left: auto;
  display:flex;
  justify-content: center;
  padding-top: 0px;
  list-style: none;
}
li {
  width: 100%;
  height: 50px;
  margin-left:0px;
  margin-right:0px;
  font-size: 14px;
  background-color: antiquewhite;
  border-radius: 0px;
  position: relative;
}
li:hover {
  opacity: 0.4;
  background-color: darkgray;
}
a {
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  color: black;
  text-align: center;
  text-decoration: none;
  line-height: 50px;
}
* {
  margin: 0px;
  padding: 0px;
}
</style>