<template>
<div>
  <div v-for="task in tasks" :key="task.id">
    <label>{{ task.name }}</label>
    <p>{{ task.description }}</p>
  </div>
</div>
</template>

<script>
import axios from 'axios'
export default {
  props: [],
  data() {
    return {
      tasks: []
    }
  },
  mounted: function() {
    this.fetchTasks()
  },
  methods: {
    fetchTasks: function() {
      axios.get(`/api/tasks`)
        .then((response) => {
          this.tasks = response.data
        }, (error) => {
          console.log(error)
        })
    }
  }
}
</script>
