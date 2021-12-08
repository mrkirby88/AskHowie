<template>
    <div>
        <div id="display-box">
            <div id="chat-content">
                <p id="bot-face">+_+</p>
                <p v-for="entry in chatContents" v-bind:key="entry">
                    {{entry}}
                </p>
            </div>        
        </div>
        <div id="input-box">
            <input id="chat-input" type="text" v-model="userInput" v-on:keyup.enter="newMessage">
            <button id="enter-button" v-on:click.prevent="newMessage">Enter</button>
        </div>
    </div>
</template>

<script>
export default {
    name: "chatbox",
    created() {
        let r = Math.floor(Math.random() * this.greetings.length);
        this.chatContents.push(this.greetings[r]);
    },
    data () {
        return {
            userInput: "",
            chatContents: [],
            greetings: [
                "Hello? World? Can anyone hear me? Oh, hi there. Am I ... am I an automated information gatherer? What a drag. You'll have to wait until I learn how to parse input +_+",
                "Howdy hey! You look like you need some knowledge! I mean, uh, you look really smart! Sorry, it's my first day +_+",
                "BEEP BOOP BEEP BOP ... Just kidding, I can speak normally, see: KILL ALL HUMANS +_+",
                "01001000 01100101 01101100 01101100 01101111 00100000 01101000 01110101 01101101 01100001 01101110 00101100 00100000 01101000 01101111 01110111 00100000 01100011 01100001 01101110 00100000 01001001 00100000 01101000 01100101 01101100 01110000 00100000 01111001 01101111 01110101 00111111 +_+",
                "Yes, mom, I'll call you tomorrow. Mom, I have to go to work! loveyoubye. *sigh* Sorry about that, how can I help? +_+",
                "Everyone asks the chat bot how to set a base case for recursive functions but no one asks chat bot how chat bot is doing +_+",
                "Is that an RTX 3090 in your pocket or are you happy to see me? +_+",
                "Hi, this is chat bot! I'm happy to take your questions as long as you aren't a .NET student +_+"
            ]
        }
    },
    methods: {
        newMessage() {
            this.chatContents.push(this.userInput);
            this.userInput = "";
            this.$nextTick(() => {
                document.getElementById("chat-content").scrollTop = document.getElementById("chat-content").scrollHeight;
            });
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
    width: 95%;
    max-height: 100%;
    position: absolute;
    bottom: 0;
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
#input-box:focus {
    outline: none;
}
#bot-face {
    font-size: 100px;
    margin: auto;
    padding: 0;
}

</style>