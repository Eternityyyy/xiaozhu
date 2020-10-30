const { Sequelize,DataTypes,Model } = require('sequelize');

const sequelize = new Sequelize('hotel','root','',{
// const sequelize = new Sequelize('hotel','root','098765_qw',{
	host:'localhost',
	dialect:'mysql'
})

const Area = sequelize.define('Area',{
	aid:{
		type:DataTypes.INTEGER,
		primaryKey:true,
		autoIncrement:true,
		allowNull:false
	},
	aName:{
		type:DataTypes.STRING,
	}
},{
	tableName: 'area',
	indexes:[{ unique:true, fields:['aid']}],
	timestamps: false
})

const Dateprice = sequelize.define('Dateprice',{
	id:{
		type:DataTypes.INTEGER,
		primaryKey:true,
		autoIncrement:true,
		allowNull:false
	},
	day: DataTypes.STRING,
	bookState: DataTypes.BOOLEAN,
	priceUnity: DataTypes.STRING,
	price: DataTypes.DECIMAL(10,2),
	roomId: DataTypes.INTEGER
},{
	tableName:'dateprice',
	timestamps: false
})

const Equipment = sequelize.define('Equipment',{
	eid: {
		type:DataTypes.INTEGER,
		primaryKey:true,
		autoIncrement:true,
		allowNull:false
	},
	roomId: DataTypes.INTEGER,
	eName: DataTypes.STRING,
	eIcon: DataTypes.STRING,
	eHas: DataTypes.BOOLEAN
},{
	tableName:'equipment',
	timestamps: false
})

const LandScape = sequelize.define('LandScape',{
	lid: {
		type:DataTypes.INTEGER,
		primaryKey:true,
		autoIncrement:true,
		allowNull:false
	},
	lname: DataTypes.STRING
},{
	tableName: 'landscape',
	timestamps: false
})

const Landscapewithroom = sequelize.define('Landscapewithroom',{
	id: {
		type:DataTypes.INTEGER,
		primaryKey:true,
		autoIncrement:true,
		allowNull:false
	},
	// roomId: DataTypes.INTEGER,
	// landscopeId: DataTypes.INTEGER
},{
	tableName: 'landscapewithroom',
	timestamps: false
})

const Owner = sequelize.define('Owner',{
	oid: {
		type:DataTypes.INTEGER,
		primaryKey:true,
		autoIncrement:true,
		allowNull:false
	},
	oname: DataTypes.STRING,
	opwd: DataTypes.STRING,
	oNickname: DataTypes.STRING,
	identification: DataTypes.BOOLEAN,
	oImg: DataTypes.STRING
},{
	tableName: 'owner',
	timestamps: false
})


const Room = sequelize.define('Room',{
	rid: {
		type:DataTypes.INTEGER,
		primaryKey:true,
		autoIncrement:true,
		allowNull:false
	},
	rName: DataTypes.STRING,
	areaName: DataTypes.STRING,
	latitude: DataTypes.STRING,
	longitude: DataTypes.STRING,
	leaseType: DataTypes.STRING,
	guestNum: DataTypes.INTEGER,
	bedNum: DataTypes.INTEGER,
	commentScore: DataTypes.FLOAT,
	roomArea: DataTypes.INTEGER,
	houseTypeInfo: DataTypes.STRING,
	houseOtherInfo: DataTypes.STRING,
	img_t: DataTypes.STRING,
	img_c: DataTypes.STRING,
	personDesc: DataTypes.STRING,
	roomDesc: DataTypes.STRING,
	traffic: DataTypes.STRING,
	loaction: DataTypes.STRING,
	sellNum: DataTypes.INTEGER,
	lowerPrice: DataTypes.DECIMAL(10,2),
	ownerId: DataTypes.INTEGER
},{
	tableName:'room',
	timestamps: false
})

const RoomImg = sequelize.define('RoomImg',{
	id: {
		type:DataTypes.INTEGER,
		primaryKey:true,
		autoIncrement:true,
		allowNull:false
	},
	roomId: DataTypes.STRING,
	banner: DataTypes.STRING
},{
	tableName: 'roomimg',
	timestamps: false
})

