<template>
<div>
    <h1>Create Chat Room Pages</h1>
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

