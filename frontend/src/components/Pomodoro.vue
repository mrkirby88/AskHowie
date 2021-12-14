<template>
    <div id="app">    
        <h1 class="title"> Pomodoro </h1>
            <h2 class="message">{{ message }}</h2>
        
            <div id="timer">
                <span id="minutes">{{ minutes }}</span>
                <span id="middle">:</span>
                <span id="seconds">{{ seconds }}</span>
            </div>            

            <div id="buttons">
                <button id="start" class="button" v-if="!timer" @click.prevent="startTimer">Start</button>
                <button id="stop" class="button" v-if="timer" @click.prevent="stopTimer">Stop</button>
                <button id="reset" class="button" v-if="resetButton" @click.prevent="resetTimer">Reset</button>

            </div>
        </div>
</template>

<script>
export default {
    
  data () {
      return {
    
    timer: null,
    totalTime: (25 * 60),
    resetButton: false,
    message: "Please press start to begin timer."
    
    }
  },
  // ========================
  methods: {
    startTimer: function() {
      this.timer = setInterval(() => this.countdown(), 1000);
      this.resetButton = true;
      this.message = "Timer has started!"
    },
    stopTimer: function() {
      clearInterval(this.timer);
      this.timer = null;
      this.resetButton = true;
      this.message = "Timer has stopped!"
    },
    resetTimer: function() {
      this.totalTime = (25 * 60);
      clearInterval(this.timer);
      this.timer = null;
      this.resetButton = false;
      this.message = "Timer has been reset!"
    },
    padTime: function(time) {
      return (time < 10 ? '0' : '') + time;
    },
    countdown: function() {
      if(this.totalTime >= 1){
        this.totalTime--;
      } else{
        this.totalTime = 0;
        this.resetTimer()
      }
    }
  },
  // ========================
  computed: {
    minutes: function() {
      const minutes = Math.floor(this.totalTime / 60);
      return this.padTime(minutes);
    },
    seconds: function() {
      const seconds = this.totalTime - (this.minutes * 60);
      return this.padTime(seconds);
    }
  }
}

</script>

<style scoped>
#app {
    display: flex;
    width: 20%;
    height: 10%;
    margin: 5%;
    background-color: blue;
    border-radius: 5%;
    
}
.title{
    display: flex;
    align-self: center;
    text-decoration: underline;

}
#timer {
  font-size: 50px;
  margin: 0 15% 5% 15%;
  display: inline-block;
  border-style: groove;
  border-color: black;
  background-color: black;
  color: white;
  
}
.message{
 font-family: 'Gill Sans', 'Gill Sans MT', Calibri;
 margin: 10%;  
border-style: groove;
border-color: black;
background-color: black;
color: white;
}
#buttons {
display: flex; 
flex-direction: row;
justify-content: space-around;
}
.button{
font-size: 16px;
width: 30%;
}
</style>