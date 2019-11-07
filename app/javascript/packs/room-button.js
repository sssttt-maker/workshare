import Vue from 'vue/dist/vue.esm'

// 作成したコンポーネントファイルをimportします
import RoomButton from '../components/rooms/RoomButton.vue'

document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    el: '#room-button',
    data: {},
    components: { RoomButton }
  })
})
