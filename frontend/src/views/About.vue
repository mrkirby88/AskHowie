<template>
    <div class="main">
      <navigation />
      <div class="article-container">
         <div class="article">
            <h1> About Chatbot</h1>
                <p>Welcome to Chatbot, the revolutionary way to fetch information from the internet! Who needs google when you have Chatbot at your disposal?
                    Chatbot is an interactive way that can assist you in elevating your skills by giving you information to ensure you will be at your best for landing 
                    a job in your new career! Whether you need to brush up on loops, advice on making a resume that would even bring a tear to Ellen or Stephen's eye, or just a much needed joke to get you through the day; Chatbot has your back! 
                </p>

            <h2 class="title"> Meet the Team Behind Chatbot:</h2> 
                <img class="image" src="../assets/images/KentonBandyPicture.jpg" />
                <h3 class="names">Kenton Bandy</h3>
                    <li>I am a Master Jedi of Code. That is all you need to know.</li>
                    <li>I taught Yoda how to use recursion.</li>
                    <li>This will be altered but this is a little bit about me.</li>
                <h3 class="names">Christopher Nicoletti</h3>
                    <li>This will be altered but this is a little bit about me.</li>
                    <li>This will be altered but this is a little bit about me.</li>
                    <li>This will be altered but this is a little bit about me.</li>
                <img class="image" src="../assets/images/NateODonnellPicture.png" />
                <h3 class="names">Nathan O'Donnell</h3>
                    <li>I enjoy gaming, collecting various hot sauces, and music trivia.</li>
                    <li>"If you're not first, you're last." -Ricky Bobby</li>
                <img class="image" src="../assets/images/RomanOliverPicture.jpeg"/>
                <h3 class="names">Roman Oliver</h3>
                    <li>My interests include Virtual Reality and 3D Printing.</li>
                    <li>I also enjoy playing ice hockey and building models.</li>
                    <li>"Society grows great when old men plant trees whose shade they know they shall never sit in." - Anonymous Greek Proverb</li>
                <img class="image" src="../assets/images/MattKirbyPicture.jpg"/>    
                <h3 class="names">Matthew Kirby</h3>
                    <li>One of my favorite hobbies is I love to use my smoker for different meats! It is quite the tasty challenge!</li>
                    <li>I graduated from West Virginia University and bleed gold and blue! Go Mountaineers!!.</li>
                    <li>"Your life does not get better by chance, it gets better by change." - Jim Rohn.</li>
        </div> 
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

<style scoped>
    .header{
        align-items: center;
        text-decoration: underline;
        color: #ffffff;
        padding: 5px;
        font-size: 80px;
              
    }
    .title{
        color: #ffffff;
        text-decoration: underline;
        padding: 5px;
        font-size: 40px;
        margin-top: 80px;
    }
    .names{
        color: #f7f7f7;;
        padding: 5px;
        margin: 5px 40px;
    }
    li, .paragraph {
        margin: 2px;
        color: #dfdfdf;
    }
    li {
          font-style: italic;
    }
    .image{
        width: 25%;
        margin: 5px;
        margin-top: 50px;
        border-radius: 20%;
        padding: 10px;   
    }
    .main{
        background-color: rgb(26, 28, 30);
    }

    
</style>