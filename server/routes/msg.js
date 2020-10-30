var express = require('express');
var router = express.Router();
const { Op } = require('sequelize')

const { Room,Dateprice,Area,Equipment,RoomImg,Rule,Owner,LandScape,Title,Message,sequelize,User } = require('../mysql.js')

router.get('/list',(req,res) => {
	let { uid,oid } = req.query;
	const { limit = 50, offset = 0 } = req.query 
	if(!uid && !oid){
		res.json({msg:'参数错误'})
		return 
	}
	let like;
	if(uid){
		like = 'u' + uid + 'o%';
	}else{
		like = '%o' + oid
	}
	(async () => {
		let msgs = await Message.findAll({
			where: {
				chatId:{
					[Op.like]: like
				}
			},
			include:[
				{
					model: Owner
				},{
					model:User
				}
			],
			order:[
	    		['time','ASC']
	    	],
	    	limit: limit,
	    	offset: offset
		})
		res.json(msgs)
	})()
})

router.get('/:chatid',(req,res) => {
	let chatid = req.params.chatid;
	( async () => {
		let msgs = await Message.findAll({
			where: {
				chatId: chatid
			},
			order:[
	    		['time','ASC']
	    	],
		})
		res.json(msgs)
	})()
})

router.get('/owner',(req,res)=>{
	let oid = req.query.oid;
	console.log(oid)
	( async () => {
		let owner = await Owner.findByPk(oid)
		console.log(owner)
		res.json(owner)
	})()
})

router.post('/owner/login',(req,res) => {
	let { oname,opwd } = req.body
		Owner.findOne({
			where:{
				[Op.and]: {
					oname: oname,
					opwd: opwd
				}
			},
			attributes: ['oid','oname','oNickname','oImg']
		}).then(data =>{
			console.log(data)
			if(data){
				res.json({info:data,code:1})
			}else{
				res.json({msg:'用户名或密码错误',code: 0})
			}
		})
})
module.exports = router