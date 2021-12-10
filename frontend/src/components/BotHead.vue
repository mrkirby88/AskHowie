<template>
  <div>
    <div id="bot-ball">-</div>
    <div id="bot-antenna">.</div>
    <div id="bot-head">
        <h2 id="bot-face">{{face}}</h2>
    </div>
  </div>
</template>

<script>
export default {
    data() {
        return {
            face: "+_+",
            faces: [
                "+o+",
                "^_^",
                "d^_^b",
                "+_+",
                "^o^"
            ]
        }
    }
}
</script>

<style scoped>
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