<template>
<div>
    <h1>Create Chat Room Pages</h1>
    <div class="input-group">
        <div class="input-group-append">
            <span class="input-group-text">トークを入力</span>
        </div>
        <input type="text" class="form-control" v-model="content"> 
    </div>
    <p>
        <button type="button" class="btn btn-primary" v-on:click="createTalk">Submit</button>
    </p>
    <div v-for="(talk, key, index) in talks" :key="index">
        <p> {{talk.content}} </p>
    </div>
</div>
</template>

<script>

import store from '../../store/store';

const database = store.state.database;

export default {
    data: function() {
        return {
            talks: [],
            content: "",
        }
    },
    mounted: function() {
        console.log(String(this.$route.path).replace(/\/chats\/room\//, ''));
        this.getTalks();
    },
    methods: {
        getTalks: function() {
            const data = database.ref('mastochat' + String(this.$route.path).replace(/\/chats\/rooms/, ''));
            data.on("value", (snapshot) => {
                const mastochat = Object.entries(snapshot.val());
                console.log(mastochat);
                this.talks.length = 0;
                for(var i = 0; i < mastochat.length; i++) {
                    this.talks.push({id: mastochat[i][0], content: mastochat[i][1].content});
                }
                console.log(this.talks);
            }, (errorObject) => {
                console.log("The read failed: " + errorObject.code);
            })
        },
        createTalk: function() {
            this.talks.length = 0;
            database.ref('mastochat' + String(this.$route.path).replace(/\/chats\/rooms/, '')).push({
                content: this.content,
            });
            this.content = "";
        },
    }
}
</script>

