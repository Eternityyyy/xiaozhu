<template>
  <div>
    <!-- -->
    <van-nav-bar class="left" left-arrow border title="开始下单" fixed @click-left="$router.go(-1)">
    </van-nav-bar>
    <div class="mag_top"></div>
    <div class="padding_box ">
      <div class="min_box">
        <div>
          <img :src="baseurl + house.img_t" alt="">
        </div>
        <span>{{house.rName}}</span> 
      </div>
    </div>
    <!--  -->
    <!--  -->
    <div class="xzBgFa bgFaBox ">
      <div class="paddingBox">
        <div class="checkTime">
          <div class="fl">
            <!-- <p class="f_1_p">星期三</p> -->
            <p class="f_2_p">{{$route.query.start}}</p>
          </div>
          <div class="fr">
            <!-- <p class="f_1_p">星期三</p> -->
            <p class="f_2_p">{{$route.query.end}}</p>
          </div>
        </div>
        <div class="timeBt">
          <span>入住时间</span>
          <span class="fr">{{$route.query.day}}晚</span>
        </div>
        <div class="ocpantBox"></div>
        <!-- <router-link to="add"> -->
          <div class="addBtn">
            <van-button @click="setError">添加入住人</van-button>
          </div>
        <!-- </router-link> -->
        <div class="clearfix">
          <div>
            <p class="d_1_p">预订人： {{userInfo.nickName}}</p>
            <p class="d_2_p">+86 {{userInfo.phone}}</p>
          </div>
        </div>  
      </div>
    </div> 
    <!--  -->
    <!--  -->
    <div class="price_detail">
      <div class="padding_b">
        <div class="padding_lr">
          <div class="costItem ">
            <span class="fl ">代金券</span>
            <span class="fr">
              - 
              <span class="fr fr_1">¥ 15.00<van-icon name="arrow" /></span>
              <span class="fr"></span>  
            </span>
          </div>
        </div>
        <div class="padding_lr">
          <div class="costItem ">
            <span class="fl ">开具发票</span>
            <span class="fr">无需发票<van-icon name="arrow" />  
            </span>  
          </div>
        </div>
        <div class="padding_lr">
          <div class="costItem ">
            <span class="fl ">押金</span>
            <span class="fr fr_2">不收取押金<van-icon name="arrow" /></span>  
          </div>
        </div>
        <div class="payMoneyBox">
          <div class="payMoney fl">
            <p>需在线支付</p>
            <p class="conMoney">¥
              <sapn>{{$route.query.price}}</sapn>
            </p> 
          </div>
          <div class="fr exempted">
            <div class="iconfont">
              查看明细
              <van-icon name="arrow" />
            </div>
          </div>
        </div>
      </div>
    </div> 
    <!--  -->
    <!--  -->
    <div>
      <div class="price_detail">
        <div class="padding_b">
          <div class="rulesDetailBox">
            <div class="rules ruleMrg">
              <p class="ruleName">退订规则</p>
              <div class="ruleDetail ">
                <span>10月21日14:00前取消，所有金额全部退还10月21日14:00后取消，扣除未入住首日房费</span>  
              </div>
            </div>
            <div class="ruleMrg">
              <p class="ruleName">入住规则</p>
              <div class="ruleDetail">
                <span>请添加全部入住人信息,不允许做饭,不允许带宠物,允许聚会,允许吸烟,接待境外人士,宜居2人，不允许加客
                </span>  
              </div>
            </div>
          </div>
        </div>  
      </div>
      <div class="padding_b bottomPadding ">
        <div class="ConctetRule rulColor">
          我同意
          <a href="#">《小猪服务协议》</a>
          <a href="#">《房客规则》</a>
          <a href="#">《住宿旅行意外险告知书》</a>
          及房东规定的退订规则及入住要求。
        </div>
      </div>
        <div class="padding_b subimt">
          <van-button type="default" size="large" class="button" @click="setError">
            提交订单
            <span>¥{{$route.query.price}}</span>
          </van-button>
        </div>   
    </div>
    <!--  -->  
  </div>
</template>
<script>
	import { getHouseInfo } from 'network/index.js'
	import { mapState } from 'vuex'
	export default {
		data(){
			return{
				house: {}
			}
		},
		computed:{
			...mapState(['userInfo'])
		},
		methods:{
			setError(){
				this.$toast('暂不支持')
			}
		},
		created(){
			getHouseInfo(this.$route.query.rid).then(res=>{
				this.house = res.data
			})
		}
	}
