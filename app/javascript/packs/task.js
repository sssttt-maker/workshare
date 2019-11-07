import Vue from 'vue/dist/vue.esm'
import TaskList from '../components/tasks/TaskList.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#task-list',
    data: {},
    components: { TaskList }
  })
})
