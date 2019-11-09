<template>
  <div>
    <div>
      <ul>
        <li v-for="belonged in belongedUserList" :key="belonged.id">
          {{ belonged.name }}
        </li>
      </ul>
    </div>
    <div>
      <ul>
        <li v-for="user in userList" :key="user.id">
          <label>{{ user.name }}</label>
          <span v-if="false">
            参加しています
          </span>
          <span v-else>
            <button @click="belong.user_id = user.id; targetUserName = user.name; showModal = true">
              <slot />
            </button>
          </span>
        </li>
      </ul>
      <modal v-if="showModal" @cancel="showModal = false" @ok="inviteUser(); showModal = false;">
        <div slot="body">
          {{ targetUserName }}を招待しますか？
        </div>
      </modal>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
import { csrfToken } from 'rails-ujs'
axios.defaults.headers.common['X-CSRF-TOKEN'] = csrfToken()
import Modal from './Modal.vue'


export default {
  components: {
    Modal
  },
  data() {
    return {
      userList: [],
      belongedUserList: [],
      organization: null,
      targetUserName: '',
      belong: {
        user_id: -1,
        organization_id: null
      },
      showModal: false
    }
  },
  mounted() {
    axios
      .get(`/api/belongs`)
      .then(response => {
        this.userList = response.data.users
        this.belongedUserList = response.data.belonged_users
        this.organization = response.data.organization
        this.belong.organization_id = response.data.organization.id
      })
  },
  methods: {
    inviteUser() {
      if (this.belong.user_id <= 0) {
        console.warn('招待するユーザがいません')
        return;
      }

      axios
        .post('/api/belongs', { belong: this.belong })
        .then(response =>{
          this.belong.user_id = -1
        })
    }
  }
}
</script>
