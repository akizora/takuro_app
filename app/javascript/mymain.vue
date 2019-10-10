<template>
  <div class="container">
    <div class="libserch_title">LibSearch</div>
    <div class="libserch_sub_title">図書館に、出かけてみよう。</div>
  </div>
</template>

<script>
</script>

<style scoped>
.container {
  height: 500px;
  width: 100%;
  font-size: 80%;
  text-align: center;
  overflow: hidden;
  /* background: linear-gradient(270deg,#cad6ec,#56ccf2); */
  background-image:url("./images/top.jpg");
  background-size: cover;
}

a {
  color: black;
  /* color: azure; */
}
.libserch_title {
  /* color: aliceblue; */
  color: black;
  font-size: 25px;
  letter-spacing: 3px;
  text-shadow:0 0 30px rgba(0,0,0,.2);
  text-align: center;
  margin: 12% 0 0 0%;
}
.libserch_sub_title {
  /* color: aliceblue; */
  color: black;
  font-size: small;
  letter-spacing: 3px;
  text-shadow:0 0 30px rgba(0,0,0,.2);
  text-align: center;
  margin: 2% 0 0 0%;
}
* {
  margin: 0px;
  padding: 0px;
}
</style>