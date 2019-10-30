import Vue from 'vue/dist/vue.esm'
import UserChat from '../components/user-chat.vue'
import ActionCable from 'actioncable';

const cable = ActionCable.createConsumer('ws:localhost:3000/cable');
Vue.prototype.$cable = cable;

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#main-container',
    data: {},
    components: { UserChat }
  })
})
