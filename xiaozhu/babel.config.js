module.exports = {
  presets: [
    '@vue/cli-plugin-babel/preset'
  ],
  plugins: [
  	['import',{
  		libraryName: 'vant',
  		libraryDirectory: 'es',
  		style: true
  	},'vant'],
    "@babel/plugin-proposal-optional-chaining"
  ]
}
