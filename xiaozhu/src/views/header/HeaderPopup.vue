<template>
	<div class="logreg-ul">
		<ul v-if="userInfo">
			<router-link to='/'>
				<li>
					<i class="iconfont">&#xe600;</i>
					<span>首页</span>
				</li>
			</router-link>
			<router-link to='/'>
				<li>
					<i class="iconfont">&#xe600;</i>
					<span>订单</span>
				</li>
			</router-link>
			<router-link to='/msg'>
				<li>
					<i class="iconfont">&#xe600;</i>
					<span>消息</span>
				</li>
			</router-link>
			<router-link to='/user'>
				<li>
					<i class="iconfont">&#xe600;</i>
					<span>个人中心</span>
				</li>
			</router-link>
		</ul>
		<ul v-else>
			<router-link to="/login">
				<li>
					<i class="iconfont">&#xe605;</i>
					<span>登录</span>
				</li>
			</router-link>
			<router-link to="/register">
				<li>
					<i class="iconfont">&#xe605;</i>
					<span>注册</span>
				</li>
			</router-link>
		</ul>
		<i class="home"></i>
	</div>

</template>

<script>
	import { mapState } from 'vuex'
	export default {
		name:'',
		data(){
			return {
				
			}
		},
		computed:{
			...mapState(['userInfo'])
		}
	}
</script>
<style lang="less" scoped>
	.logreg-ul{
		padding: .4rem;
		z-index: 1000;
		width: 4.8rem;
		top: 0;
		right: 0;
		bottom: 0;
		background: #fff;
		box-sizing: border-box;
		ul{
			width: 2.13333rem;
			margin: 0 auto;
			padding-top: 1.12rem;
			li{
				height: 2.66667rem;
				border-bottom: .026667rem solid #ebebeb;
				width: 2.13333rem;
				text-align: center;
				margin-bottom: .266667rem;
				padding-top: .53333rem;
				color: #212121;
				position: relative;
				i{
					display: inline-block;
					font-size: .64rem;
				};
				span{
					display: inline-block;
					width: 2.13333rem;
					height: 2.13333rem;
					font-size: .4533333rem;
					margin-top: .08rem;
				}
			}
		};
		.home{
			position: absolute;
			bottom: .4rem;
			left: 50%;
			margin-left: -.706667rem;
			display: block;
			width: 1.493333rem;
			height: .7466667rem;
			background: url(~assets/img/popupxiaozhu.png);
			background-size: 100% 100%;
			margin-left: .226667rem;
		}
	}
</style>
