<template>
    <div class="personalcenter">
        <van-nav-bar title="个人中心" left-arrow @click-left="$router.go(-1)">
            <template #right>
                 <van-icon name="/more.png"/>
             </template>
        </van-nav-bar>
        <div class="my_top">
          <div class="my_info">
             <div class="top_section">
                <div class="my_head_img">
                    <img src="https://image.xiaozhustatic1.com/00,100,100,1,80,1/3,8,0,19,8755,260,260,976ffdd9.jpg"/>
                </div>
                <p class="my_user_name">哇咔咔23</p>
             </div>
             <div class="list_wrap">
                <div class="list_item">
                    <img src="~assets/img/heart.png">
                    <p>我的收藏</p>
                </div>
                <div class="list_item">
                    <img src="~assets/img/order.png">
                    <p>我的订单</p>
                </div>
                <div class="list_item">
                    <img src="~assets/img/xiaoxi.png">
                    <p>我的评论</p>
                </div>
                <div class="list_item">
                    <img src="~assets/img/money.png">
                    <p>代金券</p>
                </div>
             </div>
          </div>
          <div class="my_center">
            <van-cell title="分享优惠" is-link value="与好友一起积攒住宿基金"/>
            <van-cell title="积分兑换" is-link value="点击下载APP兑换礼品" />
          </div>
          <div class="my_center">
            <router-link to="/logout"><van-cell title="账号设置" is-link/></router-link>
            <van-cell title="身份认证免押" is-link value="去认证" />
            <van-cell title="常用入住人" is-link />
          </div>
          <div class="my_center">
            <van-cell title="我想成为房东" is-link/>
            <van-cell title="关于小猪" is-link/>
          </div>
        </div>
    </div>
</template>
<style scoped>
.personalcenter>>>.van-nav-bar__title{
    font-size:.426667rem;
    font-weight: 700;
}
.personalcenter>>>.van-icon{
    color:#ccc;
    font-weight: 700;
}
.my_info{
    width: 92%;
    background-image: url(https://m.xiaozhu.com/v_e0bea/static/img/myInfoBg.33d734d.jpg);
    background-size: cover;
    border-radius: .266667rem; 
}
.my_head_img{
    width: 2.133333rem;
    height: 2.133333rem;
    border: .106667rem solid hsla(0,0%,100%,.31);
    border-radius: 50%;
    margin: 0 auto;
    overflow: hidden;
}
.my_info{
     margin: 0 auto;
}
.my_user_name{
    color: #fff;
    font-size: .48rem;
    font-weight: 600;
    margin: .266667rem 0;
    text-align: center;
}
.list_wrap{
    margin: .8rem auto .173333rem;
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    width: 96%;
}
.list_item{
    font-size: .4rem;
    font-weight: 200;
    width: 48%;
    border-radius: .266667rem;
    margin: .08rem;
    background-color: hsla(0,0%,100%,.7);
    text-align: center;
    padding-bottom: .533333rem;
    box-shadow: 0 0.08rem 0.213333rem rgba(38,40,43,.25);
}

.list_item img{
    width: .8rem;
    margin: .213333rem;
    padding-top: .333333rem;
}
.list_item p{
    font-weight: 500;
    text-align: center;
    margin: .1rem;
}
.my_center{
    width: 96%;
    margin: .48rem auto .68rem;
}
.van-cell{
    background-color: #f5f5f5;
    border-radius: .266667rem;
}
.van-cell__value {
    color:#ff4081;
}
</style>