<template>
    <div class="esc">
            <van-nav-bar title="我的账户" left-arrow>
            </van-nav-bar>
        <div class="button">
            <van-button  @click="Logout">退出</van-button>
        </div>
    </div>
</template>
<script>
// import { mapMutions } from 'vuex'
export default {
    data(){
        return{

        }
    },
    methods:{
			// ...mapMutations(['logout']),
    // 用户注销
    Logout(){
      this.$store.commit('logout');
      this.$router.push("/");
		}
	}
}
</script>
<style scoped>
.esc>>>.van-nav-bar__title{
    font-size:.426667rem;
    font-weight: 700;
}
.esc>>>.van-icon{
    color:#ccc;
    font-weight: 700;
}
.button{
    width: 100%;
    text-align: center;
}
.van-button {
  width: 96%;
  font-size: 0.426667rem;
  background: #f5f5f5;
  color: #000;
}
.van-button--default {
    border-radius:.266667rem;
}
</style>