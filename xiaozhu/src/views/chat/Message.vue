<template>
	<div class="message">
		<xz-nav-bar title="消息">
			<van-icon name="arrow-left" size=".48rem" @click="$router.go(-1)"></van-icon>
		</xz-nav-bar>
		<router-view></router-view>
	</div>

</template>

<script>
	import XzNavBar from 'components/header/XzNavBar.vue'
	export default {
		name:'Message',
		components:{
			XzNavBar
		},
		data(){
			return {
				
			}
		}
	}
</script>

<style>
</style>
