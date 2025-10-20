// backend/server.js
const express = require('express');
const cors = require('cors');
const employeesRouter = require('./routes/employees');
const departmentsRouter = require('./routes/departments');
const projectsRouter = require('./routes/projects');
const authRouter = require('./routes/auth');
const { testConnection } = require('./db');

require('dotenv').config();
const app = express();

// CORS configuration for production
const corsOptions = {
  origin: process.env.NODE_ENV === 'production'
    ? (process.env.FRONTEND_URL ? [process.env.FRONTEND_URL] : ['https://dbms-rose-eight.vercel.app'])
    : ['http://localhost:3000', 'http://127.0.0.1:3000', 'http://localhost:5500'],
  credentials: true,
  optionsSuccessStatus: 200
};

app.use(cors(corsOptions));
app.use(express.json());

// Public routes (no authentication required)
app.use('/api/auth', authRouter);

// Protected routes (authentication required)
app.use('/api/employees', employeesRouter);
app.use('/api/departments', departmentsRouter);
app.use('/api/projects', projectsRouter);

// Health check endpoint for deployment monitoring
app.get('/health', async (req, res) => {
  const dbStatus = await testConnection();
  res.json({
    status: 'OK',
    timestamp: new Date().toISOString(),
    database: dbStatus ? 'connected' : 'disconnected'
  });
});

const port = process.env.PORT || 3000;
app.listen(port, async () => {
  console.log(`🚀 EMS Backend server listening on port ${port}`);
  console.log(`📍 Environment: ${process.env.NODE_ENV || 'development'}`);
  console.log(`🔗 CORS enabled for: ${corsOptions.origin}`);

  // Test database connection on startup
  await testConnection();
});
