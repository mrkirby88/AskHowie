<template>
    <div id="nav">
        <div>
            <img id="logo-image" :src="require('@/assets/images/chatbot_cropped.png')" alt="chatbot logo">
        </div>
        <div id="links">
            <router-link class="routes" v-bind:to="{ name: 'home' }">Home</router-link>
            <router-link class="routes" v-bind:to="{ name: 'chatbox' }">Chat</router-link>
            <router-link class="routes" v-bind:to="{ name: 'about'}">About</router-link>
            <router-link class="routes" v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
            <router-link class="routes" v-bind:to="{name: 'help'}">Help</router-link>
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {}
    },

    computed: {
    }
}
</script>

<style>

    #logo-image {
        max-height: 120px;
    }

    .routes:hover{
        color: #166ca1;
    }
    .routes{
        color: #0b507a;
    }
</style>