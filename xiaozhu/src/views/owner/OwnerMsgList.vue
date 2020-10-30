<template>
	<div class="msg-list chatBody">
		<div class="msg-list-container" v-if="msglist">
			<van-swipe-cell v-for="(item,i) in msglist" :key="i">
				<van-cell is-link :to="`/owner/chat?chatid=${i}&uid=${item.User.id}`">
					<!-- 使用 title 插槽来自定义标题 -->
					<template #title>
						<div class="msg-list-item">
							<img :src="item.User.avatar ? item.User.avatar : '/default.png'" alt="">
							<div class="msg-last">
								<span>{{item.User.phone}}</span>
								<p v-html="item.Message"></p>
							</div>
						</div>
					</template>
				</van-cell>
				<template #right>
					<!-- <router-link :to="`/chat?chatid=u${item.User.id}o${item.Owner.oid}`"> -->
					<van-button square text="删除" type="danger" class="delete-button"></van-button>
				</template>
			</van-swipe-cell>
		</div>
		<div class="no-message" v-else>
			<img src="~assets/img/imv2_message_empty.png">
			<p class="imv2-message-empty-p"></p>
		</div>
	</div>

</template>

<script>
	import { getMsgList } from 'network/index.js'
	export default {
		name:'OwnerMsgList',
		data(){
			return {
				msglist: null
			}
		},
		created(){
			getMsgList({oid: '1'}).then(res=>{
				console.log(res.data)
				if(res.data.length > 0){
					this.msglist = {}
				}
				res.data.forEach(item=>{
					this.msglist[item.chatId] = item
				})
			})
		}
	}
</script>

<style lang="less" scoped>
	.msg-list-item{
		img{
			width: 1.2rem;
			height: 1.2rem;
			border-radius: 50%;
			float: left;
			margin-right: .5rem;
		}
		span{
			font-weight: 700;
		}
	}
	.no-message img{
		width: 60%;
		display: block;
		margin: 40% auto .4rem;
	}
	.no-message p{
		font-size: .373333rem;
		font-weight: 700;
		text-align: center;
		color: #212121;
	}
</style>

