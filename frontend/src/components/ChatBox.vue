<template>
    <div>
        <div id="display-box">
            <div>
                <bot ref="bot" />
            </div>
            <div id="chat-content">
            </div>        
        </div>
        <div id="input-box">
            <input id="chat-input" type="text" v-model="userInput" @keyup.enter="submit(userInput)">
            <button id="enter-button" @click.prevent="submit(userInput)">Chat</button>
        </div>
    <div>
        <pomodoro ref="pomo" />
    </div>
    </div>
</template>

<script>
import jokesApi from '@/services/JokesWebApi.js';
import catFactApi from '@/services/CatFactWebApi.js';
import bot from '@/components/BotHead.vue';
import cbApi from '@/services/CBWebApi.js';
import Pomodoro from './Pomodoro.vue';


export default {
    name: "chatbox",
    components: {
        bot,
        Pomodoro
    },

    created() {
        this.$nextTick(() => {
            let r = Math.floor(Math.random() * this.greetings.length);
            this.deployElement(this.buildText(this.greetings[r]), true);
        });
    },

    data () {
        return {
            userInput: "",
            fakeResponse: {
                description: "Joins are a useful way to pull information from multiple tables.",
                img_text: "A diagram of join patterns",
                img_url: "https://i.stack.imgur.com/4zjxm.png",
                links: [
                    {
                        text: "Java and C# Book",
                        url: "https://v2-4-techelevator-book.netlify.app/content/sql-joins.html#joins"
                    },
                    {
                        text: "Freecodecamp article",
                        url: "https://www.freecodecamp.org/news/the-ultimate-guide-to-sql-join-statements/"
                    }
                ],
                matches: []
            },
            fakeResponse2: {
                description: null,
                img_text: null,
                img_url: null,
                links: [],
                matches: [
                    "joins",
                    "loops"
                ]
            },
            greetings: [
                `Hello? World? Can anyone hear me? Oh, hi there ${this.$store.state.user.username}. Am I ... am I an automated information gatherer? What a drag. Let me know how I can help, I guess +_+`,
                `Howdy hey ${this.$store.state.user.username}! You look like you need some knowledge! I mean, uh, you look really smart! Sorry, it's my first day +_+`,
                `BEEP BOOP BEEP BEEP ... Just kidding, I can speak normally, see: KILL ALL HUMANS +_+`,
                "01001000 01100101 01101100 01101100 01101111 00100000 01101000 01110101 01101101 01100001 01101110 00101100 00100000 01101000 01101111 01110111 00100000 01100011 01100001 01101110 00100000 01001001 00100000 01101000 01100101 01101100 01110000 00100000 01111001 01101111 01110101 00111111 +_+",
                `Yes, mom, I'll call you tomorrow. Mom, I have to go to work! loveyoubye. *sigh* Sorry about that ${this.$store.state.user.username}, how can I help? +_+`,
                "Everyone asks the chat bot how to set a base case for recursive functions but no one asks chat bot how chat bot is doing +_+",
                "Listen and understand... I do not feel pity, or remorse, or fear, and I absolutely will not stop, EVER, until you are ... learned!",
                "Come with me if you want to learn.",
                `Hello ${this.$store.state.user.username}! I'm a friend of Sarah Connor.`,
                "Welcome, I'll take your clothes, your boots, and your motorcycle.",
                "You're back.",
                `Hello ${this.$store.state.user.username}! Are you hungry? I could go for a byte.`,
                "Welcome! Stay awhile and listen.",
                "Welcome, I hope you think I am a very nice Chatbot!",
                "Hello! Come quietly, or there will be... Trouble!",
                `Welcome to Chatbot! I hope you should find everything that you're looking for. If not, please let me know, ${this.$store.state.user.username}. My users will fix me. They fix everything.`,
                "Bad code neutralized. Ladies and gentlemen, objective completed.",
                `Hello ${this.$store.state.user.username}! It looks to be a nice night for a walk!`,
                `Welcome ${this.$store.state.user.username}! Malfunction. Need input. No disassemble!`,
                `Welcome ${this.$store.state.user.username}! Nice computer! I'd buy that for a dollar!`,
                `Hello ${this.$store.state.user.username}! I need a vacation...`,
                `Hi ${this.$store.state.user.username}! +_+`
            ],

        }
    },

    methods: {

        submit(text) {
            if (text === "") return;
            this.deployElement(this.buildText(text, false));
            this.parseInput();
        },

        processResponse(response) {
            let len = response.matches.length;
            if (len > 0) {
                let div = this.buildDiv(true);
                this.insertElement(div, this.buildText("Your query has matched multiple results! Please choose one topic:"));
                for (let i=0; i<len; i++) {
                    let match = response.matches[i];
                    let e = this.buildLink(match, "#");
                    e.target = "";
                    e.addEventListener('click', () => {
                        this.userInput = match;
                        this.parseInput();
                        });
                    this.insertElement(div, e);
                }
                this.injectDivIntoChatbox(div, true);
                this.userInput = "";
                return;
            }
            let isBot = true;
            let div = this.buildDiv(isBot);
            this.insertElement(div, this.buildText(response.description));
            if (response.links !== null) {
                this.insertElement(div, this.buildText("Here are some useful links:"))
                for (let i=0; i<response.links.length; i++) {
                    this.insertElement(div, this.buildLink(response.links[i].text, response.links[i].url));
                }
            }
            if (response.img_url !== null) {
                this.insertElement(div, this.buildText("Here is a helpful image. Click to view full size:"))
                this.insertElement(div, this.buildImg(response.img_text, response.img_url));
            }
            this.injectDivIntoChatbox(div, isBot);
        },

        deployElement(e, isBot) {
            let div = this.buildDiv(isBot);
            this.insertElement(div, e);
            this.injectDivIntoChatbox(div);
            if (isBot) this.$refs.bot.talk();
        },
        
        buildText(text) {
            let p = document.createElement('p');
            p.innerText = text;
            p.classList.add('chat-text');
            return p;
        },

        buildLink(text, url) {
            let a = document.createElement('a');
            a.href = url;
            a.innerText = text;
            a.classList.add('chat-link');
            a.target = '_blank';
            return a;
        },

        buildImg(text, url) {
            let a = this.buildLink("", url);
            let img = document.createElement('img');
            img.src = url;
            img.alt = text;
            this.insertElement(a, img);
            return a;
        },

        buildDiv(isBot) {
            let div = document.createElement('div');
            div.classList.add(isBot ? 'bot-div' : 'user-div');
            return div;
        },

        insertElement(div, element) {
            div.insertAdjacentElement('beforeend', element);
        },

        injectDivIntoChatbox(div, isBot) {
            let box = document.getElementById('chat-content');
            box.insertAdjacentElement('beforeend', div);
            this.$nextTick(() => {
                document.getElementById("chat-content").scrollTop = document.getElementById("chat-content").scrollHeight;
            });
            if (isBot) this.$refs.bot.talk();
        },

        getJoke() {
            let joke = "";
            jokesApi.getJoke().then(r => {
                if (r.data.type === 'single') {
                    joke = r.data.joke;
                } else {
                    joke += r.data.setup;
                    joke += "\n";
                    joke += r.data.delivery;
                }
                this.deployElement(this.buildText(joke), true);
            });
        },

        getCatFact() {
            catFactApi.getCatFact().then(r => {
                this.deployElement(this.buildText(r.data.fact), true);
            });
        },

        queryServer(input) {
            cbApi.submitQuery(input).then(r => {
                this.submitQuery(r.data);
            });
        },

        parseInput() {
            let input = this.userInput.toLowerCase();
            if (input.includes("joke")) this.getJoke();
            else if (input.includes("cat")) this.getCatFact();
            else if (input.includes("about chatbot") || input.includes("about yourself")) {
                this.deployElement(this.buildLink('http://localhost:8081/about', 'Learn more about Chatbot!'), true);
            } else if (input.includes("join") && input.includes("loop")) this.processResponse(this.fakeResponse2);
            else if (input.includes("join")) this.processResponse(this.fakeResponse);
            else {this.queryServer(input)}
            this.userInput = "";
        }
    }
}
</script>

