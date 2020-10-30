<template>
  <div class="register">
        <router-link to="/login">
            <van-nav-bar right-text="登录" />
        </router-link>
    <div class="top_logo">
      <img src="~assets/img/logo.png" />
    </div>
    <div class="log_box">
          <van-cell-group class="input-box">
            <van-field class="frame_box" v-model="username" left-icon="/header.png" placeholder="手机号、邮箱" @blur.native.capture="checkUsername" :state="usernameState"/>
            <van-field class="frame_box" type="password" v-model="password" left-icon="/password.png" placeholder="密码" @blur.native.capture="checkPassword" :state="passwordState"/>
          </van-cell-group>
          <div class="login_btn" @click="handle">
            <van-button>立即注册</van-button>
          </div>
          <div class="login-footer">
            <div class="hz_box">
              <span>合作账号登录</span>
            </div>
            <div class="hz_login">
              <router-link to>
                <img src="~assets/img/QQ.png" />
              </router-link>
              <router-link to>
                <img src="~assets/img/weibo.png" />
              </router-link>
            </div>
          </div>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      // 用户名
      username: "",
      // 密码
      password: "",
      // 用户名的状态
      usernameState: "",
      // 密码的状态
      passwordState: ""
    };
  },
  methods: {
    //校验用户名
    checkUsername() {
      let usernameRegExp = /^[0-9a-zA-Z_]{6,20}$/;
      if (usernameRegExp.test(this.username)) {
        this.usernameState = "success";
        return true;
      } else {
        this.usernameState = "error";
        this.$toast({
          message: "电话错误",
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
      console.log(passwordRegExp.test(this.password))
      if (passwordRegExp.test(this.password)) {
        return true;
      } else {
        this.$toast({
          message: "密码为8位以上字母和数字",
          position: "top",
          duration: "2000"
        });
        return false;
      }
    },
    handle() {
      if (this.checkUsername() && this.checkPassword()) {
        //该将获取到的信息提交到WEB服务器
        this.axios.post("/users/register", 'username='+this.username+'&password='+this.password).then(res => {
          if (res.data.code == 1) {
            this.$router.push("/login");
          } else {
            this.$toast("用户名或密码错误");
          }
        });
      }
    }
  }
};
</script>
<style scoped>
.register >>> .van-nav-bar__text {
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
.register >>> .van-icon {
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
.login-footer {
  width: 100%;
  margin: 1rem auto;
  text-align: center;
}
.hz_box span {
  font-size: 0.426667rem;
  color: #999;
}
.hz_login a img {
  width: 1rem;
  margin: 10px 30px;
}
</style>