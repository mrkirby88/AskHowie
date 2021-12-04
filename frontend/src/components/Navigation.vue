<template>
    <div id="nav">
        <router-link v-bind:to="{ name: 'home' }">Home</router-link>
        <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
    </div>
</template>

<script>
export default {}
</script>

<style>

    #nav {
        width: 100%;
        background-color: rgb(255, 255, 255);
        display: flex;
        flex-direction: row;
        width: 100%;
        justify-content: space-around;
        padding: 20px;
    }

</style>