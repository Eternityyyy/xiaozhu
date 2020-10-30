<template>
  <div>
    <!--  -->
    <van-nav-bar @click-left="onClickLeft"  class="left" left-arrow border title="添加入住人" fixed>
    </van-nav-bar>
    <!--  -->
    <div class="mag_top"></div>
    <!--  -->
    <div class="paddingBox">
      <div class="addInfoTitle">
        身份信息
        <span>（必填）</span>
      </div>
      <div>
        <van-cell-group>
          <van-field v-model="user" :state="userState"  @blur.native.capture="checkUsername"  label="真实姓名" placeholder="请确保信息真实" />
        </van-cell-group> 
      </div>
      <div>
        <van-cell-group>
          <van-field v-model="idCart" :state="idCartState" @blur.native.capture="checkIdcart" :rules="[{ required: true, message: '请填写用户名' }]" type="text" label="身份证号"  placeholder="请确保信息真实" />
        </van-cell-group>
      </div>
      <div class="addInfoTitle">
        <p>
          其他
          <span>（选填）</span>
        </p>
        <div class="phoneRemain"> 
          <p>
            信息真实完整可免费获赠最高保额31万元的
            <a href="#">住宿旅行意外险</a>
            ，同步下发
            <a href="#">智能门锁密码</a>
            ，确保多人入住
          </p>
        </div>  
      </div>
      <div>
        <van-cell-group>
          <van-field
            v-model="phone"
            label="手机号"
            right-icon="https://m.xiaozhu.com/static/images/flag/China.jpg"
            placeholder="请输入手机号" 
            :state="phoneState"
            @blur.native.capture="checkPhone" 
            :rules="[{ required: true, message: '请填写用户名' }]"
          >
          <template #button>
            <van-button size="small" type="primary">+86</van-button>
          </template>
          </van-field>
        </van-cell-group>
      </div>
    </div>
    <!--  -->
    <div class="paddingBox">
      <div class="operateBtnBox">
        <van-button type="default" size="large">
          确认
        </van-button>
      </div>
    </div>
  </div>    
</template>
<script>
import { Toast } from 'vant';
export default {
  data(){
    return{
      user:"",
      idCart:"",
      phone:"",
      pattern: /\d{6}/,
      userState:"",
      idCartState:"",
      phoneState:""
    }
  },
  methods:{
    onClickLeft(){
      Toast('返回');
      this.$router.push("/add");
    },
    checkUsername(){
      let userRegExp=/^[\u4e00-\u9fa5]{1,12}$/;
      if(userRegExp.test(this.user)){
        this.idCartState="success";
        return true;
      }else{
        this.userState="error";
        this.$toast({
          message:"真实姓名必填项",
          position:"top",
          duration:"2000"
        });
        return false;
      }
    },
    checkIdcart(){
      let idCartRegExp=/^[0-9X]{18}$/;
      if(idCartRegExp.test(this.user)){
        this.idCartState="success";
        return true;
      }else{
        this.userState="error";
        this.$toast({
          message:"身份证必填项",
          position:"top",
          duration:"2000"
        });
        return false;
      }
    },
    checkPhone(){
      let phoneRegExp=/^1[3-9]\d{9}$/;
      if(phoneRegExp.test(this.user)){
        this.phoneState="success";
        return true;
      }else{
        this.phoneState="error";
        this.$toast({
          message:"电话号码为必填项",
          position:"top",
          duration:"2000"
        });
        return false;
      }
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
.left>>>.van-nav-bar__title{
  font-size:0.426rem !important;
  color: #333 !important;
  font-weight: 700 !important;
}
.van-cell{
  padding:0.37rem 0.426rem;
}
.van-button--default{
  font-size:0.4rem;
  color:#ffffff;
  background: #eb5381;
  border-radius:0.15rem;
}
.van-button--large {
  width: 100%;
  height: 1.0666rem;
}
.mint-toast is-placetop{
  font-size:0.37rem;
}
.paddingBox{
  padding:0.4rem;
}
.van-button--primary {
  color: #333;
  background-color: #fff;
  border: 1px solid #fff;

}
.van-field__button {
  padding-left: 0.18rem;
}
.van-button--small {
  padding:0;
  height: 0.853rem;
  font-size: 0.37rem;
}
.mag_top{
  margin-top:1.5rem;
}
.addInfoTitle{
  padding-bottom: .4rem;
  border-bottom: .053333rem solid #212121;
  font-size: .426667rem;
  margin-top: .533333rem;
  color: #212121;
}
.addInfoTitle span{
  font-size:0.32rem;
}
.phoneRemain{
  color: #757575;
  font-size: .32rem;
}
.phoneRemain p{
  margin-top: .266667rem;
  line-height: 1.4;
}
.phoneRemain a{
  color:#212121;
  text-decoration: underline;
}
.operateBtnBox{
  padding:0 0 8vw 0;
}
</style>


