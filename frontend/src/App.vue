<template>
  <div id="app">
    <router-view />
  </div>
</template>

<style>

  @import url('https://fonts.googleapis.com/css2?family=Inter&display=swap');
  @import url('https://fonts.googleapis.com/css2?family=JetBrains+Mono:wght@500&display=swap');
  @import url('https://fonts.googleapis.com/css2?family=Bakbak+One&display=swap');

  body {
    background-color: rgb(26, 28, 30);
    font-family: 'Inter', sans-serif;
  }

  input, button {
    height: 1.5rem;
    margin: 5px 0px 5px 0px;
    border-radius: 6px;
    border: 0px;
  }

  input:focus {
    outline: none;
  }

  #form-box {
    width: 400px;
    height: 400px;
    background-color: rgb(54, 186, 238);
    border-radius: 3px;
    align-self: center;
    margin-top: 50px;
  }

  #username-group, #password-group, #confirmedPassword-group {
  display: flex;
  flex-direction: column;
  width: 100%;
  }

  .form-signin, .form-register {
  height: 80%;
  width: 80%;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  margin: auto;
  }

  .article{
    display: flex;
    flex-direction: column;
    /* align-items: left; */
    background-color: #0b507a;
    color: #dfdfdf;
    /* min-height: 100vw; */   /*Check With Kenton on This One with how it affects Home vs About */
    /* width: 800px; */
    /* margin: auto; */
    padding: 326px;
    padding-top: 10px;
  }
  #nav, .article{
    margin: 0 11.6%
    
  }


</style>