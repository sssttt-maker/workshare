<template>
  <div>
    <div v-if="isJoinning" @click="leaveRoom()">
      退会
    </div>
    <div v-else @click="joinRoom()">
      参加
    </div>
  </div>
</template>

<script>
import axios from 'axios'
import { csrfToken } from 'rails-ujs'
axios.defaults.headers.common['X-CSRF-TOKEN'] = csrfToken()

export default {
  props: ['userId', 'roomId'],
  data() {
    return {
      entryPointList: []
    }
  },
  computed: {
    count() {
      return this.entryPointList.length
    },
    isJoinning() {
      if (this.entryPointList.length === 0) { return false }
      return Boolean(this.findEntryPointId())
    }
  },
  created: function() {
    this.fetchEntryByRoomId().then(result => {
      this.entryPointList = result
    })
  },
  methods: {
    fetchEntryByRoomId: async function() {
      const res = await axios.get(`/api/entry_points/?room_id=${this.roomId}`)
      if (res.status !== 200) { process.exit() }
      return res.data
    },
    joinRoom: async function() {
      const res = await axios.post(`/api/entry_points`, { room_id: this.roomId })
      if (res.status !== 201) { process.exit() }
      this.fetchEntryByRoomId().then(result => {
        this.entryPointList = result
      })
    },
    leaveRoom: async function() {
      const EntryPointId = this.findEntryPointId()
      const res = await axios.delete(`/api/entry_points/${EntryPointId}`)
      if (res.status !== 200) { process.exit() }
      this.entryPointList = this.entryPointList.filter(n => n.id !== EntryPointId)
    },
    findEntryPointId: function() {
      const entryPoint = this.entryPointList.find((entryPoint) => {
        return (entryPoint.user_id === this.userId)
      })
      if (entryPoint) { return entryPoint.id }
    }
  }
}

</script>