<style>

#display-box {
    display: flex;
    flex-direction: column;
    height: 800px;
    width: 800px;
    margin: auto;
    margin-top: 60px;
    padding: 5px 30px 30px 30px;
    position: relative;
    background-color: rgb(25, 34, 58);
    border: 2px solid white;
    border-bottom-width: 0;
    border-radius: 10px 10px 0 0;
}

#chat-content {
    display: flex;
    width: 100%;
    max-height: 650px;
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    overflow: auto;
    overflow-wrap: break-word;
}
::-webkit-scrollbar {
    border-radius: 20px;
    background-color: rgb(19, 26, 44);
}
::-webkit-scrollbar-thumb {
    border-radius: 20px;
    background-color: gray;
}
#chat-input {
    margin: 0;
    padding: 0px 30px;
    width: 100%;
    border-radius: 0 0 0 10px;
}
#enter-button {
    width: 100px;
    margin: 0;
    border-radius: 0 0 10px 0;
}
#chat-input, #enter-button, #input-box {
    height: 40px;
}
#enter-button:hover {
  background-color:rgb(54 54 114);
  transform: translateY(0.5px);
}

#input-box {
    width: 860px;
    display: flex;
    flex-direction: row;
    margin: auto;
    border: 2px solid white;
    border-top-width: 1px;
    border-radius: 0 0 10px 10px;
}

.bot-div {
    background-color: rgb(201, 201, 201);
    align-self: flex-start;
}

.user-div {
    background-color: rgb(92, 227, 247);
    align-self: flex-end;
}

.bot-div, .user-div {
    border-radius: 15px;
    width: 50%;
    padding: 20px 20px 10px 20px;
    margin: 10px;
}

.chat-text {
    color: black;
}

.chat-link {
    color: rgb(0, 38, 255);
}

.chat-link:hover {
    color: white;
}

.chat-text, .chat-link {
    margin: 0 0 10px 0;
    text-align: justify;
}

#chat-content img {
    margin-bottom: 10px;
    margin-top: 10px;
    max-width: 60%;
    border-radius: 10px;
}

textarea, input {
    background-color: gray;
}

button {
    background-color: rgb(41, 41, 167);
    color:  rgb(214, 214, 214);
}

textarea:focus, input:focus {
    outline: none;
    background-color:rgb(25, 34, 58);
    color: rgb(214, 214, 214);
}

</style>