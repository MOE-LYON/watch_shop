<template>
  <div class="container">
    <div class="main">
      <div class="cart">
        <div class="top flex">
          <div class="flex">
            <h2>我的购物车</h2>
          </div>
          <div style="line-height: 120px;">
            <a href="javascript:void(0)">我的订单历史</a>
          </div>
        </div>
        <div class="con" v-if="items.length>0">
          <table>
            <thead>
              <tr>
                <th>
                  <input type="checkbox" name="choiceall" class="checkall">
                  <label></label>
                  <label>全选</label>
                </th>
                <th></th>
                <th>商品名称</th>
                <th>单价</th>
                <th>数量</th>
                <th>小计</th>
                <th>操作</th>
              </tr>
            </thead>
            <tbody>
              <CartItem v-for="(item,index) in items" :key="index" 
              @updatenum="upnum" 
              :item="item"
              @del="del"
              />
            </tbody>
          </table>
          <div class="bottom flex">
            <p>
              总计金额:
              <br>
              <span class="total">￥233</span>
            </p>
            <button type="button">去结算</button>
          </div>
        </div>
        <div v-else class="tip">快去加入商品到购物车吧</div>
      </div>
    </div>
  </div>
</template>
<script>
import CartItem from "./components/CartItem.vue";
export default {
  data() {
    return {
      items: [
        {
          name: "dsadas",
          price: 666,
          quantity: 6,
          photo: "996163.jpg",
          id: 1
        }
      ]
    };
  },
  components: {
    CartItem
  },
  methods: {
    upnum(id, quantity) {
      let res = this.items.find(p => p.id == id);
      res.quantity = quantity;
      this.$set(res, "quantity", quantity);
    },
    del(id){
        this.items = this.items.filter(item=>item.id!=id);
    }
  }
};
</script>
<style>
.tip {
  text-align: center;
  font-size: 25px;
  color: #08c;
}
.main {
  padding: 30px;
}
.cart {
  border: 1px solid #ccc;
  height: 100%;
  background-color: white;
  border-radius: 5px;
  box-shadow: 0px 0 5px #e5e5e5;
  padding-bottom: 40px;
  min-height: 450px;
}
.cart .top {
  justify-content: space-between;
  padding: 0 20px;
}
.cart .top .flex * {
  align-self: baseline;
}
.cart .top .flex h2 {
  font-size: 32px;
  line-height: 115px;
  margin-right: 25px;
  color: #07111b;
  font-weight: 200;
}
table {
  border-collapse: collapse;
  border-spacing: 0;
  border: 0;
  text-align: center;
  width: 937px;
  margin: 0 auto;
}
tr {
  border-bottom: 1px solid rgb(219, 162, 139);
}
th {
  line-height: 50px;
  border-top: 3px solid #ffd6a7;
  font-size: 18px;
  font-weight: normal;
}
td {
  padding: 10px;
  color: #444;
}
table tbody tr td:nth-child(2) img {
  width: 80px;
  height: 100px;
}
.checkbox {
  width: 60px;
}
.price {
  width: 130px;
  font-weight: bold;
}
.count {
  width: 90px;
}
.count .add,
.count input,
.count .reduce {
  float: left;
  margin-right: -1px;
  position: relative;
  z-index: 0;
}
.count .add,
.count .reduce {
  height: 23px;
  width: 17px;
  border: 1px solid #e5e5e5;
  background: #f0f0f0;
  text-align: center;
  line-height: 23px;
  color: #444;
}
.count .add:hover,
.count .reduce:hover {
  color: #f50;
  z-index: 3;
  border-color: #f60;
  cursor: pointer;
}
.count input {
  width: 50px;
  height: 15px;
  line-height: 15px;
  border: 1px solid #aaa;
  color: #343434;
  text-align: center;
  padding: 4px 0;
  background-color: #fff;
  z-index: 2;
}
.delete {
  font-size: 24px;
  height: 90px;
  color: #b7bbbf;
  line-height: 90px;
  cursor: pointer;
}
.bottom {
  justify-content: flex-end;
  margin: 40px 100px 0 0;
}
.bottom button {
  margin-left: 38px;
  float: right;
  padding: 13px 32px;
  color: #fff;
  font-size: 16px;
  color: #fff;
  cursor: pointer;
  font-weight: 200;
  background: #f01414;
  border-radius: 4px;
  border: none;
}
.bottom p {
  line-height: 25px;
  font-weight: bold;
}
.bottom .total {
  color: #f01414;
  font-size: 16px;
}
input + label {
  background-color: white;
  border-radius: 5px;
  border: 1px solid #d3d3d3;
  width: 20px;
  height: 20px;
  display: inline-block;
  text-align: center;
  vertical-align: middle;
  line-height: 20px;
  color: #f50;
}
input:checked + label {
  background-color: white;
}
input:checked + label:after {
  content: "\2714";
}
input[type="checkbox"] {
  display: none;
}
</style>
