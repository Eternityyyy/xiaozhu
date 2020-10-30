<template>
	<div class="message">
		<!-- <xz-nav-bar title="消息">
			<van-icon name="arrow-left" size=".48rem"></van-icon>
		</xz-nav-bar> -->
		<van-nav-bar title="消息">
			<template #left>
					<van-icon v-if="back" name="arrow-left" size="18" @click="onClickLeft" />
				</template>
		</van-nav-bar>
		<router-view></router-view>
	</div>

</template>

<script>
	import { mapState } from 'vuex'
	export default {
		name:'OwnerMessage',
		components:{
		},
		computed:{
			...mapState(['ownerInfo'])
		},
		data(){
			return {
				back: this.$route.path != '/owner'
			}
		},
		watch:{
			$route(now){
				this.back = now.path == '/owner' ? false : true
			}
		},
		methods:{
			onClickLeft(){
				this.$router.back(-1);
			}
		},
		created(){
			if(!this.ownerInfo){
				this.$router.push({path:'/owner/login'})
			}
		}
	}
</script>

<style>
</style>
