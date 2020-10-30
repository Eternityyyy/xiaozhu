<template>
	<div class="list-con">
		<div class="list-item clear carnival_item" v-for="(item) in Hlist" :key="item.rid">
			<router-link :to="`/detail/${item.rid}`">
				<div class="carnival_item_top">
					<img v-lazy="baseurl + item.img_t">
				</div>
				<div class="carnival_item_bottom">
					<div class="box">
						<h5 class="title">
							{{item.rName}}
						</h5>
						<p>{{item.leaseType}} · {{item.houseTypeInfo}} · {{item.bedNum}}张床 · 宜住{{item.guestNum}}人</p>
						<div class="tags">
							<span>{{item.Titles.tname}}</span>
						</div>
					</div>
					<span class="landlordheadimg"><img v-lazy="item.Owner.oImg ? baseurl + item.Owner.oImg : '/default.png'"></span>
					<div class="price">
						<span class="num">¥{{item.lowerPrice}}</span>
						<span class="txt">起/晚</span>
					</div>
				</div>
			</router-link>
		</div>
	</div>

</template>

<script>
	export default {
		name:'ListContainer',
		props:['hlist'],
		computed:{
			Hlist(){
				return this.hlist || {Titles:[{}],owner:{}}
			}
		}
	}
</script>

<style lang="less" scoped>
	.carnival_item img{
		width: 100%;
	}
	.carnival_item_top{
		position: relative;
		line-height: 0;
		img{
			width: 100%;
			min-height: 5.06667rem;
		}
	}
	.carnival_item_bottom{
		position: relative;
		padding: .4rem;
		.title{
			max-width: 80%;
			line-height: .8rem;
			color: #323232;
			font-size: .5888887rem;
			overflow: hidden;
			text-overflow: ellipsis;
			display: box;
			line-clamp: 2;
		};
		.desc{
			margin-top: .106667rem;
			width: 100%;
			height: .4rem;
			color: #757575;
			font-size: .346667rem;
			white-space: nowrap;
			overflow-x: scroll;
			overflow-y: hidden;
		};
		.price{
			padding-top: .186667rem;
			.num{
				color: #ff4081;
				font-size: .53333rem;
			};
			.txt{
				color: #757575;
				font-size: .26667rem;
			}
		}
	}
	.tags{
		margin-top: .21333rem;
		span{
			font-size: .32rem;
			color: #720124;
		}
	}
	.landlordheadimg{
		position: absolute;
		right: .4rem;
		top: -0.66667rem;
		width: 1.444rem;
		height: 1.44rem;
		border-radius: 50%;
		background-color: #fff;
		img{
			width: 100%;
			height: 100%;
			border-radius: 50%;
		}
	}
</style>
