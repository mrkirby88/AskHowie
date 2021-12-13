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
import cbApi from '@/services/CBWebApi.js';

export default {
    name: "chatbox",
    components: {
        bot
    },

    created() {
        this.$nextTick(() => {
            // let r = Math.floor(Math.random() * this.greetings.length);
            // if (this.randomFaces === true) {
            //     let rFace = Math.floor(Math.random() * this.faces.length);
            //     this.face = this.faces[rFace];                
            // }
            // this.buildText(this.greetings[r], true);
            this.processResponse(this.fakeResponse);
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

        submit(text, isBot) {
            if (!isBot && text === "") return;
            this.buildText(text, isBot);
            this.parseInput();
        },

        processResponse(response) {
            let isBot = true;
            let div = this.buildDiv(isBot);
            this.insertElement(div, this.buildText(response.description, isBot));
            if (response.links !== null) {
                this.insertElement(div, this.buildText("Here are some useful links:", isBot))
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
        
        buildText(text, isBot) {
            let p = document.createElement('p');
            p.innerText = text;
            p.style.margin = "40px";
            this.styleElement(p, isBot);
            return p;            
        },

        buildLink(text, url) {
            let a = document.createElement('a');
            a.href = url;
            a.innerText = text;
            a.target = '_blank';
            this.styleElement(a, true);
            return a;
        },

        buildImg(text, url) {
            let img = document.createElement('img');
            let a = document.createElement('a');
            a.href = url;
            a.target = "_blank";
            img.src = url;
            img.alt = text;
            img.style.maxWidth = '300px';
            this.insertElement(a, img);
            return a;
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

        buildDiv(isBot) {
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

        styleElement(e, isBot) {
            if (isBot) {
                e.style.color = '#100606';
            } else {
                e.style.color = 'rgb(31, 33, 33)';
            }
            e.style.textAlign = 'justify';
            e.style.margin = '0';
            return e;
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

        queryServer(input) {
            cbApi.submitQuery(input).then(r => {
                this.buildText(r.data, true);
            })
        },

        parseInput() {
            let input = this.userInput.toLowerCase();
            if (input.includes("joke")) this.getJoke();
            else if (input.includes("cat")) this.getCatFact();
            else if (input.includes("about chatbot") || input.includes("about yourself")) this.buildLink('http://localhost:8081/about', 'Learn more about Chatbot!');
            else {this.queryServer(input)}
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
    margin-bottom: 20px;
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