const Rule = sequelize.define('Rule',{
	id:{
		type:DataTypes.INTEGER,
		primaryKey:true,
		autoIncrement:true,
		allowNull:false
	},
	roomId: DataTypes.INTEGER,
	orderType: DataTypes.STRING,
	days: DataTypes.STRING,
	priceDesc: DataTypes.STRING,
	deposit: DataTypes.INTEGER,
	cleanDesc: DataTypes.STRING,
	cleanPrice: DataTypes.INTEGER,
	otherPriceDesc: DataTypes.STRING,
	know: DataTypes.STRING,
	requirement: DataTypes.STRING,
	peopleNum: DataTypes.STRING
},{
	tableName: 'rule',
	timestamps: false
})

const Title = sequelize.define('Title',{
	tid: {
		type:DataTypes.INTEGER,
		primaryKey:true,
		autoIncrement:true,
		allowNull:false
	},
	tname: DataTypes.STRING
},{
	tableName: 'title',
	timestamps: false
})

const titlewithroom = sequelize.define('titlewithroom',{
	id:{
		type:DataTypes.INTEGER,
		primaryKey:true,
		autoIncrement:true,
		allowNull:false
	},
	RoomRid: DataTypes.INTEGER,
	TitleTid: DataTypes.INTEGER
},{
	tableName: 'titlewithroom',
	timestamps: false
})

const Message = sequelize.define('Message',{
	id: {
		type:DataTypes.INTEGER,
		primaryKey:true,
		autoIncrement:true,
		allowNull:false
	},
	chatId: DataTypes.STRING,
	senderId: DataTypes.INTEGER,
	senderNickName: DataTypes.STRING,
	senderAvatar: DataTypes.STRING,
	ownerId: DataTypes.INTEGER,
	userId: DataTypes.INTEGER,
	time: {
		type: DataTypes.DATE,
		defaultValue: Sequelize.NOW
	},
	Message:DataTypes.TEXT,
	isReader: DataTypes.BOOLEAN,
	userType: DataTypes.STRING
},{
	tableName: 'messages',
	timestamps: false,
	createdAt: 'time'
})

const User = sequelize.define('User',{
	id: {
		type:DataTypes.INTEGER,
		primaryKey:true,
		autoIncrement:true,
		allowNull:false
	},
	phone: DataTypes.STRING,
	avatar: DataTypes.STRING,
	password: DataTypes.STRING,
	nickName: DataTypes.STRING
},{
	tableName: 'users',
	timestamps: false,
})

Room.hasMany(Dateprice,{
	foreignKey: 'roomId'
});
Dateprice.belongsTo(Room,{
	foreignKey: 'roomId'
}); 

Room.hasMany(Equipment,{
	foreignKey: 'roomId'
});
Equipment.belongsTo(Room,{
	foreignKey: 'roomId'
}); 
Room.hasMany(RoomImg,{
	foreignKey: 'roomId'
});
RoomImg.belongsTo(Room,{
	foreignKey: 'roomId'
}); 
Room.hasMany(Rule,{
	foreignKey: 'roomId'
});
Rule.belongsTo(Room,{
	foreignKey: 'roomId'
}); 

Owner.hasMany(Room,{
	foreignKey: 'ownerId'
});
Room.belongsTo(Owner,{
	foreignKey: 'ownerId'
}); 

User.hasMany(Message,{
	foreignKey: 'userId'
})
Message.belongsTo(User,{
	foreignKey: 'userId'
}); 

Owner.hasMany(Message,{
	foreignKey: 'ownerId'
})
Message.belongsTo(Owner,{
	foreignKey: 'ownerId'
}); 

Room.belongsToMany(Title,{ through: 'titlewithroom' });
Title.belongsToMany(Room,{ through: 'titlewithroom' });

Room.belongsToMany(LandScape,{ through: 'Landscapewithroom' });
LandScape.belongsToMany(Room,{ through: 'Landscapewithroom' });

module.exports = { Room,Dateprice,Area,Equipment,RoomImg,Rule,Owner,LandScape,Title,Message,sequelize,User }