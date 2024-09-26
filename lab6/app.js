const express = require('express');
const { Pool } = require('pg');
require('dotenv').config();

const app = express();
// Thiết lập kết nối PostgreSQL
const pool = new Pool({
  user: process.env.POSTGRES_USER,
  host: process.env.POSTGRES_HOST,
  database: process.env.POSTGRES_DB,
  password: process.env.POSTGRES_PASSWORD,
  port: 5432,
});

app.get('/', async (req, res) => {
  try {
    const result = await pool.query('SELECT NOW()');
    res.send(`PostgreSQL time: ${result.rows[0].now}`);
  } catch (err) {
    console.error(err);
    res.send('Lỗi kết nối đến cơ sở dữ liệu PostgreSQL');
  }
});

const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`Ứng dụng đang chạy tại http://localhost:${port}`);
});
