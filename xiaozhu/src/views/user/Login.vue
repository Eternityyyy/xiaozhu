<template>
  <div class="login">
    <div>
        <router-link to="/register">
            <van-nav-bar right-text="注册" />
        </router-link>
    </div>
    <div class="top_logo">
      <img src="~assets/img/logo.png" />
    </div>
    <div class="log_box">
      <van-tabs>
        <van-tab title="普通登录">
          <van-cell-group class="input-box">
            <van-field class="frame_box" v-model="username" left-icon="/header.png" placeholder="手机号、邮箱" @blur.native.capture="checkUsername" :state="usernameState"/>
            <van-field v-model="password" type="password" left-icon="/password.png" placeholder="密码"  @blur.native.capture="checkPassword" :state="passwordState"/>
          </van-cell-group>
          <div class="login_btn" @click="handle">
            <van-button>登录</van-button>
          </div>
          <div class="found">找回密码</div>
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
        </van-tab>
        <van-tab title="短信快捷登录">
          <van-cell-group class="input-box">
            <van-field class="frame_box" left-icon="/header.png" placeholder="手机号、邮箱"/>
            <van-field  center left-icon="/password.png" placeholder="请输入短信验证码">
              <template #button>
                <van-button size="small">发送验证码</van-button>
              </template>
            </van-field>
          </van-cell-group>
          <div class="login_btn">
            <van-button>登录</van-button>
          </div>
          <!-- <div class="found">找回密码</div> -->
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
        </van-tab>
      </van-tabs>
    </div>
  </div>
</template>
<script>
	import { mapMutations,mapActions } from 'vuex'
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
		...mapMutations(['setUser']),
		...mapActions(['initSocket']),
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
        this.axios.post("/users/login", 'username='+this.username+'&password='+this.password).then(res => {
          if (res.data.code == 1) {
						// console.log(res.data)
						this.setUser(res.data.info)
						this.initSocket()
            this.$router.push("/");
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
.found {
  color: #ff4081;
  line-height: 1.226667rem;
  text-align: right;
  height: 0.826667rem;
  padding-right: 0.4rem;
  width: 2.133333rem;
  float: right;
  font-size: 0.426667rem;
}
.login-footer {
  /* margin-top: 20px; */
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