<template>
  <div class="article">
      <h1>Docs</h1>
      <h2>What can I ask ChatBot?</h2>
      <p>ChatBot was designed to provide resources to coding students and professionals, with an emphasis on <a href="https://www.techelevator.com/" target="_blank">Tech Elevator</a> students and alumni. The following is a list of keywords that ChatBot will recognize and respond to:</p>
      <p v-for="keyword in keywords" v-bind:key="keyword">{{keyword}}</p>
  </div>
</template>

<script>
import cbApi from '@/services/CBWebApi.js';

export default {

    beforeMount() {
        cbApi.getKeywords().then(r => {
            this.keywords = r.data;
        });
    },

    data() {
        return {
            keywords: []
        }
    }
}
</script>

<style scoped>
p {
    margin: 0.2rem;
}
</style>