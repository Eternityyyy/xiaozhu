<template>
	<div class="wrap view">
		<div v-if="!ischoice && !isCity">
			<xz-nav-bar></xz-nav-bar>
			<div class="logo">
				<img src="~assets/img/logo.png" class="image">
			</div>
			<div class="shadow"></div>
			<div class="paddingBox">
				<div class="search-box">
					<div class="landBox">
						<div class="searchState clear first">
							<i class="iconfont icon-house fl">&#xe613;</i>
							<span class="fl weight state" @click="isCity = true">&nbsp;&nbsp;{{city}}</span>
						</div>
						<div class="searchState clear" @click="ischoice = true">
							<i class="iconfont icon-calendar">&#xe604;</i>
							<span class="state">
								&nbsp;&nbsp;{{formTime(begindate,true,'.')}}
							</span>
							<span class="state">
								-{{formTime(enddate,true,'.')}}
							</span>
							<span class="fr night">共{{day}}晚</span>
						</div>
					</div>
					<div class="landDetail weight clear">
						<i class="iconfont icon-location">&#xe755;</i>
						<span class="landmark">
							位置/地方/房源
							<input type="text" v-model="keyword">	
						</span>
					</div>
					<router-link :to="`/house?city=${city}&start=${formTime(begindate)}&end=${formTime(enddate)}&daycount=${day}`">
						<div class="searchBtn">查找房源</div>
					</router-link>
				</div>
			</div>
			<div class="searchLable">
				<div class="searchLable-box">
					<div class="lable">
						<img src="https://image.xiaozhustatic1.com/00,80,80/s,3,aaOP,80,80,1,1d69571c.png" alt="">
						<span>免聊速订</span>
					</div>
					<div class="lable">
						<img src="https://image.xiaozhustatic1.com/00,80,80/s,3,aaPH,80,80,1,ca9292c7.png" alt="">
						<span>一室一厅</span>
					</div>
					<div class="lable">
						<img src="https://image.xiaozhustatic3.com/00,80,80/s,3,aaQt,80,80,1,dd15ef0b.png" alt="">
						<span>近地铁</span>
					</div>
					<div class="lable">
						<img src="https://image.xiaozhustatic1.com/00,80,80/s,3,aaRf,80,80,1,2456a7ef.png" alt="">
						<span>好评推荐</span>
					</div>
				</div>
			</div>
			<div class="hotBox">
				<div class="recommenName weight">
					{{city}}热门名宿
				</div>
				<div class="roomBox">
					<div class="hotRoomBox" v-for="(item,i) in hlist" :key="i">
						<router-link :to="`/detail/${item.rid}`">
							<div class="imgBox">
								<img v-if="item.img_t[0]" :src="baseurl + item.img_t">
							</div>
							<div class="luInfo">
								<div class="luBox">
									<p class="luName">
										{{item.rName}}
									</p>
									<p class="type">{{item.houseTypeInfo}}·宜住{{item.guestNum}}人</p>
								</div>
								<div class="price">
									<span class="nowPrice">￥{{item.lowerPrice}}</span>
									<span class="gray">起/晚</span>
								</div>
							</div>
						</router-link>
					</div>
				</div>
			</div>
			<div class="paddingBox">
				<div class="more">
					更多{{city}}优质房源
				</div>
			</div>
			<div class="bottom-record">
				<span>关于小猪</span>
				<span>客服电话：400-010-7890</span>
				<span>营业执照号103613118</span>
				<span>许可证号：京ICP证140510号</span>
				<span>京ICP证12035936号-1</span>
				<span>京公安网安备11010802020380号</span>
			</div>
		</div>
		<div class="cover xzWrapper div" v-if="ischoice==true">
			<div class="calendarHeaderTop">
				<div class="close-icon">
					<!-- <i type="closeempty" @click="ischoice = false"></i> -->
					<van-icon name="clear" color="#ccc" size=".746667rem" @click="ischoice = false"/>
				</div>
				<div class="calendar-head">
					<div class="calendar-head-box">
						<p class="calendar-head-title">选择入住离开日期</p>
					</div>
				</div>
				<div class="confirmbtn">
					<div class="confirmBtn" @click="confirm">确认</div>
				</div>
			</div>
			<calendar 
			:is-show="true" 
			:start-date="startDate" 
			:end-date="endDate" 
			mode="2" 
			@callback="getDate" 
			:between-start="startDate" 
			:between-end="endDate"
			:is-fixed="false"
			theme-color="#ff4081"
			/>
		</div>
		<van-list v-if="isCity">
			<van-cell v-for="item in citys" :key="item" :title="item.aName" @click="choiceCity(item.aName)"/>
		</van-list>
	</div>
	</template>

