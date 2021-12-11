<template>
    <div id="nav">
        <div id="image">
            <img :src="require('@/assets/images/chatbot_cropped.png')" alt="chatbot logo">
        </div>
        <div id="links">
            <router-link class="routes" v-bind:to="{ name: 'home' }">Home</router-link>
            <router-link class="routes" v-bind:to="{ name: 'chatbox' }">Chat</router-link>
            <router-link class="routes" v-bind:to="{ name: 'about'}">About</router-link>
            <router-link class="routes" v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
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

<style scoped>

    #nav {
        background-color: rgba(251,251,251,255);
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        align-items: center;
    }

    img {
        max-height: 120px;
        align-self: center;
    }

    #links {
        display: flex;
        width: 25%;
        flex-direction: row;
        justify-content: space-around;
        margin-right: 100px;
        font-size: 1.3rem;
    }
    .routes:hover{
        color: rgb(158, 76, 158);
    }

</style>