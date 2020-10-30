import axios from 'axios'

const api = axios.create({
	baseURL:'http://127.0.0.1:3000',
	// baseURL:'http://188.131.130.80',
	// baseURL:'http://175.24.114.151',
	timeout:6000,
	// withCredentials: true
})
const getHouseInfo = rid => api.get('/house/detail/' + rid)

const getHotHoust = params => api.get('/house/hot',{
	params
})

const getHouse = params => api.get('/house/list',{
	params
})

const getMsgList = params => api.get('/msg/list',{
	params
})

const getHistory = chatid => api.get('/msg/' + chatid)

const getOwner = params => api.get('/msg/owner',{
	params
})

const getCitys = () => api.get('/house/citys')

const getSight = () => api.get('/house/sight')

export {
	getMsgList,getHistory,getOwner,getHotHoust,getCitys,getHouse,getHouseInfo,getSight
}