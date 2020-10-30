<template>
	<div class="xz-navbar">
		<van-nav-bar
			:title="title"
			@click-right="onClickRight">
			<template #left>
				<slot></slot>
			</template>
			<template #right>
				<van-icon name="ellipsis" size=".693333rem" />
			</template>
		</van-nav-bar>
		<van-popup 
		v-model="show" 
		position="right" 
		:style="{height: '100%'}" 
		>
			<HeaderPopup></HeaderPopup>
		</van-popup>
	</div>

</template>

<script>
	import HeaderPopup from 'views/header/HeaderPopup.vue'
	export default {
		name:'',
		components:{
			HeaderPopup
		},
		props:['title'],
		data(){
			return {
				show: false
			}
		},
		methods:{
			onClickRight(){
				this.show = true;
			}
		}
	}
</script>

<style>
</style>