<script>
	import Calendar from 'components/Calendar/Calendar.vue'
	import XzNavBar from 'components/header/XzNavBar.vue'
	import { getHotHoust,getCitys } from 'network/index.js'
	export default {
		components:{
			Calendar,
			XzNavBar
		},
		data() {
			return {
				city:'锦江区',
				begindate: new Date(),
				enddate: new Date((new Date()).setDate((new Date()).getDate() + 1)),
				selectStartDate: '',
				selectEndDate:'',
				ischoice:false,
				isCity:false,
				day:1,
				selectDay: 0,
				hlist:[],
				citys: [],
				keyword:''
			}
		},
		watch:{
			city(){
				this.getHotHouse()
			}
		},
		methods: {
			getDate(date){
				console.log(date)
				console.log(this.formTime(date.startStr.dateStr))
				this.selectStartDate = this.formTime(date.startStr.dateStr,false,'.')
				this.selectEndDate = this.formTime(date.endStr.dateStr,false,'.')
				this.selectDay = date.dayCount
			},
			confirm(){
				this.begindate = this.selectStartDate;
				this.enddate = this.selectEndDate;
				this.day = this.selectDay;
				this.ischoice = false
			},
			choiceCity(aname){
				this.city = aname;
				this.isCity = false;
			},
			getHotHouse(){
				console.log(this.city)
				getHotHoust({city:this.city}).then(res=>{
					console.log(res.data)
					this.hlist = res.data
				})
			}
		},
		created(){
			this.getHotHouse()
			getCitys().then(res=>{
				this.citys = res.data
			})
		}
	}
</script>

