<template>
  <div>
    <div v-for="item in messages" :key="item.message.id">
      <div>
        <div>{{ userEmail }}:{{ item.message.content }}</div>
        <img :src="item.image" alt="" />
      </div>
    </div>
    <div>
      <input type="text" v-model="message" placeholder="入力してください" >
      <span>
        <button type="button" v-if="userMessageChannel" @click="speak">Send</button>
      </span>
    </div>
    <input type="file" @change="onFileChange" v-if="fileSwitch" />
    <img
      v-show="uploadedImage"
      :src="uploadedImage"
      alt=""
    />
  </div>
</template>

<script>
export default {
  data() {
    return {
      message: "",
      messages: [],
      uploadedImage: '',
      imgName: '',
      userMessageChannel: null,
      fileSwitch: true,
      tmpImage: ''
    };
  },
  props: ['userId', 'roomId', 'userEmail'],
  created() {
    this.userMessageChannel = this.$cable.subscriptions.create( "UserMessageChannel", {
      received: (data) => {
        data['image'] = this.tmpImage
        this.messages.push(data)
        this.message = ''
        this.tmpImage = ''
      },
    })
  },
  computed: {
    sendData() {
      var send = {
        user_id: this.userId,
        room_id: this.roomId
      }
      if (this.message && this.uploadedImage) {
        send['message'] = this.message
        send['image'] = this.uploadedImage
        return send
      } else if (this.message) {
        send['message'] = this.message
        return send
      } else if (this.uploadedImage) {
        send['image'] = this.uploadedImage
        return send
      }
      send = null
    }
  },
  methods: {
    speak() {
      this.userMessageChannel.perform('speak', this.sendData);
      this.reset();
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
    },
    onFileChange(e) {
      const files = e.target.files || e.dataTransfer.files
      this.createImage(files[0])
      this.imgName = files[0].name
    },
    createImage(file) {
      const reader = new FileReader()
      reader.onload = e => {
        this.uploadedImage = e.target.result
      }
      reader.readAsDataURL(file)
    },
    reset() {
      this.tmpImage = this.uploadedImage
      this.uploadedImage = false
      this.fileSwitch = false
      this.$nextTick(function () {
        this.fileSwitch = true
      })
    }
  }
}
</script>
