import Vue from 'vue/dist/vue.esm';

const app = new Vue({
    el: "#app",
    data: function() {
        return {
            text: "Hello Rails and Vue.js!"
        }
    }
})