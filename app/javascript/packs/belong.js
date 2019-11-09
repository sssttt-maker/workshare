import Vue from 'vue/dist/vue.esm'
import BelongPage from '../components/belongs/BelongPage.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#belong',
    data: {},
    components: { BelongPage }
  })
})
