<template>
    <button @click="inviteUser">
      <slot />
    </button>
</template>

<script>
import axios from 'axios'
import { csrfToken } from 'rails-ujs'
axios.defaults.headers.common['X-CSRF-TOKEN'] = csrfToken()
export default {
  props: ['userId', 'organizationId'],
  data() {
    return {
      belong: {
        user_id: this.userId,
        organization_id: this.organizationId
      }
    }
  },
  methods: {
    inviteUser() {
      axios.post('/api/belongs', { belong: this.belong })
    }
  }
}
</script>
