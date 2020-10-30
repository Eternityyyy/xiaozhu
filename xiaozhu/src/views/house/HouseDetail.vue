<template>
    <div id="room_detail">
        <!-- 导航栏 -->
       <!-- <van-nav-bar @click-left="onClickLeft" @click-right="onClickRight">
            <template #title>
                <span class="font-title">房间详情</span>
            </template> 
            <template #left>
                <i class="iconfont">&#xe71a;</i>
            </template>   
            <template #right>
                <i class="iconfont icon-two">&#xe60a;</i>
            </template>
        </van-nav-bar> -->
				<xz-nav-bar title="房间详情">
					<van-icon name="arrow-left" @click="$router.go(-1)"></van-icon>
				</xz-nav-bar>
        <!-- 轮播图片 -->
        <van-swipe class="my-swipe">
            <van-swipe-item  v-for="(image,index) of banners" :key="index">
                <img  v-lazy="baseurl + image.banner" />
                <span class="swiper-font">{{index + 1}}/{{banners.length}}</span>
            </van-swipe-item>
            <template #indicator>
                <div class="custom-indicator">
                </div>
            </template>
        </van-swipe>
        <!-- 详情区域 -->
        <div id="container">
            <div class="center_div">
                <!-- 标签 -->
                <div class="tags">
                    <span v-for="(tag,i) of tags" :key="i">
                        <img src="/house/icons/tag.png" alt="">
                        <span>{{tag.tname}}</span>
                    </span>
                </div>
                <!-- 标题 -->
                <div class="room-title">{{roomMessage.rName}}</div>
                <!-- 价格 -->
                <p class="price_all">
                    <span>￥</span>
                    <span>{{roomMessage.lowerPrice}}</span>
                    <span class="price_f">起/晚</span>
                </p>
                <!-- 出租类型、居住人数、房屋配备 -->
                <div class="infoBar">
                    <div class="icons_three">
                        <div class="icon-item">
                            <img src="/house/icons/house.png" alt="">
                            <p>{{roomMessage.leaseType}}</p>
                        </div>
                        <div class="icon-item">
                            <img src="/house/icons/people.png" alt="">
                            <p>宜住{{roomMessage.guestNum}}人</p>
                        </div>
                        <div class="icon-item">
                            <img src="/house/icons/bed.png" alt="">
                            <p>共{{roomMessage.bedNum}}张</p>
                        </div>
                    </div>
                    <div class="infoBar_explain">
                        <p>
                            <span>整套{{roomMessage.roomArea}}平方米</span>
                            <span>{{roomMessage.houseTypeInfo}}{{roomMessage.houseOtherInfo}}</span>
                        </p>
                    </div>
                </div>
                <!-- 房东头像信息 -->
                <img class="owner_img" :src="ownerMsg.oImg" alt="">
                <p class="o_nickname">{{ownerMsg.oNickname}}</p>
                <p class="identify">{{ownerMsg.identification ? '已实名认证' : '未实名认证'}}</p>
            </div>
            <!-- 房屋描述 -->
            <div class="desc_container">
                <!-- 展开收起组件 -->
                <my-expander position="left" height="3.6rem">
                    <p class="desc_title">房间描述</p>
                    <p class="desc_c">{{roomMessage.personDesc}}</p>
                    <p class="desc_lt">| 内部情况</p>
                    <p class="desc_c">{{roomMessage.roomDesc}}</p>
                    <p class="desc_lt">| 交通情况</p>
                    <p class="desc_c">{{roomMessage.traffic}}</p>
                </my-expander>
            </div>
            <!-- 房客点评 -->
            <div class="comment">
                <p class="desc_title">房客点评</p>
                <div class="showStar">
                    <div class='score'>
                        <my-star :starVal="score"></my-star>
                        <div class="comment-score">{{score}}</div>
                    </div>
                    <!-- 虚拟数据，写死的暂时---------------------- -->
                    <div class="comment-count">
                        <span class="comment-num">共18条点评</span>
                        <i class="iconfont icon-right">&#xe600;</i>
                    </div>
                </div>
                <p class="comment-f">团长大魔王</p>
                <p class="comment-d">2020-10-13入住</p>
                <p class="comment-c">还是很不错的体验，对于第一次入住民宿有很好的印象。在春熙路旁边，周边配套都很全，就是步行街的朋友过于热情，促销的大喇叭喊得响彻云霄，略影响睡眠质量</p>
                <div class="comment-more">
                    <span>查看全部18条点评</span>
                    <i class="iconfont icon-toright">&#xe644;</i>
                </div>
                <!-- 虚拟数据结束 ------------------------------------>
            </div>
            <!-- 房屋位置 -->
            <div class="location">
                <p class="desc_title">房屋位置</p>
                <div class="map">
                    <baidu-map class="bm-view" :center="center" :zoom="16" :scroll-wheel-zoom="true" ak="Nyv01G2E6VK050TLnvkwhnT9qqCYczvk">
                        <bm-marker :position="center" :dragging="true">
                            <bm-label :content="roomMessage.loaction" :labelStyle="{color: '#333', fontSize : '10px',border:'1px solid #000'}" :offset="{width: -100, height: 30}"/>
                        </bm-marker>
                    </baidu-map>
                </div>
                <p class="loca-f">
                    <i class="iconfont icon-location">&#xe604;</i>
                    <span>{{roomMessage.loaction}}</span>
                </p>
            </div>
            <!-- 日期选定 -->
            <!-- <div class="date-selector">
                <p class="desc_title">可租日期</p>
                <my-calendar mode="2"></my-calendar>  
            </div> -->
            <!-- 图片展示1 -->
            <div class="image_show">
                <img :src="baseurl + roomMessage.img_c">
            </div>
            <!-- 配套设施 -->
            <div class="eq">
                <p class="desc_title">配套设施</p>
                <ul class="equipment">
                    <li class="eq-item" v-for="(e,i) of equipment" :key="i">
                        <i class="iconfont" :class="e.eIcon" :style="{color: e.eHas ? '#000' : '#ccc'}"></i>
                        <span class="eq-t" :class="e.eHas ? 'active' : ''">{{e.eName}}</span>
                    </li>
                </ul>
            </div>
            <!-- 图片展示2 -->
            <div class="image_show">
                <img :src="baseurl + roomMessage.img_t">
            </div>
            <!-- 交易规则 -->
            <div class="order">
                <p class="desc_title">交易规则</p>
                <p class="rules_title margin_top">
                    <i class="iconfont icon-order">&#xe612;</i>
                    <span>预定方式</span>
                </p>
                <p class="rules_details">{{roomMessage.Rules && roomMessage.Rules[0].orderType}}</p>
                <p class="rules_title margin_top">
                    <i class="iconfont icon-day">&#xe6ea;</i>
                    <span>入住天数</span>
                </p>
                <p class="rules_details">{{roomMessage.Rules && roomMessage.Rules[0].days}}</p>
                <p class="rules_title margin_top">
                    <i class="iconfont icon-desipot">&#xe65b;</i>
                    <span>在线订金比</span>
                </p>
                <p class="rules_details">{{roomMessage.Rules && roomMessage.Rules[0].days}}</p>
                <p class="rules_title">
                    <span class="margin_l">押金</span>
                </p>
                <p class="rules_details">￥{{roomMessage.Rules && roomMessage.Rules[0].deposit}}</p>
                <p class="rules_title">
                    <span class="margin_l">清洁费</span>
                </p>
                <p class="rules_details">￥{{roomMessage.Rules && roomMessage.Rules[0].cleanPrice}}</p>
            </div>
            <!-- 入住贴士 -->
            <div class="tieshi">
                <p class="desc_title">入住贴士</p>
                <p class="rules_title margin_top">
                    <i class="iconfont icon-face">&#xe772;</i>
                    <span>入住须知</span>
                </p>
                <p class="rules_details">￥{{roomMessage.Rules && roomMessage.Rules[0].know}}</p>
            </div>

            <!-- 退订规则 -->
            <div class="cancel">
                <p class="desc_title">退订规则</p>
                <div class="cancel-container">
                    <p class="iconP">
                        <span class="cencel-clock">
                            <img src="/house/icons/clock.png" alt="">
                        </span>
                        10月23日14:00前取消，所有金额全部退还
                    </p>
                    <p class="iconP2">
                        <span class="cencel-clock">
                            <img src="/house/icons/clock.png" alt="">
                        </span>
                        10月23日14:00后取消，扣除未入住首日房费，以及剩余房费的20%</p>
                </div>
            </div>
            <div class="zhanwei"></div>
        </div>
        <my-calendar :isShow="calendarShow" :isFixed="true" mode="2" @callback="getDate" theme-color="#ff4081"></my-calendar>

        <!-- 底部房间购买 -->
        <div title="收藏" class="order-btn">
            <div>
                <span class="collect" @click="collectRoom" :style="{border: collectState ? '1px solid #ff4081' : '1px solid antiquewhite'}">
                    <i class="iconfont icon-collect" :style="{color: collectState ? '#ff4081' : 'antiquewhite'}">&#xe615;</i>
                </span>
                <span class="say" @click="sendMessage">
                    <i class="iconfont icon-say">&#xe63f;</i>
                </span>
            </div>
            <div class="sell-detail">
                <p class="total">￥{{totals}}</p>
                <p class="date">{{startDateShow}}-{{endDateShow}} 共{{days}}晚</p>
            </div>
            <div class="select-date" @click="changeDateShow">
                <i class="iconfont icon-date">&#xe72a;</i>
            </div>
            <div class="btn" @click="Order">立即预定</div>
        </div>
    </div>
