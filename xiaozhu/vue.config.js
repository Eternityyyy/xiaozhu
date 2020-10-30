const path = require('path');

function resolve(dir){
	return path.join(__dirname, dir)
}

module.exports ={
	assetsDir: 'static',
	chainWebpack: config =>{
		config.resolve.alias
		.set('@',resolve('./src'))
		.set('components',resolve('./src/components'))
		.set('assets',resolve('./src/assets'))
		.set('network',resolve('./src/network'))
		.set('router',resolve('./src/router'))
		.set('views',resolve('./src/views'))
	}
}