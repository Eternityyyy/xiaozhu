import Vue from 'vue'
import Vuex from 'vuex'
import VueSocketIO from 'vue-socket.io'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
		userInfo: localStorage.getItem('userInfo') ? JSON.parse(localStorage.getItem('userInfo')) : null,
		ownerInfo: localStorage.getItem('ownerInfo') ? JSON.parse(localStorage.getItem('ownerInfo')) : null,
  },
	getter: {
		
	},
  mutations: {
		setUser(state,info){
			state.userInfo = info;
			localStorage.setItem('userInfo',JSON.stringify(info));
		},
		setOwner(state,info){
			state.ownerInfo = info;
			localStorage.setItem('ownerInfo',JSON.stringify(info))
		},
		logout(state){
			state.userInfo = null;
			localStorage.removeItem('userInfo');
		}
  },
  actions: {
		initSocket: context => {
			if(!context.state.userInfo && !context.state.ownerInfo){
				return
			}
			const vueSocketIo = new VueSocketIO({
				debug: true,
				connection: 'http://127.0.0.1:3001',
				// vuex: {
				// 	store,
				// 	actionPrefix: 'SOCKET_',
				// 	mutationPrefix: 'SOCKET_'
				// }
			})
			vueSocketIo.io.on('connect',() => {
				console.log('client has connected')
			})
			Vue.use(vueSocketIo)
		}
  },
  modules: {
  }
})
