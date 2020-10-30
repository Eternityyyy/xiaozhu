var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var cors = require('cors');

const { Message } = require('./mysql.js')

// 引入路由
var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');
var houseRouter = require('./routes/house');
var orderRouter = require('./routes/order');
var msgRouter = require('./routes/msg');

var app = express();
var server = require('http').Server(app);
// 创建socket
var io = require('socket.io')(server);

server.listen(3001);

app.use(cors());
app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use('/public',express.static(path.join(__dirname, 'public')));

// 挂载路由
app.use('/', indexRouter);
app.use('/users', usersRouter);
app.use('/house', houseRouter);
app.use('/order', orderRouter);
app.use('/msg',msgRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.send('error');
});

const coversationList = {}
// 
io.on('connection',function(socket){
	// 监听用户进入房间
	socket.on('join',val => {
		const { chatid } = val
		console.log(chatid)
		socket.join(chatid, () => {
			coversationList[chatid] = socket.id
			io.in(chatid).emit('coversationList',coversationList)
		})
	})
	//
	socket.on('sendMessage',msg => {
		// console.log(msg)
		(async () => {
			let message = await Message.create(msg)
			socket.to(msg.chatId).emit('receiveMessage',msg)
		})()
	})
})
module.exports = app;
