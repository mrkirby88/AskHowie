<template>
    <div class="main">
      <navigation />
        <div class="articles">
            <h1> About Chatbot!</h1>
                <p>Welcome to Chatbot, the revolutionary way to fetch information from the internet! Who needs google when you have Chatbot at your disposal? …</p>

            <h2> Meet the Team Behind Chatbot:</h2> 
                <p>Kenton Bandy</p>
                    <li>This will be altered but this is a little bit about me.</li>
                    <li>This will be altered but this is a little bit about me.</li>
                    <li>This will be altered but this is a little bit about me.</li>
                <p>Christopher Nicoletti</p>
                    <li>This will be altered but this is a little bit about me.</li>
                    <li>This will be altered but this is a little bit about me.</li>
                    <li>This will be altered but this is a little bit about me.</li>
                <p>Nathan O'Donnell</p>
                    <li>This will be altered but this is a little bit about me.</li>
                    <li>This will be altered but this is a little bit about me.</li>
                    <li>This will be altered but this is a little bit about me.</li>
                <p>Roman Oliver</p>
                    <li>This will be altered but this is a little bit about me.</li>
                    <li>This will be altered but this is a little bit about me.</li>
                    <li>This will be altered but this is a little bit about me.</li>
                <p>Matthew Kirby</p>
                    <li>This will be altered but this is a little bit about me.</li>
                    <li>This will be altered but this is a little bit about me.</li>
                    <li>This will be altered but this is a little bit about me.</li>
        </div>
        <body>
        </body>
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
        text-decoration: underline;
        color: #ffffff;
        padding: 5px;
    }
    h2{
        color: #ffffff;
        text-decoration: underline;
        padding: 5px;
    }
    p{
        color: #e6ecfd;
        padding: 5px;
    }
    .articles{
        display: flex;
        flex-direction: column;
        align-items: left;
        background-color: #0b507a;
        height: 200vh;
    }
    li{
        margin: 2px;
        color: #d9f3ef;
    }


</style>