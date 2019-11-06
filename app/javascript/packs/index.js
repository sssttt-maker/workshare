import Vue from 'vue'

// 作成したコンポーネントファイルをimportします
import RoomButton from '../components/rooms/RoomButton.vue'

document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    el: '#room',
    components: { RoomButton }
  })
})
