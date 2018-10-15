import Vue from 'vue/dist/vue.esm';
import Header from '../components/layouts/Header.vue';

const app = new Vue({
    el: "#app",
    components: {
        'nav-bar': Header
    },
    data: function() {
        return {
            text: "Hello Rails and Vue.js!"
        }
    }
})