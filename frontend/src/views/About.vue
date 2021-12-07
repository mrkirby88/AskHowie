<template>
    <div>
      <navigation />
        <h1> About Chatbot!</h1>
            <p>Welcome to Chatbot, the revolutionary way to fetch information from the internet! Who needs google when you have Chatbot at your disposal? …</p>

        <h2> Meet the Team Behind Chatbot:</h2> 
            <p>Kenton Bandy</p>
            <p>Christopher Nicoletti</p>
            <p>Nathan O'Donnell</p>
            <p>Roman Oliver</p>
            <p>Matthew Kirby</p>
    </div>
</template>

<script>
import navigation from '../components/Navigation.vue';

export default {
    components: {navigation },
}
</script>

<style>
    h1{
    align-items: center;
    }
</style>