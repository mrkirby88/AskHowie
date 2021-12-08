<template>
    <div>
        <div id="display-box">
            <div id="chat-content">
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
    data () {
        return {
            userInput: "",
            chatContents: [
                "Hello, this is chatbot.",
                "This is chatbot again.",
                "Hello, this is chatbot.",
                "Hello, this is chatbot.",
                "Hello, this is chatbot.",
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
    },
    mounted: {
        scrollDown() {
            let chat = this.$chatbox.querySelector("#chat-content");
            chat.scrollTop = chat.scrollHeight;
        }
    }
}
</script>

<style scoped>

#display-box {
    height: 400px;
    width: 700px;
    margin: auto;
    padding: 10px 30px;
    position: relative;
    background-color: rgb(25, 34, 58);
    color: rgb(214, 214, 214);
    border: 1px solid white;
}

#chat-content {
    width: 100%;
    max-height: 100%;
    position: absolute;
    bottom: 0;
    overflow: auto;
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
</style>