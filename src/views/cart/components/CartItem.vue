<template>
  <tr>
    <td class="checkbox">
      <input type="checkbox" v-model="check" :id="item.id">
      <label :for="item.id"></label>
    </td>
    <td><img :src="`images/`+item.photo"></td>

    <td>{{item.name}}</td>
    <td class="price">￥{{item.price}}</td>
    <td class="count">
      <span class="reduce" @click="reduce">-</span>
      <input class="count-input" type="text" value="1" v-model="quantity">
      <span
        class="add"
        @click="add"
      >+</span>
    </td>
    <td style="font-weight: bold;">￥{{subtotal}}</td>
    <td>
      <span class="delete" @click="del">X</span>
    </td>
  </tr>
</template>
<script>
export default {
    props:['item'],
    data(){
        return {
            quantity:1,
            check:true
        }
    },
    methods:{
        reduce(){
            if (this.quantity<=1) return;
            this.quantity--;
        },
        add(){
            this.quantity++;
        },
        del(){
            this.$emit('del',this.item.id);
        }
    },
    computed:{
        subtotal(){
            return this.item.price*this.quantity;
        }
    },
    watch:{
        quantity:function(val){
            this.$emit('updatenum',this.item.id,val);
        }
    },
    created(){
        this.quantity=this.item.quantity;
    }
}
</script>

