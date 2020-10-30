var express = require('express');
var router = express.Router();
var pool=require('../pool')
/* GET users listing. */

//用户注册的接口
router.post('/register',(req,res)=>{
  //接收用户以post方式提交数据
  let username=req.body.username;
  let password=req.body.password;
  // console.log(username,password);
  let sql='SELECT id FROM users WHERE phone=?';
  pool.query(sql,[username],(error,results)=>{
    if(error) throw error;
    if(results.length==0){
      //将相关的信息写入到user数据表
      sql='INSERT INTO users(phone,password,nickName) VALUES(?,?,?)';
     pool.query(sql,[username,password,username],(error,results)=>{
      if(error) throw error;
      res.send({message:'注册成功！',code:1});
      //现在可以完整将数据插入数据库了
     });
    }else{
      //产生合理的错误信息到客户端
      res.send({message:'注册失败',code:0});
    }
  })
});

//用户登录接口
router.post('/login',(req,res)=>{
  //获取用户输入的用户名和密码信息
  let username=req.body.username;
  let password=req.body.password;
	// console.log(username)
  //现在要以输入的用户名和密码为条件进行查找
  let sql='SELECT id,phone,avatar,nickName FROM users WHERE phone=? AND password=?';
  pool.query(sql,[username,password],(error,results)=>{
  if (error) throw error;
  //如果找到，则代表用户登录成功
  if(results.length == 1){
    res.json({message:'登陆成功',code:1,info:results[0]})
  }else{//否则代表用户登录失败
    res.json({message:'登录失败',code:0})
  }
  })
});

module.exports = router;
