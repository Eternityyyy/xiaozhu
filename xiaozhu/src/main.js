import Vue from 'vue'
import axios from 'axios'
import router from './router'
import store from './store'
import App from './App.vue'
// import VueSocketIO from 'vue-socket.io'
// import SocketIO from 'socket.io-client'

import { 
	Button,
	Toast,
	SwipeCell,
	Panel,
	Tag,
	Cell,
	CellGroup,
	NavBar,
	Field,
	PasswordInput,
	Slider,
	Tab,
	Tabs,
	Icon,
	Popup,
	List,
	Lazyload,
	Rate,
	Swipe,
	SwipeItem
	} from 'vant';

Vue.use(CellGroup);
Vue.use(Toast);
Vue.use(NavBar);
Vue.use(Field);
Vue.use(PasswordInput);
Vue.use(Button);
Vue.use(SwipeCell);
Vue.use(Panel);
Vue.use(Tag);
Vue.use(Cell);
Vue.use(Slider);
Vue.use(Tab);
Vue.use(Tabs);
Vue.use(Icon);
Vue.use(Popup);
Vue.use(List);
Vue.use(Lazyload);
Vue.use(Rate);
Vue.use(Swipe);
Vue.use(SwipeItem)

Vue.use(Lazyload, {
  lazyComponent: true,
});

Vue.config.productionTip = false

axios.defaults.baseURL='http://127.0.0.1:3000';
Vue.prototype.axios=axios;

Vue.prototype.formTime = function(date,noyear=false,str){
	let d = new Date(date);
	str = str ? str : '-';
	let arr = [d.getFullYear(),d.getMonth() + 1,d.getDate()]
	if(noyear){
		return arr[1] + str + arr[2]
	}
	return arr.join(str)
}
Vue.prototype.timep = function(date){
	let d = new Date(date);
	return d.getTime()
}

Vue.prototype.baseurl = 'http://127.0.0.1:3000'

new Vue({
  router,
  store,
  render: h => h(App),
}).$mount('#app')
