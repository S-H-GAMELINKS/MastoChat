import Vue from 'vue/dist/vue.esm';
import Router from '../router/router';
import Header from '../components/layouts/Header.vue';
import Store from '../store/store';

const app = new Vue({
    el: "#app",
    router: Router,
    store: Store,
    components: {
        'nav-bar': Header
    },
    data: function() {
        return {
            text: "Hello Rails and Vue.js!"
        }
    }
})

console.log(app.$route);