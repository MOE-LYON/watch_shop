<template>
  <li>
    <div class="item">
      <img :src="`${publicPath}images/`+item.Photo" alt="">
      <p class="des">{{item.Description}}</p>
      <p>
        <span class="item-price">￥{{item.Price}}</span>
      </p>
      <div class="flex buttons">
        <span>加入购物车</span>|
        <span>对比</span>|
        <span>收藏</span>
      </div>
    </div>
  </li>
</template>
<script>
export default {
    props:[
        'item'
    ],
    data(){
        return{
            publicPath: process.env.BASE_URL
        }
    }
}
</script>
