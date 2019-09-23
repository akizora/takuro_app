<template>
  <div>
    <h1>Sign up</h1>
    <form @submit.prevent="$emit('submit')">
      <div v-if="errors.length != 0">
        <ul v-for="e in errors" :key="e">
          <li><font color="red">{{ e }}</font></li>
        </ul>
      </div>
      <!-- <div class="inner"> -->
      <div>
        <label>name</label>
        <input v-model="user.name" type="text">
      </div>
      <div>
        <label>email</label>
        <input v-model="user.email" type="email">
      </div>
      <div>
        <label>password</label>
        <input v-model="user.password" type="password">
      </div>
      <button type="submit">sign up</button>
    </form>
  </div>
</template>

<script>
export default {
  props: {
    user: {},
    errors: ''
  }
}
</script>

<style scoped>
h1 {
  text-align: center;
}
form {
  width: 500px;
  margin: auto;
  height: 150px;
}
.inner {
  margin: 10%;
}
label {
  border-left: 2px solid blue;
  font-size: 14px;
  font-weight: 600;
  color: darkgray;
  padding-left: 8px;
}
</style>