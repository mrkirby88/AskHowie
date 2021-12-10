<template>
<div class="home">
    <h1>Home</h1>
    <p>Welcome to ChatBot, {{user}}!</p>
</div>
</template>

<script>
    export default {
    name: "home",
    data() {
        return {
            user: this.$store.state.user.username
        }
    }
    };
</script>

<style scoped>
h1{
    color:#dcdceb;
}
p{
    color: #dcdceb;
}
</style>