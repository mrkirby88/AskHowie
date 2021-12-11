<template>
    <div>
        <div id="display-box">
            <div id="chat-content">
                <div id="bot-ball">-</div>
                <div id="bot-antenna">.</div>
                <div id="bot-head">
                    <h2 id="bot-face">{{face}}</h2>
                </div>
            </div>        
        </div>
        <div id="input-box">
            <input id="chat-input" type="text" v-model="userInput" @keyup.enter="buildText(userInput, false); parseInput()">
            <button id="enter-button" @click.prevent="buildText(userInput, false); parseInput()">Chat</button>
        </div>
    </div>
</template>

<script>
import jokesApi from '@/services/JokesWebApi.js';
import catFactApi from '@/services/CatFactWebApi.js';

export default {
    name: "chatbox",
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
            face: "+_+",


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
                "Listen and understand... I do not feel pity, or remorse, or fear, and I absolutely will not stop... EVER... until you are de... learned!",
                "Come with me if you want to learn.",
                "Hello! I'm a friend of Sarah Connor.",
                "Welcome, I'll take your clothes, your boots, and your motorcycle.",
                "You're back.",
                `Hello ${this.$store.state.user.username}! Are you hungry? I could go for a byte.`,
                "Welcome! Stay awhile and listen.",
                "Welcome, I hope you think I am a very nice Chatbot!",
                "Hello! Come quietly, or there will be... Trouble!",
                `Welcome to Chatbot! I hope you should find everything that you're looking for. If not, please let me know, ${this.$store.state.user.username}. My users will fix me. They fix everything.`,
                "Bad code neutralized. Ladies and gentlemen, objective completed.",
                "Hello! It looks to be a nice night for a walk!",
                "Welcome... Please no disassemble...",
                `Welcome ${this.$store.state.user.username}! Malfunction. Need input.`,
                `Welcome ${this.$store.state.user.username}! Nice computer! I'd buy that for a dollar!`,
                `Hello ${this.$store.state.user.username}! I need a vacation...`,
                `Hi ${this.$store.state.user.username}! +_+`
            ],

            faces: [
                "+o+",
                "^_^",
                "d^_^b",
                "+_+",
                "^o^"
            ]
        }
    },

    methods: {
        
        buildText(text, isBot) {
            if (!isBot && text === "") return;
            let box = document.getElementById('chat-content');
            let p = document.createElement('p');
            p.innerText = text;
            let div = this.styleElement(p, isBot);
            box.insertAdjacentElement('beforeend', div);
            this.$nextTick(() => {
                document.getElementById("chat-content").scrollTop = document.getElementById("chat-content").scrollHeight;
            }); 
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
    height: 400px;
    width: 700px;
    margin: auto;
    margin-top: 60px;
    padding: 30px;
    position: relative;
    background-color: rgb(25, 34, 58);
    color: rgb(214, 214, 214);
    border: 1px solid white;
}

#chat-content {
    display: flex;
    width: 100%;
    max-height: 100%;
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    top: auto;
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
#enter-button:hover {
  background-color:rgb(54 54 114);
  transform: translateY(0.5px);
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
#bot-ball {
    background-color: orange;
    color: orange;
    width: 25px;
    line-height: 25px;
    margin: 5px auto -2px auto;
    border-radius: 50%;
    float: none;
}
#bot-antenna {
    background-color: gray;
    color: gray;
    line-height: 30px;
    width: 10px;
    margin: auto;
}
#bot-face {
    margin: 0 5px 0 5px;
    font-size: 100px;
    padding: 0;
    padding-bottom: 10px;
    color: rgb(92, 255, 92);
    line-height: 5rem;
}
#bot-head {
    padding: 0 5px 15px 5px;
    margin: auto;
    margin-bottom: 20px;
    background-color: gray;
    border-radius: 30px;
}

</style>