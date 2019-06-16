<template>
  <div class="container">
    <div class="main flex">
      <div class="left">
        <img :src="`/images/`+item.photo" alt="">
        <div class="buy">
          <h3>同价位网友最喜欢的</h3>
          <p>劳力士格林尼治型II系列116710LN</p>
          <p>劳力士日志型系列126334</p>
        </div>
      </div>
      <div class="right" style="min-width: 50%;">
        <div class="title" id="watch_title" runat="server"></div>
        <div class="des" id="watch_des" runat="server">
            {{item.description}}
        </div>
        <div class="con">
          <div class="flex">
            <p>
              销售价
              <span class="con-price">
                ￥
                {{item.price}}
                
              </span>
            </p>
            <p>收藏</p>
          </div>
          <div class="credit">
            购物积分
            <span class="con-credit">{{item.price}}</span>
            <span class="question">?</span>
          </div>
        </div>
        <div class="colors">
          选择颜色
          <span class="active" style="background-color: black;"></span>
          <span style="background-color: #08c;"></span>
          <span style="background-color: coral"></span>
        </div>
        <div class="num">
          数量
          <span class="descres" @click="descres">-</span>
          <input type="text" name="num" v-model="quantity" value="1">
          <span class="add" @click="add">+</span>
        </div>
        <div class="bottom">
          <button type="button">立即购买</button>
          <button type="button" class="addtocart" @click="addtocart">加入购物车</button>
          <button type="button" class="dingzhi">我要定制</button>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import axios from 'axios'
export default {
  data() {
    return {
      item: {
        name: "test",
        Description: "dasdsa",
        Price: 666,
        Photo: "996163.jpg",
        id: 1
      },
      quantity: 1
    };
  },
  created() {
    this.id = this.$route.params.itemId;
    axios.get('http://127.0.0.1:5000/api/item',{params:{id:this.id}})
    .then(res=>{this.item = res.data.data})
    .catch(error=>{console.log(error)})
  },
  methods: {
    descres() {
      if (this.quantity <= 1) return;
      this.quantity--;
      
    },
    add() {
      this.quantity++;
    },
    addtocart(){
      return 'qaq'
    }
  }
}
</script>

<style>
.left {
  margin-right: 30px;
  min-width: 40%;
}
.right > div {
  margin-bottom: 20px;
}
.right .con {
  padding: 20px;
  background-color: rgba(236, 236, 236, 0.945);
  padding-top: 5px;
}
.right .con .con-price {
  color: red;
  margin-left: 10px;
  font-size: 28px;
}
.right .con .flex {
  justify-content: space-between;
}
.right .con .flex * {
  align-self: center;
}
.right .con p {
  margin-bottom: 10px;
}
.con-credit {
  margin-left: 10px;
  margin-right: 5px;
}
.right .num span {
  cursor: pointer;
  margin-left: 10px;
  margin-right: 10px;
  font-size: 18px;
  background-color: #eee;
  padding: 0 10px;
}
.descres {
  margin-left: 30px;
  margin-right: 10px;
}
.right .num input {
  outline: none;
  border: none;
  width: 45px;
  text-align: center;
  border: 1px solid rgb(179, 137, 241);
  height: 25px;
}
.right .bottom {
  margin-top: 100px;
}
.right .bottom button {
  text-align: center;
  display: inline-block;
  padding: 10px 30px;
  background-color: black;
  color: white;
  border: none;
  cursor: pointer;
}
.right .bottom button.dingzhi {
  background-color: red;
}
.right .colors span {
  margin-left: 20px;
  width: 30px;
  display: inline-block;
  height: 30px;
  vertical-align: middle;
  cursor: pointer;
}
.right .colors .active {
  border: 2px solid red;
}
.main {
  padding-bottom: 50px;
  margin-top: 20px;
}
.left {
  border: 1px solid rgb(201, 200, 200);
  position: relative;
}
.left img {
  display: block;
  margin: 0 auto;
  width: 350px;
  height: 400px;
}
.left .buy {
  bottom: 0;
  text-align: center;
  width: 100%;
  margin-top: 10px;
}

.left .buy h3 {
  text-align: center;
  border-bottom: 1px solid rgb(221, 144, 0);
  padding-bottom: 5px;
}

.left .buy p {
  margin: 10px 0;
}
</style>