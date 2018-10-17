<template>
<div>
    <h1>All Chat Room</h1>
    <div class="input-group" v-if="user_login">
        <div class="input-group-append">
            <span class="input-group-text">ルーム名</span>
        </div>
        <input type="text" class="form-control" v-model="title" placeholder="ルーム名を入力してください"> 
    </div>
    <p v-if="user_login">
        <button type="button" class="btn btn-primary" v-on:click="createChatRoom">Submit</button>
    </p>
    <div v-for="(room, key, index) in rooms" :key="index">
        <router-link :to="{name: 'chatroom', params: {id: room.id}}">{{room.title}}</router-link>
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
            rooms: [],
            title: "",
            user_login: false
        }
    },
    mounted: function() {
        this.getChatRooms();
        this.userLogin();
    },
    methods: {
        getChatRooms: function() {
            const data = database.ref('mastochat');
            data.on("value", (snapshot) => {
                const mastochat = Object.entries(snapshot.val());
                
                this.rooms.length = 0;
                for(var i = 0; i < mastochat.length; i++) {
                    this.rooms.push({id: mastochat[i][0], title: mastochat[i][1].title});
                }
                console.log(this.rooms);
            }, (errorObject) => {
                console.log("The read failed: " + errorObject.code);
            })
        },
        createChatRoom: function() {
            this.rooms.length = 0;
            database.ref('mastochat').push({
                title: this.title,
            });
            this.title = "";
        },
        userLogin: function() {
            axios.get('/api/chat/login').then((response) => {
                console.log(response);
                if(response.data === null) {
                    this.user_login = false;
                } else {
                    this.user_login = true;
                }
                console.log(this.user_login);
            }, (error) => {
                console.log(error);
            })
        }
    }
}
</script>