</template>
<style scoped>
    .font-title {
        font-size: 0.426667rem;
        font-weight: 600;
        color: #333;
    }
    .my-swipe .van-swipe-item {
        position: relative;
        height: 6.666667rem;
        overflow: hidden;
    }
    .van-swipe-item>img{
        width: 100%;
    }
    .swiper-font {
        position: absolute;
        top: 6.133333rem;
        right: .4rem;
        color: #fff;
    }
    #container {
        background: #fff;
        margin: .266667rem .4rem 0;
    }
    .center_div {
        text-align: center;
        padding-bottom: .533333rem;

    }
    .tags {
        color: #999;
        text-align: left;
        white-space: nowrap;
        width: 100%;
        height: .853333rem;
        margin-left: -.053333rem;
    }
    .tags>span {
        display: inline-block;
        margin-right: .233333rem;
        font-size: .32rem;
        color: #720124;
    }
    .tags>span>img {
        width: .32rem;
        vertical-align: bottom;
        margin-right: .083333rem;
    }
    .room-title {
        font-size: .586667rem;
        color: #333;
        text-align: left;
        line-height: .8rem;
        font-weight: 400;
    }
    .price_all {
        font-size: .533333rem;
        text-align: left;
        color: #000;
        line-height: .533333rem;
        margin-top: .266667rem;
    }
    .price_f {
        font-size: .266667rem;
        color: #757575!important;
        margin-top: -.053333rem;
        text-align: center;
        margin-left: .09333rem;
    }
    .infoBar {
        margin: .533333rem 0;
        width: 100%;
        background: #ececec;
        border-radius: .08rem;
    }
    .icons_three {
        display: flex;
        background-color: #f5f5f5;
        height: 2.4rem;
        font-weight: 600;
    }
    .icon-item {
        flex: 1 0 auto;
        padding-top: .4rem;
        position: relative;
    }
    .icon-item>img {
        width: 1.066667rem;
        margin-bottom: .133rem;
    }
    .infoBar_explain {
        padding: .4rem 0;
    }
    .infoBar_explain>p {
        font-size: .373333rem;
        line-height: .533333rem;
    }
    .infoBar_explain>p>span:first-child {
        margin-right: .2333rem;
    }
    .owner_img {
        width: 1.6rem;
        height: 1.6rem;
        border-radius: .8rem;
    }
    .o_nickname {
        font-size: .48rem;
        color: #333;
        padding: .266667rem  .08rem;
        font-weight: 600;
        line-height: .533333rem;
    }
    .identifyc {
        color: #999;
        font-size: .373333rem;
        line-height: .533333rem;
    }
    .desc_container {
        border-top: .026667rem solid #eee;
        padding: .4rem 0;
    }
    .desc_title {
        font-size: .586667rem;
        color: #333;
        display: block;
        margin-bottom: .266667rem;
        font-weight: 600;
        margin-top: .266667rem;
    }
    .desc_c {
        font-size: .373333rem;
        line-height: .666667rem;
        margin-bottom: .266667rem;
    }
    .desc_lt {
        margin: .133333rem 0;
        color: #000;
        font-size: .373333rem;
        line-height: .533333rem;
        font-weight: 600;
    }
    .comment {
        border-top: .026667rem solid #eee;
        padding: .4rem 0;
    }
    .showStar {
        display: flex;
        justify-content: space-between;
        align-items: center;
        position: relative;
        margin-top: .373333rem;
        height: 1.333333rem;
        border-radius: .106667rem;
        background-color: #ffedcb;
    }
    .score {
        display: flex;
        align-items: center;
        margin-left: .4rem;
    }
    .comment-score {
        width: .933333rem;
        height: .533333rem;
        border-radius: .08rem;
        background-color: #ffd16f;
        color: #fff;
        font-weight: 700;
        line-height: .64rem;
        text-align: center;
        margin-left: .133333rem;
        font-size: .346667rem;
    }
    .comment-num {
        margin-right: .133333rem;
        color: #000;
    }
    .comment-count {
        margin-right: .4rem;
    }
    .comment-f {
        font-size: .373333rem;
        font-weight: 600;
        line-height: .666667rem;
        color: #000;
        margin-top: .333rem;
    }
    .comment-d {
        font-size: .303333rem;
        color: #666;
        line-height: .5rem;
    }
    .comment-c {
        height: 2.1333rem;
        font-size: .373333rem;
        color: #333;
        line-height: .533333rem;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 5;
        overflow: hidden;
    }
    .comment-more {
        color: #ff3c83!important;
        margin-bottom: .16rem;
        font-size: .373333rem;
        line-height: .613333rem;
    }
    .comment-more>span {
        vertical-align: top;
    }
    .location {
        border-top: .026667rem solid #eee;
        padding: .4rem 0;
        box-sizing: border-box;
    }
    .map {
        margin-top: .533333rem;
        height: 3.733333rem;
    }
    .bm-view {
        width: 100%;
        height: 3.733333rem;

    }
    .loca-f {
        font-size: .346667rem;
        color: #212121;
        padding-top: .4rem;
        line-height: .533333rem;
    }
    .loca-f>span {
        margin-left: .233rem;
    }
    .date-selector {
        border-top: .026667rem solid #eee;
        padding: .4rem 0;
    }
    .image_show {
        height: 4rem;
        overflow: hidden;
        position: relative;
        width: 100vw;
        left: -.4rem;
    }
    .image_show>img {
        width: 100%;
        position: relative;
        top: -.6rem;
    }
    .eq {
        border-top: .026667rem solid #eee;
        padding: .4rem 0;
    }
    .equipment {
        display: flex;
        flex-wrap: wrap;

        width: 100%;
        list-style: none;
        margin-top: .4rem;
    }
    .eq-item {
        flex-basis: 25%;
        height: 2.08rem;
        box-sizing: border-box;
        font-size: .32rem;
        color: #000;
        text-align: center;
    }
    .eq-t {
        display: block;
        margin: .13333rem auto;
        text-align: center;
        width: 100%;
        font-size: .343333rem;
        line-height: .533333rem;
        color: #999;
    }
    .eq-t.active {
        color: #000;
    }
    .order {
        border-top: .026667rem solid #eee;
        padding: .4rem 0;
    }
    .rules_title {
        font-size: .373333rem;
        line-height: .533333rem;
        color: #000;
    }
    .margin_top {
        margin-top: .533333rem;
    }
    .rules_title>span {
        vertical-align: top;
        line-height: .613333rem;
        font-weight: 700;
    }
    .rules_details {
        margin-left: .853333rem;
        margin-bottom: .266667rem;
        font-size: .373333rem;
        line-height: .533333rem;
    }
    .margin_l {
        margin-left: .853333rem;
    }
    .tieshi,.cancel {
        border-top: .026667rem solid #eee;
        padding: .4rem 0;
    }
    .cancel-container {
        color: #212121;
        font-weight: 400;
        padding: 0 0 0 .266667rem;
        font-size: .346667rem;
        border-radius: .106667rem;
        margin: .4rem 0;
    }
    .iconP {
        border-left: .266vw solid #212121;
        padding-bottom: .8rem;
        padding-left: .4rem;
        position: relative;
        font-size: .373333rem;
        line-height: .533333rem;
    }
    .iconP2 {
        border-left: none;
        padding-bottom: 0;
        font-size: .346667rem;
        padding-left: .4rem;
        line-height: .533333rem;
        position: relative;
    }
    .cencel-clock {
        background: #fff;
        width: .433333rem;
        height: .433333rem;
        display: block;
        box-sizing: border-box;
        position: absolute;
        left: -.226667rem;
        top: -.053333rem;
    }
    .cencel-clock>img {
        width: 100%;
    }
    .zhanwei {
        height: 1.333333rem;
    }
    .order-btn {
        display: flex;
        align-items: center;
        justify-content: space-between;
        position: fixed;
        height: 1.333333rem;
        background-color: #fff;
        color: #000;
        bottom: 0;
        width: 100%;
        border-top: .266vw solid #e0e0e0;
        box-shadow: 0 -0.053333rem 0.213333rem #eee;
        z-index: 999;
    }
    .collect {
        width: 1.013333rem;
        height: 1.013333rem;
        border: .266vw solid #e0e0e0;
        border-radius: 50%;
        margin-left: .4rem;
        text-align: center;
        line-height: 1.013333rem;
    }
    .say {
        width: 1.013333rem;
        height: 1.013333rem;
        
        margin-left: .4rem;
        text-align: center;
        line-height: 1.013333rem;
    }
    .sell-detail {
        text-align: center;
        margin-left: .5rem;
    }
    .total {
        color: #000;
        font-size: .533333rem;
        text-align: center;
        margin-left: -.08rem;
        line-height: .533333rem;
    }
    .date {
        color: #757575;
        font-size: .32rem;
        text-align: center;
        line-height: .533333rem;
    }
    .btn {
        font-size: .426667rem;
        background-color: #ff4081;
        border-radius: .8rem;
        color: #fff;
        font-weight: 500;
        float: right;
        padding: .16rem .293333rem .16rem;
        margin-right: .4rem;
    }
