<template>
  <div>
    <navigation />
    <h2>ChatBox Page</h2>
    <chat-box />
  </div>
</template>

<script>
import ChatBox from '../components/ChatBox.vue'
import Navigation from '../components/Navigation.vue'
export default {
  components: { Navigation, ChatBox },

}
</script>

<style>

</style>