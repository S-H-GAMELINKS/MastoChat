<template>
<div>
    <h1>Chat Room Pages</h1>
    <div class="input-group" v-if="user_login">
        <div class="input-group-append">
            <span class="input-group-text">トークを入力</span>
        </div>
        <input type="text" class="form-control" v-model="content"> 
    </div>
    <p v-if="user_login">
        <button type="button" class="btn btn-primary" v-on:click="createTalk">Submit</button>
    </p>
    <div v-for="(talk, key, index) in talks" :key="index">
        <p v-if="talk.flag"> <img :src="talk.icon" width="40" height="40" />{{talk.name}} {{talk.content}} </p>
    </div>
</div>
</template>

<script>
import axios from 'axios';
import store from '../../store/store';

const database = store.state.database;

export default {
    data: function() {
        return {
            talks: [],
            content: "",
            user_login: false,
            userName: "",
            userIcon: "",
        }
    },
    mounted: function() {
        console.log(String(this.$route.path).replace(/\/chats\/room\//, ''));
        this.getTalks();
        this.userLogin();
    },
    methods: {
        getTalks: function() {
            const data = database.ref('mastochat' + String(this.$route.path).replace(/\/chats\/rooms/, ''));
            data.on("value", (snapshot) => {
                const mastochat = Object.entries(snapshot.val());
                console.log(mastochat);
                this.talks.length = 0;
                for(var i = 0; i < mastochat.length; i++) {
                    this.talks.push({id: mastochat[i][0], icon: mastochat[i][1].icon,
                                     name: mastochat[i][1].name, content: mastochat[i][1].content, flag: mastochat[i][1].icon !== undefined});
                }
                this.talks.reverse();
                console.log(this.talks);
            }, (errorObject) => {
                console.log("The read failed: " + errorObject.code);
            })
        },
        createTalk: function() {
            this.talks.length = 0;
            database.ref('mastochat' + String(this.$route.path).replace(/\/chats\/rooms/, '')).push({
                icon: this.userIcon,
                name: this.userName,
                content: this.content,
            });
            this.content = "";
        },
        userLogin: function() {
            axios.get('/api/chat/login').then((response) => {
                console.log(response);
                if(response.data === null) {
                    this.user_login = false;
                } else {
                    this.user_login = true;
                    this.userName = response.data.uid;
                    this.userIcon = response.data.icon;
                }
                console.log(this.user_login);
            }, (error) => {
                console.log(error);
            })
        }
    }
}
</script>

