<template>
  <div>
    <van-nav-bar @click-left="onClickLeft"  class="left" left-arrow border title="选择入住人" fixed right-text="完成">
    </van-nav-bar>
    <div class="mag_top"></div>
    <div class="paddingBox paddingTopBox">
      <router-link to="/adds">
        <van-button type="default" size="large">
          添加入住人
        </van-button> 
        <p class="addOutside">
          添加中国大陆地区以外的入住人<van-icon name="play" />
        </p>
      </router-link>    
    </div>
  </div>
</template>
<script>
import { Toast } from 'vant';
export default {
  methods:{
    onClickLeft(){
      Toast('返回');
      this.$router.push("/detail");
    }
  }
}
</script>
<style scoped>
.left>>> .van-icon{
  color:#212121;
}
.van-hairline--bottom{
  border-bottom:0.266vw solid #e8e8e8;
}
.left>>>.van-nav-bar__text{
  font-size: .426667rem;
  color:#ff4081;
}
.van-button--default{
  font-weight:700;
  color:#ffffff;
  background: #eb5381;
  border-radius:0.15rem;
}
.mag_top{
  margin-top:1.5rem;
}
.paddingBox{
  padding:0.4rem;
}
.addOutside{
  margin: .533333rem 0;
  text-align: center;
  color: #212121;
  font-size: .32rem;
  font-weight: 700;
}
</style>


