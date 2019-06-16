<template>
  <div class="home">
    <div class="banner">
      <img src="@/assets/images/banner1.jpg">
    </div>
    <div class="container">
      <hr>
      <div class="main">
        <ul class="flex">
          <Item v-for="item in items" :item="item" :key="item.id" @click.native="todetail(item.id)"/>
        </ul>
      </div>
      <div class="page" v-if="num>1">
        <span href="javascript:void(0)" rel="pre">&lt; 上一页</span>
        <span v-for="index in num" :key="index" :class="loca==index?'active':''">{{index}}</span>
        <span href="javascript:void(0)" rel="next">下一页 &gt;</span>
      </div>
    </div>
  </div>
</template>

<script>
// @ is an alias to /src
import Item from "@/components/item.vue";
export default {
  name: "home",
  components: {
    Item
  },
  methods: {
    todetail(id) {
      this.$router.push("/detail"+'/'+id);
    }
  },
  data() {
    return {
      loca: 1,
      num: 1,
      items: [
        {
          name: "test",
          Description: "dasdsa",
          Price: 666,
          Photo: "996163.jpg",
          id: 1
        },
        {
          name: "test",
          Description: "dasdsa",
          Price: 666,
          Photo: "996163.jpg",
          id: 2
        },
        {
          name: "test",
          Description: "dasdsa",
          Price: 666,
          Photo: "996163.jpg",
          id: 3
        },
        {
          name: "test",
          Description: "dasdsa",
          Price: 666,
          Photo: "996163.jpg",
          id: 4
        },
        {
          name: "test",
          Description: "dasdsa",
          Price: 666,
          Photo: "996163.jpg",
          id: 5
        }
      ]
    };
  }
};
</script>
<style>
table.shaixuan {
  border-collapse: collapse;
}

.shaixuan caption {
  text-align: center;
  margin-bottom: 20px;
  font-size: 30px;
  font-weight: bold;
  color: #737ec6;
}

.shaixuan .row {
  width: 100%;
  font-size: 18px;
}

.shaixuan .row span {
  font-weight: bolder;
}

.shaixuan .row td {
  width: 140px;
  height: 35px;
}

.shaixuan .price .margin {
  margin-right: 30px;
}

.shaixuan .price input {
  text-align: right;
  padding-right: 5px;
  line-height: 25px;
}
.banner {
  margin-top: 10px;
}
.banner img {
  height: 300px;
  width: 100%;
}

.container hr {
  background-color: plum;
  margin: 20px 0;
  height: 3px;
  border: none;
}

.shaixuan-buttons {
  text-align: right;
  margin-right: 50px;
}

.shaixuan-buttons input {
  border: none;
  background-color: rgb(131, 159, 184);
  padding: 5px 15px;
  display: inline-block;
  color: white;
  cursor: pointer;
}

.main ul {
  flex-wrap: wrap;
}

.main ul li {
  width: 23%;
  margin: 10px;
}

.main .item {
  padding: 20px;
  text-align: center;
  font-size: 14px;
  border: 1px solid #ccc;
  cursor: pointer;
}

.main .item:hover {
  box-shadow: 1px 1px 5px #3e3e3e;
}

.main .item > img {
  display: block;
  margin: 0 auto;
  width: 100%;
  height: 300px;
  margin-bottom: 10px;
}

.main .item .item-price {
  color: red;
  font-weight: bold;
  margin-top: 10px;
}

.main .item .buttons {
  margin-top: 10px;
}

.main .item .buttons span {
  width: 33%;
  cursor: pointer;
}
.main .item .des {
  max-height: 40px;
  overflow: hidden;
  margin-bottom: 10px;
}

.page {
  height: 34px;
  line-height: 34px;
  margin-top: 20px;
  margin-bottom: 30px;
  text-align: center;
}

.page span {
  display: inline-block;
  border: 1px solid #ededed;
  padding: 0 12px;
  color: #3e3e3e;
  font-size: 14px;
  font-family: tahoma, simsun;
  text-decoration: none;
  cursor: pointer;
}

.page span:hover {
  color: #f40;
  border-color: #f40;
}

.page .active,
.page .active:hover {
  color: #fff;
  background: #f40;
  border: solid 1px #f40;
}
</style>
