<template>
<div>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">MastoChat</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <router-link to="/" class="nav-link">Home</router-link>
      </li>
      <li class="nav-item">
        <router-link to="/about" class="nav-link">About</router-link>
      </li>
      <li class="nav-item">
        <router-link to="/contact" class="nav-link">Contact</router-link>
      </li>
      <li class="nav-item">
        <router-link to="/chats" class="nav-link">Create Room</router-link>
      </li>
      <li class="nav-item">
        <a href="/users/sign_out" data-method="delete" class="nav-link" v-if="user_login">Log Out</a>
        <a href="/users/auth/mastodon" class="nav-link" v-else>Log In</a>
      </li>
    </ul>
  </div>
</nav>
</div>
</template>

<script>
import axios from 'axios';

export default {
  data: function() {
    return {
      user_login: false
    }
  },
  mounted: function() {
    this.userLogin();
  },
  methods: {
    userLogin: function() {
      axios.get('/api/chat/login').then((response) => {
        console.log(response);
        this.user_login = true;
        console.log(this.user_login);
      }, (error) => {
        console.log(error);
      })
    }
  }
}
</script>
>