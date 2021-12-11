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
            <input id="chat-input" type="text" v-model="userInput" @keyup.enter="submit(userInput, false)">
            <button id="enter-button" @click.prevent="submit(userInput, false)">Chat</button>
        </div>
    </div>
</template>

<script>
import jokesApi from '@/services/JokesWebApi.js';
import catFactApi from '@/services/CatFactWebApi.js';
import bot from '@/components/BotHead.vue';

export default {
    name: "chatbox",
    components: {
        bot
    },

    created() {
        this.$nextTick(() => {
            let r = Math.floor(Math.random() * this.greetings.length);
            if (this.randomFaces === true) {
                let rFace = Math.floor(Math.random() * this.faces.length);
                this.face = this.faces[rFace];                
            }
            this.buildText(this.greetings[r], true);
        });
    },

    data () {
        return {
            userInput: "",

            /*
                <img>:  {
                        "type": "img"
                        "src": ""
                        "alt": ""
                        }

            */

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
            ]
        }
    },

    methods: {

        submit(text, isBot) {
            if (!isBot && text === "") return;
            this.buildText(text, isBot);
            this.parseInput();
        },
        
        buildText(text, isBot) {
            let box = document.getElementById('chat-content');
            let p = document.createElement('p');
            p.innerText = text;
            let div = this.styleElement(p, isBot);
            box.insertAdjacentElement('beforeend', div);
            this.$nextTick(() => {
                document.getElementById("chat-content").scrollTop = document.getElementById("chat-content").scrollHeight;
            });
            if (isBot) this.$refs.bot.talk();
        },

        makeDiv(isBot) {
            let div = document.createElement('div');
            if (isBot) {
                div.style.backgroundColor = 'rgb(233, 109, 252)';
                div.style.alignSelf = 'flex-start';
            } else {
                div.style.backgroundColor = ' rgb(92, 227, 247)';
                div.style.alignSelf = 'flex-end';
            }
            div.style.borderRadius = '15px';
            div.style.width = '50%';
            div.style.padding = '20px';
            div.style.margin = '10px';
            return div;
        },

        buildLink(href, innerText) {
            let box = document.getElementById('chat-content');
            let a = document.createElement('a');
            a.innerText = innerText;
            a.href = href;
            let div = this.styleElement(a, true);
            box.insertAdjacentElement('beforeend', div);
            this.$nextTick(() => {
                document.getElementById("chat-content").scrollTop = document.getElementById("chat-content").scrollHeight;
            });
            this.$refs.bot.talk();
        },

        styleElement(e, isBot) {
            let div = this.makeDiv(isBot);
            if (isBot) {
                e.style.color = '#100606';
            } else {
                e.style.color = 'rgb(31, 33, 33)';
            }
            e.style.textAlign = 'justify';
            e.style.margin = '0';
            div.insertAdjacentElement('beforeend', e);
            return div;
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
                this.buildText(joke, true);
            });
        },

        getCatFact() {
            let fact = "";
            catFactApi.getCatFact().then(r => {
                fact = r.data.fact;
                this.buildText(fact, true);
            });
        },

        parseInput() {
            let input = this.userInput.toLowerCase();
            if (input.includes("joke")) this.getJoke();
            else if (input.includes("cat")) this.getCatFact();
            else if (input.includes("about")) this.buildLink('http://localhost:8081/about', 'Learn more about Chatbot!');
            else {this.buildText("Sorry, I can't process that request +_+", true)}
            this.userInput = "";
        }
    }
}
</script>

<style scoped>

#display-box {
    display: flex;
    flex-direction: column;
    height: 600px;
    width: 700px;
    margin: auto;
    margin-top: 60px;
    padding: 5px 30px 30px 30px;
    position: relative;
    background-color: rgb(25, 34, 58);
    color: rgb(214, 214, 214);
    border: 1px solid white;
}

#chat-content {
    display: flex;
    width: 100%;
    max-height: 450px;
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    overflow: auto;
    overflow-wrap: break-word;
}

#chat-input {
    margin: auto;
    padding: 0px 30px;
    width: 100%;
    border-radius: 6px 0px 0px 6px;
}
#enter-button {
    width: auto;
    border-radius: 0px 6px 6px 0px;
}
#input-box {
    width: 760px;
    display: flex;
    flex-direction: row;
    margin: auto;
}

p {
    width: 90%;
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