</style>
<script>
import MyExpander from 'components/detail/MyExpander'
import MyStar from 'components/detail/MyStar'
import { BaiduMap,BmMarker,BmLabel} from 'vue-baidu-map';
import MyCalendar from 'components/detail/Calendar'
import XzNavBar from 'components/header/XzNavBar.vue'
import { mapState } from 'vuex'

export default {
    components: {
        MyExpander,
        MyStar,
        BaiduMap,
        BmMarker,
        BmLabel,
        MyCalendar,
				XzNavBar
    },
    data() {
        return {
            roomMessage:{},               //房间所有详细信息
            banners:[],                   //轮播图    
            tags:[],                      //标签
            ownerMsg:{},                  //房东信息
            score:0,                      //评分
            center: {lng: 0, lat: 0},     //中心坐标
            equipment:[],                 //设备图标
            collectState: false,          //收藏状态，模拟     
            calendarShow: false,          //日历展开与否 
            startTime:'',
            endTime:'',
            startDateShow:'',
            endDateShow:'',
            days: 0,
            rules:{}
        }
    },
    computed:{
        totals() {
            return this.roomMessage.lowerPrice * this.days + this.rules.deposit + this.rules.cleanPrice;
        },
				...mapState(['userInfo'])
    },
    methods:{
        // start(s) {
        //     this.startTime = s;
        //     this.startDateShow = this.moment(s).format("MM.D");
        // },
        // end(s) {
        //     this.endTime = s;
        //     this.endDateShow = this.moment(s).format("MM.D");
        // },
				getDate(date){
					console.log(date)
					console.log(this.formTime(date.startStr.dateStr))
					this.startDateShow = this.formTime(date.startStr.dateStr,true,'.')
					this.endDateShow = this.formTime(date.endStr.dateStr,true,'.')
					this.days = date.dayCount
				},
        // 向后台请求房间商品数据
        getRoomDetails() {
            let id = this.$route.params.id;
            this.axios.get('/house/detail/' + id).then(res => {
                this.roomMessage = res.data;
                this.banners = res.data.RoomImgs;
                this.tags = res.data.Titles;
                this.ownerMsg = res.data.Owner;
                this.score = res.data.commentScore;
                this.center.lng =  this.roomMessage.longitude;
                this.center.lat = this.roomMessage.latitude;
                this.rules = this.roomMessage.Rules[0];
                //获取设备图标并对其按照是否拥有进行排序
                let arr = res.data.Equipment;
                let arrHas = [];
                let arrNot = [];
                arr.forEach(el => {
                    el.eIcon = 'icon-' + el.eIcon;
                    if (el.eHas) {
                        arrHas.push(el);
                    } else {
                        arrNot.push(el);
                    }
                })
                this.equipment = arrHas.concat(arrNot);
                console.log(res.data);
                
            });
        },
        //点击导航栏左侧图标，返回上一页
        onClickLeft() {
            this.$router.go(-1);
        },
        //点击导航栏右侧图标，弹出菜单选项
        onClickRight() {
            console.log("弹出菜单");
        },
        //改变收藏状态
        collectRoom() {
            //模拟，不真实
            this.collectState = !this.collectState;
        },
        //改变日历出现与否
        changeDateShow() {
            this.calendarShow = !this.calendarShow;
        },
				sendMessage(){
					if(this.userInfo){
						this.$router.push({path: `/msg/chat?chatid=u${this.userInfo.id}o${this.ownerMsg.oid}&oid=${this.ownerMsg.oid}&day=${this.days}`})
					}else{
						this.$router.push('/login')
					}
				},
				Order(){
					if(this.userInfo){
						this.$router.push({path: `/order?rid=${this.$route.params.id}&price=${this.totals}&start=${this.startDateShow}&end=${this.endDateShow}`})
						// this.$router.push({path: `/order?=${this.userInfo.id}&oid=${this.ownerMsg.oid}`})
					}else{
						this.$router.push('/login')
					}
				},
				sub(){
					if(this.userInfo){
						// this.$router.push({path: `/order?=${this.userInfo.id}&oid=${this.ownerMsg.oid}`})
						// this.$router.push({path: `/order?rid=${this.$route.params.id}&price=324`})
					}else{
						this.$router.push('/login')
					}
				}
        
    },
    created() {
        this.getRoomDetails();
    },
    watch: {
        endTime() {
            this.days = this.moment(this.endTime).diff(this.moment(this.startTime),'day');
        }
    }
}
</script>