<template>
  <div>
      <h1>Docs</h1>
      <h2>What can I ask Howie?</h2>
      <p>AskHowie was designed to provide resources to coding students and professionals, with an emphasis on <a class="routes" href="https://www.techelevator.com/" target="_blank">Tech Elevator</a> students and alumni. The following is a list of keywords that Howie will recognize and respond to:</p>
      <p v-for="keyword in keywords" v-bind:key="keyword">{{keyword}}</p>
  </div>
</template>

<script>
import ahApi from '@/services/AHWebApi.js';

export default {

    beforeMount() {
        ahApi.getKeywords().then(r => {
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
    .routes{
        color: orangered;
        text-decoration: none;
        font-size:16px;
    }
    
</style>