<template>
  <div class="login">
    <div class="top_logo">
      <img src="~assets/img/logo.png" />
    </div>
    <div class="log_box">
				<van-cell-group class="input-box">
					<van-field class="frame_box" v-model="username" left-icon="/header.png" placeholder="手机号" @blur.native.capture="checkUsername" :state="usernameState"/>
					<van-field v-model="password" type="password" left-icon="/password.png" placeholder="密码"  @blur.native.capture="checkPassword" :state="passwordState"/>
				</van-cell-group>
				<div class="login_btn" @click="handle">
					<van-button>登录</van-button>
				</div>
    </div>
  </div>
</template>
<script>
import { mapMutations } from 'vuex'
export default {
  data() {
    return {
      username:"",
      password:"",
      usernameState: "",
      passwordState: ""
    };
  },
  methods:{
		...mapMutations(['setOwner']),
      //校验用户名
    checkUsername() {
      let usernameRegExp = /^[0-9a-zA-Z_]{6,20}$/;
      if (usernameRegExp.test(this.username)) {
        this.usernameState = "success";
        return true;
      } else {
        this.usernameState = "error";
        this.$toast({
          message: "电话号码错误",
          position: "top",
          duration: "2000"
        });
        return false;
      }
    },
    //校验密码
    checkPassword() {
      //密码的正则表达式
      let passwordRegExp = /^[0-9A-Za-z]{8,20}$/;
      if (passwordRegExp.test(this.password)) {
        return true;
      } else {
        this.$toast({
          message: "密码必须为字母、数字的组合体",
          position: "top",
          duration: "2000"
        });
        return false;
      }
    },
    handle() {
      if (this.checkUsername() && this.checkPassword()) {
        //该将获取到的信息提交到WEB服务器
        this.axios.post("/msg/owner/login", 'oname='+this.username+'&opwd='+this.password).then(res => {
          if (res.data.code == 1) {
						this.setOwner(res.data.info)
            this.$router.push("/owner");
          } else {
            this.$messagebox("登录提示", "用户名或密码错误");
          }
        });
      }
    }
  }
};
</script>
<style scoped>
.login{
	position: absolute;
	top: 20%;
}
.login >>> .van-nav-bar__text {
  color: #f05b72;
  font-size: 0.426667rem;
}
.top_logo {
  text-align: center;
  margin-bottom: 0.8rem;
}
.top_logo img {
  width: 3.2rem;
}
.log_box {
  width: 9rem;
  margin: 0 auto;
  padding: 0 0.333333rem;
}
.login >>> .van-icon {
  margin-right: 20px;
}
.van-cell {
  border: 0.266vw solid #eee;
}
.van-field {
  border-radius: 0.053333rem;
}
.frame_box {
  margin-bottom: 10px;
}
.scale_text {
  margin-top: 10px;
}
.van-button {
  width: 100%;
  height: 1.066667rem;
  line-height: 1.066667rem;
  text-align: center;
  font-size: 0.426667rem;
  background: #f05b72;
  border-radius: 0.053333rem;
  color: #fff;
}
.login_btn{
	margin-top: 1rem;
}
</style>