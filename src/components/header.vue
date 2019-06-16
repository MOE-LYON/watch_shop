<template>
  <header>
    <div class="container flex">
      <div class="flex">
        <div class="logo">
          <router-link to="/">
            <img src="@/assets/logo.jpg" alt>
          </router-link>
        </div>
        <ul class="flex">
          <li v-for="link in links" :key="link.name">
            <router-link :to="link.address">{{link.name}}</router-link>
          </li>
        </ul>
      </div>
      <div class="user">
        <span id="islogin" runat="server">
          <a href="/Login">登入</a>
          <a href="/resginser">注册</a>
        </span>
        <span id="user_view" runat="server">
          <a href="user" id="user_name" runat="server"></a>
        </span>
        <router-link to="/cart">购物车(
          <span id="cartnum" runat="server"></span>)</router-link>
      </div>
    </div>
  </header>
</template>

<script>
export default {
  props: { username: { type: String } },
  data() {
    return {
      links:[
        {
          name:'潜航者型',
          address:''
        },{
          name:'超级复杂功能计时',
          address:''
        },{
          name:'电子系列',
          address:''
        },{
          name:'其他',
          address:''
        }
      ]
    };
  },
  methods: {
    qwq() {}
  }
};
</script>