<style lang="less" scoped>
	.weight{
		font-weight: 700;
	}
	.logo{
		height: 1.066667rem;
		margin-bottom: .133333rem;
		text-align: center;
		img{
			height: 100%;
		}
	}
	.shadow{
		height: .26667rem;
		width: 100%;
		position: relative;
		z-index: 10;
		border: none;
	}
	.shadow::after{
		content: '';
		width: 100%;
		height: .53333rem;
		position: absolute;
		border: none;
		left: 0;
		top: 0;
		z-index: -1;
		border-radius: 0 0 50% 50%;
		background: #fff;
		box-shadow: 0 0.266667rem 0.4rem 0 rgba(255,95,122,.07);
	}
	.paddingBox{
		padding: 0 .4rem;
		.search-box{
			padding: .5333rem;
			box-sizing: border-box;
			width: 100%;
			background: #fff;
			box-shadow: 0 .05333rem .266667rem 0 rgba(0,0,0,.1);
			border-radius: 0 0 .426667rem;
			margin-bottom: .746667rem;
			.iconfont{
				font-size: .48rem;
				font-weight: 400;
				position: relative;
			};
			.landBox{
				padding: .4rem 0;
				border-bottom: .026667rem solid #eee;
				.iconfont{
					top: 0.116667rem;
					margin-right: .12rem;
				}
			};
			.searchState{
				font-size: .426667rem;
				color: #212121;
				margin-top: .4rem;
				.state{
					position: relative;
					top: .106667rem;
				};
				.fr{
					font-size: .32rem;
				};
			};
			.first{
				margin-top: 0;
				border-bottom: .026667rem solid #eee;
				padding-bottom: .4rem;
				span{
					margin-left: .12rem;
				}
			};
			.night{
				position: relative;
				top: .16rem;
			};
			.landDetail{
				font-size: .426667rem;
				margin-top: .373333rem;
				position: relative;
				color: #bdbdbd;
				
				.landmark{
					width: 85%;
					white-space: nowrap;
					overflow: hidden;
					display: inline-block;
					position: absolute;
					text-overflow: ellipsis;
					top: .08rem;
					margin-left: .266667rem;
					input{
						position: absolute;
						left: 0;
						top: 0;
						border: 0;
						background: transparent;
						outline: none;
					}
				}
			};
			.searchBtn{
				background: #ff5f7a;
				margin-top: .37333rem;
				height: 1.2rem;
				line-height: 1.2rem;
				box-shadow: 0.053333rem 0.266667rem 9 rgba(0,0,0,.1);
				border-radius: .66667rem;
				font-size: .426667rem;
				color: #fff;
				letter-spacing: 0;
				text-align: center;
			}
		}
	}
	.searchLable .searchLable-box{
		display: flex;
		justify-content: space-between;
		flex-direction: row;
		flex-wrap: wrap;
		padding: 0 1.066667rem .8rem;
		.lable{
			text-align: center;
			img{
				width: 1.06667rem;
			};
			span{
				display: block;
				margin-top: .106667rem;
				font-size: .373333rem;
			}
		}
	}
	.hotBox{
		width: 100%;
		padding: 0 .4rem .266667rem;
		box-sizing: border-box;
		.recommenName{
			font-size: .48rem;
			color: #212121;
			margin-bottom: .266667rem;
		};
		.roomBox{
			display: flex;
			flex-wrap: wrap;
			justify-content: space-between;
		};
		.hotRoomBox{
			width: 4.48rem;
			height: 6.773333rem;
			background: #fff;
			border-radius: .266667rem;
			box-shadow: 0 0.053333rem 0.266667rem 0 rgba(0,0,0,.1);
			overflow: hidden;
			margin-bottom: .26667rem;
			.imgBox{
				width: 100%;
				height: 4rem;
				border: .05333rem solid #fff;
				overflow: hidden;
				position: relative;
				img{
					width: 100%;
					height: 100%;
					border-radius: .213333rem;
				};
				.tags{
					position: absolute;
					bottom: .26667rem;
					left: .13333rem;
				}
			};
			.luInfo{
				padding: .213333rem .16rem;
				.luBox{
					height: 1.6rem;
				};
				.luName{
					font-size: .373333rem;
					font-weight: 7000;
					color: #212121;
					width: 100%;
					overflow: hidden;
					// display: box;
					text-overflow: ellipsis;
					line-height: 1.4;
					line-clamp: 2;
				};
				.type{
					padding: .106667rem 0;
					font-size: .32rem;
					color: #757575;
				};
				.nowPrice{
					font-size: .48rem;
					color: #ff5f7a;
				}
				.gray{
					font-size: .32rem;
					color: #bdbdbd;
				}
			}
		}
	}
	.paddingBox{
		padding: 0 .4rem;
		.more{
			width: 100%;
			height: 1.3333rem;
			line-height: 1.33333rem;
			background: #fff;
			color: #212121;
			font-size: .373333rem;
			border: .026667rem solid #e0e0e0;
			text-align: center;
			border-radius: .213333rem;
		}
	}
	.bottom-record{
		background: #f5f5f5;
		padding: .32rem .4rem .106667rem;
		display: flex;
		flex-wrap: wrap;
		margin-top: .53333rem;
		span{
			font-size: .32rem;
			color: #757575;
			height: .32rem;
			margin-bottom: .21333rem;
		}
	}
	.bottom-record span:first-of-type{
		margin-right: .93333rem;
	}
	.bottom-record span:nth-of-type(2){
		margin-right: .53333rem;
	}
	.bottom-record span:nth-of-type(3),.bottom-record span:nth-of-type(5){
		margin-right: .66667rem;
	}
	.calendarHeaderTop{
		padding: 0 .4rem;
	}
	.close-icon{
		padding: .26667rem 0;
	}
	.calendar-head{
		width: 100%;
		height: 1.333rem;
	}
	.calendar-head-box{
		width: 100%;
		height: 1.3333rem;
		display: flex;
		justify-content: space-between;
		align-items: center;
		p{
			font-size: .53333rem;
			width: 50%;
		}
	}
	.confirmbtn{
		position: fixed;
		bottom: 0;
		padding: .4rem 0;
		text-align: center;
		background: #fff;
		box-sizing: border-box;
		width: 9.2rem;
		z-index: 1000;
		border-radius: .53333rem;
		.confirmBtn{
			height: 1.066667rem;
			color: #fff;
			line-height: 1.066667rem;
			background: #ff4081;
			font-size: .4rem;
			font-weight: 700;
			border-radius: .5333rem;
		}
	}
	
</style>