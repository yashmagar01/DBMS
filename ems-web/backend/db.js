// backend/db.js
const mysql = require('mysql2/promise');
require('dotenv').config();

const pool = mysql.createPool({
  host: process.env.DB_HOST || 'localhost',
  user: process.env.DB_USER || 'ems_web',
  password: process.env.DB_PASS || 'Demo@123',
  database: process.env.DB_NAME || 'ems_demo',
  waitForConnections: true,
  connectionLimit: 10,
});

module.exports = pool;
