<template>
<div>
    <h1>Create Chat Room Pages</h1>
    <div class="input-group">
        <div class="input-group-append">
            <span class="input-group-text">ルーム名</span>
        </div>
        <input type="text" class="form-control" v-model="title" placeholder="ルーム名を入力してください"> 
    </div>
    <p>
        <button type="button" class="btn btn-primary" v-on:click="createChatRoom">Submit</button>
    </p>
    <div v-for="(room, key, index) in rooms" :key="index">
        <router-link to="/chats/rooms">{{room.title}}</router-link>
    </div>
</div>
</template>

<script>

import FireBase from 'firebase';
const firebase = FireBase.initializeApp({
    apiKey: String(gon.api_key),
    authDomain: String(gon.auth_domain),
    databaseURL: String(gon.database_url),
    projectId: String(gon.project_id),
    storageBucket: String(gon.storage_bucket),
    messagingSenderId: String(gon.message_senderid)
});

const database = firebase.database();

export default {
    data: function() {
        return {
            rooms: [],
            title: "",
        }
    },
    mounted: function() {
        this.getChatRooms();
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
    }
}
</script>

