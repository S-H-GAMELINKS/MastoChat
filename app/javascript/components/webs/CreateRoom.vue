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
        {{room.title}}
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

console.log(firebase);

export default {
    data: function() {
        return {
            rooms: []
        }
    }    
}
</script>

