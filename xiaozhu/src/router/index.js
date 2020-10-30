//路由
import Vue from 'vue'
import VueRouter from 'vue-router'
import Register from 'views/user/Register.vue'
import Login from 'views/user/Login.vue'
import Chat from 'views/chat/Chat.vue'
import Message from 'views/chat/Message.vue'
import MsgList from 'views/chat/MsgList.vue'
import OwnerLogin from 'views/owner/Login.vue'
import OwnerMsgList from 'views/owner/OwnerMsgList.vue'
import OwnerMessage from 'views/owner/OwnerMessage.vue'
import OwnerChat from 'views/owner/OwnerChat.vue'
import Home from 'views/home/Home.vue'
import List from 'views/house/List.vue'
import Order from 'views/order/Order.vue'
import HouseDetail from 'views/house/HouseDetail.vue'
import Personalcenter from 'views/user/Personalcenter.vue'
import Esc from 'views/user/Esc.vue'

Vue.use(VueRouter)

const routes = [
  // {
  //   path:'/',
  //   name:'home',
  //   component:Home,
  //   props:true
  // }
  // { //这里是懒加载，暂时不要问，明天讲
  //   path: '/details/:lid',
  //   // route level code-splitting
  //   // this generates a separate chunk (about.[hash].js) for this route
  //   // which is lazy-loaded when the route is visited.
  //   component:() => import(/* webpackChunkName: "about" */ '../views/Details.vue'),
  //   props:true
  // }
	{
		path:'/',
		component: Home
	},
  {
    path:'/login',
    name:'login',
    component:Login
  },
  {
    path:'/register',
    name:'register',
    component:Register
  },
	{
		path:'/user',
		component: Personalcenter
	},
	{
		path:'/house',
		component: List
	},
	{
		path: '/order',
		component: Order
	},
	{
		path:'/detail/:id',
		component: HouseDetail
	},
	{
		path:'/logout',
		component: Esc
	},
	{
		path:'/msg',
		component: Message,
		children: [
			{
				path: '/',
				component: MsgList
			},
			{
				path: 'chat',
				component: Chat
			}
		]
	},
	{
		path: '/owner',
		component: OwnerMessage,
		children: [
			{
				path: '/',
				component: OwnerMsgList
			},
			{
				path: 'chat',
				component: OwnerChat
			}
		]
	},
	{
		path: '/owner/login',
		component: OwnerLogin
	}
]

const router = new VueRouter({
  base: process.env.BASE_URL,
  routes
})

export default router