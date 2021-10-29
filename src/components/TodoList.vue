<template>
  <div class="todo-app">
    <div class="todo-header">
      <h1>Todo List</h1>
    </div>
    <hr />

    <div class="create-section">
      <input
        autofocus
        type="text"
        v-model="item"
        v-on:keyup.enter="addItem(item)"
        placeholder="Item here"
      />
      <button class="btn" v-on:click="addItem(item)">Create</button>
    </div>

    <div v-for="tag in items" :key="tag.id" class="show-item">
      <h4 class="item-heading">{{ tag.name }}</h4>
      <button class="btn" v-on:click="delItem(tag)">delete</button>
      <button class="btn" v-on:click="editItem(tag)">edit</button>
      <span id="hello" :class="[tag.show ? 'show_edit': 'hide_edit']">
        <input type="text" v-model="tag.newItem" placeholder="edit here" />
        <button class="btn" v-on:click="doneEdit(tag, tag.newItem)">enter</button>
      </span>
    </div>
  </div>
</template>

<script>
export default {
  name: "todo",
  data() {
    return {
      items: [],
      item: "",
      newItem: ""
    };
  },
  methods: {
    addItem: function(item) {
      var uid = this.items.length;
      if (item != "") {
        this.items.push({ id: uid, name: item, show: false, dontShow: true, newItem: "" });
        this.item = "";
      }
    },
    delItem: function(tag) {
      this.items.splice(this.items.indexOf(tag), 1);
    },
    editItem: function(tag) {
      if (tag.show === false) {
        tag.show = true;
      } else tag.show = false;

      if (tag.dontShow === false) {
        tag.dontShow = true;
      } else tag.dontShow = false;
    },
    doneEdit: function(item, newItem) {
      var x = document.getElementById("hello");
      if (x.style.display === "block") {
        x.style.display = "none";
      }
      this.items.splice(this.items.indexOf(item), 1, {
        id: item.id,
        name: newItem,
        show: false
      });
      this.newItem = "";

    }
  }
};
</script>

<style scoped>
/* global-styles */
textarea,
input {
  outline: none;
  padding: 10px;
  border-color: #a2d6f9;
  font-family: "Courier New", Courier, monospace;
}
input:hover {
  border-color: #1e96fc;
}
.btn {
  display: inline-block;
  padding: 10px;
  border-color: #ffa200;
  border-radius: 20%;
}
.btn:hover {
  background-color: aquamarine;
}

/* local-styles */
.todo-app {
  position: relative;
  min-height: 30rem;
  width: 30rem;
  padding: 40px;
  background-color: #ffa200;
  top: 5%;
  left: 35%;
  border-radius: 2%;
}
.todo-header {
  position: relative;
  /* background-color: whitesmoke; */
  color: #1c1c1c;
  text-align: center;
}
.create-section {
  padding: 20px;
}
.show_edit {
  display: block;
}
.hide_edit {
  display: none;
}
</style>
