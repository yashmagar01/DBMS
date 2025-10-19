const pool = require('./db');

(async () => {
  try {
    const [rows] = await pool.query('SELECT COUNT(*) AS count FROM employee');
    console.log('Connected! Employee count:', rows[0].count);
  } catch (err) {
    console.error('Connection error:', err.message);
  } finally {
    process.exit();
  }
})();
