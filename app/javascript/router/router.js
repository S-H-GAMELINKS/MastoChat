import Vue from 'vue/dist/vue.esm';
import VueRouter from 'vue-router';
import Index from '../components/webs/Index.vue';
import About from '../components/webs/About.vue';
import Contact from '../components/webs/Contact.vue';
import CreateRoom from '../components/webs/CreateRoom.vue';

Vue.use(VueRouter);

export default new VueRouter({
  mode: 'history',
  routes: [
    { path: '/', component: Index },
    { path: '/about', component: About },
    { path: '/contact', component: Contact },
    { path: '/chats', component: CreateRoom },
  ],
})