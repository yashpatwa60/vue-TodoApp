<template>
  <div id="app">
   <TodoList/>
  </div>
</template>

<script>
import TodoList from './components/TodoList'

export default {
  name: 'App',
  components: {
    TodoList
  }
}
</script>

<style>
body, html {
  height: 100%;
}
*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}
  #app {
    display: relative;
    background-image: url("./assets/bg.jpg");
    height: 100%;
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
  }


</style>
