<template>
  <div>
    <div>
      <div v-for="item in messages" :key="item.message.id">
        <div>
          <div>{{ userEmail }}:{{ item.message.content }}</div>
        </div>
      </div>
    </div>
    <div>
      <div>
        <input type="text" v-model="message" placeholder="入力してください" >
        <span>
          <button type="button" v-if="userMessageChannel" @click="speak">Send</button>
        </span>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      message: "",
      messages: [],
      userMessageChannel: null,
    };
  },
  props: ['userId', 'roomId', 'userEmail'],
  created() {
    this.userMessageChannel = this.$cable.subscriptions.create( "UserMessageChannel", {
      received: (data) => {
        this.messages.push(data)
        this.message = ''
      },
    })
  },
  methods: {
    speak() {
      this.userMessageChannel.perform('speak', {
        message: this.message,
        user_id: this.userId,
        room_id: this.roomId
      });
    },

    messageClass (user_id) {
      return {
        "right": user_id === Number(this.userId)
      }
    },
    dataClass (user_id) {
      return {
        "float-right": user_id === Number(this.userId)
      }
    }
  }
}
</script>
