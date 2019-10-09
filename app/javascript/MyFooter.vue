<template>
  <footer class="common-footer">
    <ul class="common-footer__nav">
      <li><a>LibSearchとは</a></li>
      <li><a>お問い合わせ</a></li>
      <li><a>利用規約</a></li>
      <li><a>プライバシーポリシー</a></li>
    </ul>
    <small class="common-footer__copy">Copyright (c) LibSearch All Rights Reserved.</small>
  </footer>
</template>

<script>
export default {
  components: {}
}
</script>

<style scoped>
.common-footer {
  width: 100%;
  height: 65px;
  border-bottom: 1px solid;
  display: flex;
  flex-direction: column;
  align-items: center;
  margin: 10px 5px 5px 5px;
}

ol {
  width: 100%;
}
ul {
  display: inline-flex;
  list-style: none;
}
li {
  position: relative;
  width: 150px;
}


</style>
