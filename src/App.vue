<template>
  <div id="app">
    <Header/>
    <router-view/>
    <Footer/>
  </div>
</template>
<script>
import Header from "@/components/header.vue";
import Footer from "@/components/footer.vue";
export default {
  name: "app",
  components: {
    Header,
    Footer
  }
};
</script>
<style>
#app {
  font-family: "Avenir", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
}
* {
  margin: 0;
  padding: 0;
}

body {
  font-size: 14px;
  line-height: 1.5;
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen,
    Ubuntu, Cantarell, "Open Sans", "Helvetica Neue", sans-serif;
  color: rgba(72, 61, 61, 0.762);
}

.container {
  width: 85%;
  max-width: 1140px;
  margin: 0 auto;
}

header {
  box-shadow: 1px 1px 5px #08c;
}

header .flex {
  justify-content: space-between;
}

header .flex * {
  align-self: center;
}

header .flex a {
  padding: 5px 15px;
  display: inline-block;
  color: black;
  text-decoration: none;
  font-size: 16px;
  transition: 0.5s;
}

ul li {
  list-style: none;
}

a {
  color: black;
  translate: 0.5s;
  text-decoration: none;
}

header .flex a:hover {
  color: rgb(221, 144, 0);
}

.flex {
  display: flex;
}
footer {
  background-color: black;
  color: white;
  opacity: 0.9;
  padding-top: 10px;
  padding-bottom: 10px;
  margin-top: 20px;
}

footer .intro ul {
  display: flex;
  flex-wrap: nowrap;
  background-color: rgb(49, 50, 50);
  margin-bottom: 20px;
}

footer .intro ul li {
  width: 20%;
  text-align: center;
  display: inline-block;
  padding-top: 10px;
  padding-bottom: 10px;
  list-style: none;
}

footer p {
  text-align: center;
}
.center {
  text-align: center;
}
</style>
