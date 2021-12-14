<template>
<div class="article">
    <h1 class="homeTextColor">Home</h1>
    <p class="homeTextColor">Welcome to ChatBot, {{user}}!</p>
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

.homeTextColor{
    color: #dcdceb;
}

</style>