</script>
<style scoped>
.left>>> .van-icon{
  color:#212121 !important;
}
.van-hairline--bottom{
  border-bottom:0.266vw solid #e8e8e8;
}
.mag_top{
  margin-top:1.5rem;
}
.van-button--default{
  font-weight:700;
  color:#eb5381 ;
  font-size:0.373333rem ;
  border:0.266vw solid #eb5381 ;
}
.padding_box{
  height:2.4rem;
  margin:0.4rem 0;
  padding:0 0.4rem;
}
.min_box{
  position:relative;
}
.min_box div{
  position:absolute;
}
.min_box span{
  position:absolute;
  left:3.84rem;
  color: #212121;
  font-size:0.426667rem;
  line-height: 1.5;
  font-weight: 700;
}
.min_box img{
  width:3.2rem;
  height:2.4rem;
}
.xzBgFa{
  border-top:0.266vw solid #e8e8e8;
}
.bgFaBox{
  background-color:#fafafa;
  overflow: hidden;
  /* margin-bottom:10rem; */
}
.paddingBox{
  padding:0 0.24rem;
}
.checkTime{
  overflow: hidden;
  padding:20px 0;
}
.fl{
  float:left;
}
.f_1_p{
  font-size:.32rem;
  margin-bottom:0.266rem;
}
.f_2_p{
  font-size:0.533rem;
  font-weight:700;
}
.fr{
  text-align: right;
  float:right;
}
.fr:after{
  content: ".";
  clear: both;
  display: block;
  overflow: hidden;
  font-size: 0;
  height: 0;
}
.timeBt{
  padding:0.346rem 0.213rem;
  background:#ff4081;
  border-radius:0.133rem;
  font-size:0.3733rem;
  font-weight:700;
  color:#fff;
}
.ocpantBox{
  margin:20px 0 0;
  border-bottom:0.266vw solid #e8e8e8;
}
.addBtn{
  padding-top:0.533rem;
}
.clearfix{
  margin-top:.133333rem;
  padding:0.48rem 0;
}
.d_1_p{
  font-size: .373333rem;
  color: #212121;
  font-weight: 700;
  overflow: hidden;
}
.d_2_p{
  color: #757575;
  font-size: .32rem;
  margin-top: .153333rem;
  font-weight: 700;
}
p:after{
  content: ".";
  clear: both;
  display: block;
  overflow: hidden;
  font-size: 0;
  height: 0;
}
.price_detail{
  margin-top: .266667rem;
  padding: .666667rem 0;
  overflow: hidden;
  background:#fafafa
}
.padding_b{
  padding:0 0.4rem;  
}
.padding_lr{
  padding:0.4rem;
  overflow: hidden;
  border-radius: .106667rem;
  border:0.266vw solid #e8e8e8;
  background: white;
  margin-bottom: .213333rem;  
}
.padding_b span{
  font-size: .373333rem;
  color: #212121;
  display: block;
}
.fr_1{
  margin-left:0.1rem;
}
.payMoneyBox{
  padding-left: .4rem;
  margin-top: .666667rem;
}
.payMoney{
  font-size: .373333rem;
  color: #eb5381;
  font-weight: 700;
}
.conMoney{
  font-size: .533333rem;
  margin-top: .133333rem;
}
.exempted{
  position: relative;
  top: .4rem;
  right: .4rem;
  color: #212121;
}
.iconfont{
  color:#ccc;
  font-family: iconfont!important;
  font-size: .373333rem;
  font-style: normal;
  line-height:0.37rem;
}
.ruleBox{
  margin-top: .266667rem;
  padding: 0.4rem 0;
}
.rulesDetailBox{
  display:flex;
  align-items: center;
  justify-content: space-between;
}
.rules{
  margin-right: .213333rem;
}
.ruleMrg{
  background: #faf4f6;
  padding: .533333rem .266667rem;
  width: 4.533333rem;
  height: 3.2rem;
  overflow: hidden;
  box-sizing: border-box;
}
.ruleName{
  font-size: .426667rem;
  color: #212121;
}
.ruleDetail{
  margin-top: 0.266667rem;
  overflow: hidden;
  -webkit-line-clamp: 3;
  -webkit-box-orient: vertical;
  display: -webkit-box;
  text-overflow: ellipsis;
  height: 1.49rem;
  line-height: 1.5;
}
.ruleDetail span{ 
  font-size: 0.32rem;
  color: #757575;
}
.bottomPadding{
  padding-bottom: 2.266667rem;
  background:#fafafa;
}
.ConctetRule{
  background: #faf4f6;
  margin-left: 0;
  color: #757575;
  line-height: 1.3;
  font-size:0.373333rem;
}
.rulColor{
  background:#fafafa;
}
a{
  text-decoration: none;
  color:#011111;
}
.button>>>van-button--default{
  border:0.266vw solid #e8e8e8;
}
.subimt{
  border-top:0.266vw solid #e8e8e8;
  position: fixed;
  bottom: 0;
  left: 0;
  width: 100%;
  padding: 0.4rem;
  background: #fff;
  box-sizing: border-box;
}
.subimt span{
  display:inline-block;
}

</style>