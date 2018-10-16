import Vue from 'vue/dist/vue.esm';
import Vuex from 'vuex';
import FireBase from 'firebase';

Vue.use(Vuex);

const firebase = FireBase.initializeApp({
    apiKey: String(gon.api_key),
    authDomain: String(gon.auth_domain),
    databaseURL: String(gon.database_url),
    projectId: String(gon.project_id),
    storageBucket: String(gon.storage_bucket),
    messagingSenderId: String(gon.message_senderid)
});

const database = firebase.database();

const store = new Vuex.Store({
    state: {
        firebase: firebase,
        database: database
    }
});

export default store;