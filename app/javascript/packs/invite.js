import Vue from 'vue/dist/vue.esm'
import InviteButton from '../components/belongs/InviteButton.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#invite',
    data: {},
    components: { InviteButton }
  })
})
