const pool = require('./db');

(async () => {
  console.log('Testing database connection...\n');
  
  try {
    // Test basic connection
    console.log('✓ Connection pool created');
    
    // Test query
    const [rows] = await pool.query('SELECT COUNT(*) AS count FROM employee');
    console.log('✓ Database query successful');
    console.log('✓ Employee count:', rows[0].count);
    
    // Show tables
    const [tables] = await pool.query('SHOW TABLES');
    console.log('\n✓ Available tables:');
    tables.forEach(t => console.log('  -', Object.values(t)[0]));
    
    console.log('\n✅ Database connection is working correctly!');
  } catch (err) {
    console.error('\n❌ Connection error:', err.message);
    console.error('\nTroubleshooting:');
    console.error('1. Check if MySQL server is running');
    console.error('2. Verify database "ems_demo" exists');
    console.error('3. Check user credentials in .env file');
    console.error('4. Run database_setup.sql in MySQL Workbench');
  } finally {
    process.exit();
  }
})();
