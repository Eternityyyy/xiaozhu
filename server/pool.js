const mysql = require('mysql')
const pool = mysql.createPool({
  host:'127.0.0.1',
  port:3306,
  user:'root',
  // password:'098765_qw',
  password:'',
  database:'hotel',
  connectionLimit:10
})

module.exports = pool;