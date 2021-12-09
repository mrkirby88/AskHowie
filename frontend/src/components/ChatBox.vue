<template>
    <div>
        <div id="display-box">
            <div id="chat-content">
                <div id="bot-head">
                    <h2 id="bot-face">+_+</h2>
                </div>
            </div>        
        </div>
        <div id="input-box">
            <input id="chat-input" type="text" v-model="userInput" v-on:keyup.enter="buildText(userInput, false)">
            <button id="enter-button" v-on:click.prevent="buildText(userInput, false)">Enter</button>
        </div>
    </div>
</template>
<script>
export default {
    name: "chatbox",
    created() {
        this.$nextTick(() => {
            let r = Math.floor(Math.random() * this.greetings.length);
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

                <a>:    {
                        "type": "link"
                        "href": ""
                        "innerText": ""
                        }

            */


            greetings: [
                `Hello? World? Can anyone hear me? Oh, hi there ${this.$store.state.user.username}. Am I ... am I an automated information gatherer? What a drag. You'll have to wait until I learn how to parse input +_+`,
                `Howdy hey ${this.$store.state.user.username}! You look like you need some knowledge! I mean, uh, you look really smart! Sorry, it's my first day +_+`,
                "BEEP BOOP BEEP BOP ... Just kidding, I can speak normally, see: KILL ALL HUMANS +_+",
                "01001000 01100101 01101100 01101100 01101111 00100000 01101000 01110101 01101101 01100001 01101110 00101100 00100000 01101000 01101111 01110111 00100000 01100011 01100001 01101110 00100000 01001001 00100000 01101000 01100101 01101100 01110000 00100000 01111001 01101111 01110101 00111111 +_+",
                "Yes, mom, I'll call you tomorrow. Mom, I have to go to work! loveyoubye. *sigh* Sorry about that, how can I help? +_+",
                "Everyone asks the chat bot how to set a base case for recursive functions but no one asks chat bot how chat bot is doing +_+",
                "Is that an RTX 3090 in your pocket or are you happy to see me? +_+",
                "Hi, this is chat bot! I'm happy to take your questions as long as you aren't a .NET student +_+",
                `Hi ${this.$store.state.user.username}!`
            ]
        }
    },

    methods: {
        buildText(text, isBot) {
            let box = document.getElementById('chat-content');
            let p = document.createElement('p');
            let div = this.makeDiv();
            p.innerText = text;
            if (isBot) {
                p.style.color = 'rgb(31, 33, 33)';
                div.style.backgroundColor = ' rgb(233, 109, 252)';
                div.style.alignSelf = 'flex-start';
            } else {
                p.style.color = 'rgb(31, 33, 33)';
                div.style.backgroundColor = ' rgb(92, 227, 247)';
                div.style.alignSelf = 'flex-end';
                this.userInput = "";
            }
            p.style.textAlign = 'justify';
            p.style.margin = '0';
            div.style.width = '50%';
            div.style.padding = '20px';
            div.style.margin = '10px';
            div.insertAdjacentElement('beforeend', p);
            box.insertAdjacentElement('beforeend', div);
            this.$nextTick(() => {
                document.getElementById("chat-content").scrollTop = document.getElementById("chat-content").scrollHeight;
            }); 
        },
        makeDiv() {
            let div = document.createElement('div');
            div.style.borderRadius = '15px';
            return div;
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
#bot-face {
    font-size: 100px;
    margin: auto;
    padding: 0;
    color: rgb(92, 255, 92);
}
#bot-head {
    padding: 5px 5px 20px 5px;
    background-color: gray;
    width: 250px;
    border-radius: 30px;
}

</style>