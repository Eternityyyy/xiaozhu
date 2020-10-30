<template>
  <div class="chat" :class="{scroll: display}">
		<div class="msg-box clear">
			<div class="msg-item" v-for="(item,i) in msglist" :key="i" :class="item.userType">
				<div class="msg-avator-box">
					<img :src="item.senderAvatar ? item.senderAvatar : '/fire.png'">
				</div>
				<div class="msg-info">
					<div class="msg-user-name">{{item.senderNickName}}</div>
					<div class="msg-content" v-html="item.Message"></div>
				</div>
			</div>
		</div>
		<div>
			<biaoqing @send="send" :value="message" @showchange="(show) => display=show"></biaoqing>
		</div>
  </div>
</template>

<script>
import biaoqing from 'components/biaoqing/biaoqing.vue'
import { getHistory } from 'network/index.js'
import { mapState } from 'vuex'
export default {
  name: 'Chat',
	// inject:['initSocket'],
  components: {
		biaoqing
  },
	data(){
		return {
			uid:Math.ceil(Math.random() * 10),
			message:'',
			display:false,
			msglist:[],
		}
	},
	computed:{
		...mapState(['userInfo'])
	},
	mounted() {
		this.$socket.emit('join',{chatid: this.$route.query.chatid})
	},
	sockets:{
		connect(){
			// this.$socket.emit('connection',this.uid);
			
		},
		coversationList(data){
			console.log(data)
		},
		receiveMessage(data){
			this.msglist.push(data)
			// this.message = ' ';
			console.log(data)
		}
	},
	methods:{
		send(content){
			this.message = content;
			if(content.replace(/\s/g,'').length <= 0){
				this.$toast('您还没写内容呢')
				return
			}
			let msg = {
				Message:this.message,
				userType:'user',
				chatId: this.$route.query.chatid,
				isReader: false,
				ownerId: this.$route.query.oid,
				senderId: this.userInfo.id,
				senderNickName: this.userInfo.phone,
				userId: this.userInfo.id
				};
			this.msglist.push(msg);
			this.message = '';
			this.$socket.emit('sendMessage',msg)
		}
	},
	created(){
		// this.initSocket()
		console.log(this.$route.query.chatid)
		getHistory(this.$route.query.chatid).then(res=>{
			console.log(res.data);
			this.msglist = res.data
		})
	}
}
</script>

<style lang="less" scoped>
	.chat{
		padding: .2rem .4rem 1.466667rem;
		box-sizing: border-box;
		overflow: scroll;
	}
	.scroll{
		height: 12.5rem;
	}
	.msg-box{
		background: #f5f5f5;
		.msg-item{
			// width: 100%;
			clear: both;
			max-width: 8rem;
			padding: .4rem 0;
		}
	}
	.msg-avator-box {
		width: 1rem;
		height: 1rem;
		border-radius: 50%;
		margin: 0 .3rem;
		img{
			width: 100%;
			height: 100%;
		}
	}
	.msg-box{
		.msg-info{
			max-width: 6.3rem;
		}
		.msg-content{
			padding: .3rem;
			border-radius: .2rem;
		}
		.user{
			float: right;
			.msg-avator-box,.msg-info{
				float: right;
			};
			.msg-user-name{
				text-align: right;
			};
			.msg-content{
				background: #ff4081;
				color: #fff;
			}
		}
		.owner{
			float: left;
			.msg-avator-box,.msg-info{
				float: left;
			};
			.msg-user-name{
				text-align: left;
			};
			.msg-content{
				background: #fff;
			}
		}
	}

</style>
