<template>
  <div id="app">
		<router-view></router-view>
  </div>
</template>

<script>
	import { mapActions } from 'vuex'

export default {
  name: 'App',
  components: {
		// Add,
		// Adds
  },
	methods:{
		...mapActions(['initSocket'])
	},
	created(){
		this.initSocket()
		let htmlWidth = document.documentElement.clientWidth || document.body.clientWidth;
		console.log(htmlWidth);
		let htmlDom = document.getElementsByTagName('html')[0];
		htmlDom.style.fontSize = htmlWidth / 10 + 'px';
	}
}
</script>

<style>
	@import url("assets/common.css");
	@import url("/css/icon.css");
	@import url("/css/resset.css");
	body{
		font-size: 12px;
	}

</style>
