<template>
    <div>
        <div class="logo">
            <div>
                <div id="bot-ball">-</div>
                <div id="bot-antenna">.</div>
                <div id="bot-head">
                    <h2 id="bot-face">{{face}}</h2>
                </div>
            </div>
            <h1 class="logo-text">ChatBot</h1>
        </div>
        <div class="spacer"></div>
        <div class="logo">
            <h1 class="logo-text-2">ChatB</h1>
            <div>
                <div id="bot-ball">-</div>
                <div id="bot-antenna">.</div>
                <div id="bot-head">
                    <h2 id="bot-face">{{face}}</h2>
                </div>
            </div>
            <h1 class="logo-text-2">t</h1>
        </div>
        <div class="spacer"></div>
        <div class="logo-3">
            <div>
                <div id="bot-ball">-</div>
                <div id="bot-antenna">.</div>
                <div id="bot-head">
                    <h2 id="bot-face">{{face}}</h2>
                </div>
            </div>
            <h1 class="logo-text-3">ChatBot</h1>
        </div>      
    </div>


</template>

<script>
export default {
    data() {
        return {
            face: "+_+",
            mainFace: "+_+",
            altFace: "+.+",
            faces: [
                "+o+",
                "^_^",
                "d^_^b",
                "+_+",
                "^o^"
            ],
            intId: null,
            count: 0
        }
    },
    methods: {
        talk() {
            this.count = 8;
            if (!this.intId) {
                this.intId = setInterval(this.change, 100);
            }
        },
        change() {
            if (this.count === 0) {
                clearInterval(this.intId);
                this.intId = null;
            }
            else {
                this.face = this.face === this.mainFace ? this.altFace : this.mainFace;
                this.count--;
            }
        }
    }
}
</script>

<style>
#bot-ball {
    background-color: orange;
    color: orange;
    width: 25px;
    line-height: 25px;
    margin: 10px auto -2px auto;
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
    text-decoration: none;
    font-family: 'JetBrains Mono', monospace;
    margin: 0 5px;
    font-size: 90px;
    padding: 0;
    padding-bottom: 10px;
    color: rgb(92, 255, 92);
    line-height: 5rem;
}
#bot-head {
    padding: 0 5px 15px 5px;
    margin: 0 10px 20px 20px;
    background-color: gray;
    border-radius: 30px;
}
.logo, .logo-3 {
    display: flex;
    flex-direction: row;
    width: 400px;
    align-items: flex-end;
    background-color: rgb(20, 14, 34);
    width: auto;
    padding: 50px;
}
.logo-3 {
    flex-direction: column;
    align-items: flex-start;
    align-items: center;
}
.logo-text, .logo-text-2, .logo-text-3 {
    font-size: 150px;
    font-family: "Bakbak One", sans-serif;
    margin: 0;
    line-height: 150px;
    color: rgb(0, 238, 255);
}
.logo-text-2 {
    margin-left: 10px;
    font-size: 200px;
    line-height: 180px;
}
h1.logo-text-3 {
    font-size: 50px;
    margin: -22px 0 20px 10px;
    line-height: 20px;
}
.spacer {
    height: 50px;
}
</style>