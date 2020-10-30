<template>
	<div class="house-list">
		<xz-nav-bar :title="query.city">
			<van-icon name="arrow-left" @click="$router.go(-1)"/>
		</xz-nav-bar>
		<div class="result-head">
			<div class="search-box">
				<span class="iconfont icon-search">&#xe600;</span>
				<input type="text" class="search-input" placeholder="位置/地名/房源" @keyup.enter="setKeyword" v-model="keyword">
			</div>
			<div class="result-calendar-box">
				<div class="search-item">
					<span class="name">{{formTime(query.start,true,'.')}} - {{formTime(query.end,true,'.')}}</span>
					<span class="rotate">
						<i class="iconfont">&#xe618;</i>
					</span>
				</div>
			</div>
		</div>
		<div class="result-select is-center">
			<ul class="search-condition">
				<li class="search-item">
					<span class="name" @click="isLocation = true">{{sightActive}}</span>
					<span class="rotate">
						<i class="iconfont">&#xe618;</i>
					</span>
					<van-popup v-model="isLocation" position="bottom" :style="{ height: '100%' }" >
						<van-list>
							<van-icon name="clear" size="0.64rem" @click="isLocation = false"></van-icon>
							<van-cell v-for="(item,i) in sights" :key="i" :title="item.lname" @click="choiceSight(item.lid,item.lname)"/>
						</van-list>
					</van-popup>
				</li>
				<!-- <li class="search-item">
					<span class="name">更多筛选</span>
					<span class="rotate">
						<i class="iconfont">&#xe618;</i>
					</span>
					<van-popup v-model="isCon" position="bottom" :style="{ height: '100%' }" >
						
					</van-popup>
				</li> -->
				<li class="search-item">
					<span class="name" @click="isOrder = true">{{orderActive}}</span>
					<span class="rotate">
						<i class="iconfont">&#xe618;</i>
					</span>
					<van-popup v-model="isOrder" position="bottom" :style="{ height: '100%' }" >
						<van-list>
							<van-icon name="clear" size="0.64rem" @click="isOrder = false"></van-icon>
							<van-cell v-for="(item,i) in orderway" :key="i" :title="item.title" @click="choiceOrder(item.title,item.order,item.orderway)"/>
						</van-list>
					</van-popup>
				</li>
			</ul>
		</div>
		<list-container :hlist="hlist"></list-container>
	</div>

</template>

<script>
	import { getHouse,getSight } from 'network/index.js'
	import ListContainer from './ListContainer.vue'
	import XzNavBar from 'components/header/XzNavBar.vue'
	export default {
		name:'',
		components:{
			XzNavBar,
			ListContainer
		},
		data(){
			return{
				hlist:[],
				query:{},
				isCanlendar: false,
				isLocation: false,
				isCon:false,
				isOrder:false,
				sights: [],
				sightActive:'景点',
				orderActive: '推荐排序',
				orderway: [{
					title: '推荐排序',
					order:'commentScore',
					orderway: 'ASC'
				},{
					title: '好评排序',
					order:'commentScore',
					orderway: 'ASC'
				},{
					title: '价格 高-低',
					order:'lowerPrice',
					orderway: 'DESC'
				},{
					title: '价格 低-高',
					order:'lowerPrice',
					orderway: 'ASC'
				},],
				keyword:''
			}
		},
		watch:{
			sightActive() {
				this.getHouse(this.query)
			},
			orderActive(){
				this.getHouse(this.query)
			}
		},
		methods:{
			getHouse(params){
				console.log(params)
				getHouse(params).then(res=>{
					console.log(res.data)
					this.hlist = res.data
				})
			},
			choiceSight(id,name){
				console.log(id)
				this.query.landid = id
				this.isLocation = false
				this.sightActive = name
			},
			choiceOrder(title,order,way){
				this.orderActive = title;
				this.query.order = order;
				this.query.orderway = way;
				this.isOrder = false;
			},
			setKeyword(){
				console.log('shouwuo')
				this.query.keyword = this.keyword
				this.getHouse(this.query)
			}
		},
		created(){
			console.log(this.$route.query)
			this.query = this.$route.query;
			// this.city = this.$route.query.city
			this.getHouse(this.$route.query);
			getSight().then(res=>{
				this.sights = res.data
			})
		}
	}
</script>

<style lang="less" scoped>
	.result-head{
		position: relative;
		display: flex;
		justify-content: space-between;
		align-items: center;
		padding: 0 .4rem;
		background: #fff;
		box-shadow: none;
		box-sizing: border-box;
		.search-box{
			position: relative;
			flex: 1;
			height: .9066667rem;
			line-height: .906667rem;
			box-sizing: border-box;
			background: #f5f5f5;
			border-radius: .4266667rem 0 0 .426667rem;
			text-align: left;
			padding: 0 .85333rem 0 .8rem;
			.icon-search{
				position: absolute;
				top: .1866667rem;
				left: .266667rem;
				line-height: 1;
				color: #bdbdbd;
				font-size: .48rem;
			};
			.search-input{
				vertical-align: top;
				height: .853333rem;
				line-height: .85333rem;
				width: 100%;
				display: inline-block;
				font-size: .32rem;
				border: 0;
				background: transparent;
				text-align: left;
				box-sizing: border-box;
			}
		};
		.result-calendar-box{
			padding: 0 .213333rem;
			margin-left: .08rem;
			height: .906667rem;
			background: #f5f5f5;
			border-radius: 0 .426667rem .426667rem 0;
			flex: 0 0 auto;
			display: inline-flex;
			.search-item{
				margin-right: 0;
				font-size: .373333rem;
				display: flex;
				align-items: center;
				flex: 0 0 auto;
				.name{
					display: inline-block;
					font-weight: unset !important;
					border-bottom: none;
					margin-right: .05333rem;
				};
				.rotate{
					display: inline-block;
					color: #d9d9d9;
					.iconfont{
						color: #e0e0e0;
						font-size: .266667rem;
					}
				}
			}
		};
	}
	.result-select{
		display: flex;
		padding: .32rem .4rem .5333rem;
		font-size: .373333rem;
		overflow-x: scroll;
	}
	.result-select.is-center{
		justify-content: center;
	}
	.search-condition{
		flex: 0 0 auto;
		display: inline-flex;
		background: #fff;
	}
	.result-select.is-center .search-condition{
		margin-right: -0.426667rem;
	}
	.search-condition .search-item{
		display: flex;
		align-items: center;
		flex: 0 0 auto;
		margin-right: .4rem;
		.name{
			max-width: 1.6rem;
			overflow: hidden;
			text-overflow: ellipsis;
			display: -webkit-box;
			line-clamp: 1;
		}
		.rotate{
			display: inline-block;
			color: #d9d9d9;
		}
	}
</style>
